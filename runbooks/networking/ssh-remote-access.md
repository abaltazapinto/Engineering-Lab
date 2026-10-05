# SSH and remote-access troubleshooting

Type: reusable procedure. Approved plan classification: **REQUIRES VERIFICATION** for source command candidates; syntax/reference review does not verify a target machine or successful recovery. Migrated in Batch 2A on 2026-10-05.

## Symptoms

An SSH connection times out/refuses connection, authentication fails, or a changed host-key warning appears. Do not treat these as one failure class.

## Environment

OpenSSH client and an approved target/account. Service/unit names, ports and authentication policy must be discovered; do not assume a Debian-only `ssh.service` or a universal port. The [Tailscale guide](tailscale.md) and [connectivity/DNS guide](connectivity-and-dns.md) own underlying reachability tests.

## Investigation

Inspect the client:
```bash
ssh -V
```
Only when an authenticated diagnostic connection is authorized, select `<host>` with its approved account or existing configured alias:
```bash
read -r -p 'Approved SSH target or configured alias: ' SSH_TARGET
ssh -v -o ConnectTimeout=5 -o BatchMode=yes -T "${SSH_TARGET:?Select an approved target}" true
```
This tests key/noninteractive authentication and an authorized remote no-op command; it is not a password-login test. A legitimate policy can forbid remote commands while allowing another access mode. Verify a new/changed host-key fingerprint through a trusted independent channel; do not disable checking, automatically accept it or delete known-host entries to hide the warning. Verbose output is private diagnostic evidence, not a repository transcript.

On the server only through existing authorized access, inspect the actual service manager/listeners. On systemd hosts, discover the unit and then inspect it:
```bash
systemctl list-unit-files 'ssh*.service' --no-pager
read -r -p 'Inspected SSH service unit: ' SSH_UNIT
systemctl status "${SSH_UNIT:?Select the discovered unit}" --no-pager
systemctl is-enabled "$SSH_UNIT"
journalctl -u "$SSH_UNIT" -b -n 50 --no-pager
```
A disabled unit is not necessarily stopped, and an active unit does not prove end-to-end SSH health. No unit result or log output is copied into this generic guide.

## Root cause

Timeout, refusal, authentication and host-key warnings narrow different hypotheses. Neither service status nor a Tailscale response alone proves the cause. Inspect approved target/account, route/policy/listener and authentication evidence without guessing credentials or permissions.

## Fix

Do not generate/copy keys, chmod personal SSH files, change groups, restart the daemon or relax host-key checking automatically. Choose a specifically evidenced and authorized correction; preserve an alternate access path before server-side changes.

## Verification

Repeat the originally intended access method, not only a ping or no-op test. Record the actual result/date in the owning machine record. The existing [Pi 4 record](../../machines/rpi4-samorinha/README.md) owns its reported successful SSH-over-Tailscale inspection; no new remote test was performed here.

## Persistence

Key/account policy, service enablement and active runtime state are distinct. Check reconnect/reboot separately before claiming a persistent repair; no actual account/key payload belongs in this runbook.

## Rollback

Observation/probe steps do not alter service configuration, but SSH may update local known-host state after user-approved trust decisions. Review a precise restoration plan before any later config/authentication fix; do not invalidate unrelated trusted hosts.

## Lessons learned

Use the actual service/port/access mode. A key-only test failure does not establish that every login method is broken. Preserve diagnostic outcomes without retaining verbose logs, user paths or source IPs.

## References

[scripts: AGENTE/LINUX_ENGINEERING_NOTEBOOK.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/AGENTE/LINUX_ENGINEERING_NOTEBOOK.md) — §§11–12,15 diagnostic subset only; [scripts: Homelab/02_TAILSCALE_NETWORK_MAP.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/02_TAILSCALE_NETWORK_MAP.md) — SSH examples reviewed but personal identifiers excluded.

[OpenSSH client manual](https://man.openbsd.org/ssh).
