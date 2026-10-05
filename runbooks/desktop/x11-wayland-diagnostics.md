# X11 versus Wayland desktop-automation diagnosis

Migrated in Phase 2 Batch 1, 2026-10-05. Source notes contain procedures and historical lessons; original incident dates/platform versions are not established unless stated. Migration does not prove a fix on every machine.

## Symptoms

An X11-oriented utility appears to run without controlling the intended window; title-based matching stops working; a saved window number becomes invalid. Source notes recommend checking session type but do not establish a timestamped confirmed compositor failure or successful Wayland workaround.

## Environment

Linux desktop session and xdotool-based utility. The external scripts repository remains the owner of mouse/keyboard utility code and application-specific usage. This guide owns reusable session/window diagnosis only.

## Investigation

First establish session and display context:
```bash
printf 'Session type: %s\n' "${XDG_SESSION_TYPE:-unknown}"
printf 'DISPLAY configured: %s\n' "${DISPLAY:+yes}"
command -v xdotool
```
If the session is unknown, collect more evidence before choosing an automation backend. On a confirmed X11 session, inspect candidates without sending events:
```bash
xdotool search --onlyvisible --class 'application-class'
read -r -p 'Current inspected X11 window ID: ' WINDOW_ID
xdotool getwindowname "${WINDOW_ID:?Select a current window}"
```
Replace the generic class with the actual application's inspected class. Review all matches; selecting the last result does not prove it is the intended/private window. Titles can change, and a window ID must be rediscovered after that window closes.

## Root cause

xdotool is an X11 automation tool; native Wayland support is limited. XWayland behavior depends on the target/application and is not proof that arbitrary Wayland windows are controllable. A session mismatch, wrong target or expired ID requires evidence before attributing the symptom to it.

## Fix

Choose a backend appropriate to the inspected session and target. Keep any proposed Wayland-specific replacement pending separate review; no compatibility workaround is verified here. For X11, discover/verify the target immediately before the intended utility action. Do not migrate infinite key/click loops or change desktop security/settings as a diagnostic shortcut.

## Verification

Use read-only window lookup/name inspection to establish target selection. Any later event-sending test must use a disposable intended target and check the actual effect, not just process exit status. This batch does not send desktop events or claim end-to-end X11/Wayland behavior verified.

## Persistence

Session type may change at login. Window IDs last only for that window/session and may be reused; do not put source numeric IDs in permanent config. Class names are matching hints, not immutable identities.

## Rollback

The listed observation commands do not alter desktop state. If a later utility loop is started, stop that specific utility normally and restore reviewed configuration; do not terminate unrelated applications.

## Lessons learned

The source's fixed IDs and last-match selection are not reusable configuration. `xdotool search --id` is not a documented search option in the checked upstream manual; use current name/property inspection instead. Claims that activation or synthetic input reliably targets any browser tab are not established. Idle inhibition is a separate goal from successful input delivery.

## References

[scripts: rato/saber.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/rato/saber.md); [scripts: teclado/saber.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/teclado/saber.md) — session/window diagnostic knowledge only; dialogue, loops and application-specific instructions excluded.

[xdotool upstream compatibility notes](https://github.com/jordansissel/xdotool); [xdotool command manual](https://github.com/jordansissel/xdotool/blob/main/xdotool.pod).
