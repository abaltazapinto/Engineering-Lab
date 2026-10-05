# HP ZBook: SOF / PipeWire internal speakers

## Symptoms

During the Debian audio investigation reported by the user on 2026-10-05, Speaker disappeared when the Headphones HiFi profile was selected. After the Speaker sink was exposed and PipeWire routed audio to it, the internal speakers were still silent: the ALSA Speaker control was muted.

## Environment

User-supplied verified session facts:

- Tiger Lake-H controller using `sof-hda-dsp`.
- Realtek ALC285 codec.
- PipeWire and WirePlumber audio stack.
- UCM exposes both Headphones and Speaker HiFi profiles.
- Application used for successful playback: Brave.

Distribution release, kernel, firmware and audio-tool versions were not supplied. Applicability to other hardware/releases is unverified. Link: [Debian machine record](../../machines/baltazar-zbook-debian/README.md).

Diagnostic layers for this case:

```text
Application
→ PipeWire
→ WirePlumber
→ HiFi Speaker profile
→ ALSA sof-hda-dsp
→ Realtek ALC285
→ internal speakers
```

This is a diagnostic model, not a claim that WirePlumber transports the audio samples.

## Investigation

### Verified observations

- Selecting the Headphones HiFi profile made Speaker disappear.
- Selecting HiFi profile index 2 exposed the Speaker sink **during this investigation**. This is historical evidence, not a reusable index.
- PipeWire object IDs changed during the session.
- Master Playback Switch must be on.
- Speaker Playback Switch must be on.
- Speaker was muted even while PipeWire routed audio to the Speaker sink.

### Rediscover the current environment

The following is an interactive procedure for a future investigation, not a transcript executed while creating this repository. Run observation commands first. Use locally installed tool help/man pages if syntax differs; stop if the expected card, profile or controls cannot be identified.

```bash
lspci -nnk
cat /proc/asound/cards
aplay -l
wpctl status
```

Inspect audio controller/driver information and match the SOF card. Do not infer a codec from the controller name. Where available, inspect the actual HDA codec information:

```bash
rg '^Codec:' /proc/asound/card*/codec*
```

An absent/unreadable codec file is not evidence of a different codec; record the limitation.

Select the **current device ID** for the matching controller from the Devices section of wpctl, then inspect it and enumerate available profiles:

```bash
read -r -p 'Current matching PipeWire device ID: ' AUDIO_DEVICE_ID
wpctl inspect "${AUDIO_DEVICE_ID:?Select the current device first}"
pw-cli enum-params "$AUDIO_DEVICE_ID" EnumProfile
```

Match the Speaker HiFi profile by its current name/description; read its index from the enumeration. Do not assume index 2 remains valid. Record the original selected profile and mixer state before changing them.

Match the ALSA card from the current card listing and inspect controls:

```bash
read -r -p 'Current matching ALSA card index: ' ALSA_CARD
amixer -c "${ALSA_CARD:?Select the matching ALSA card}" sget Master
amixer -c "$ALSA_CARD" sget Speaker
```

The PipeWire device ID, ALSA card index and Pulse-compatible stream index are different namespaces. Never substitute one for another.

## Root cause

Two independent obstacles were evidenced in this session: profile selection affected whether Speaker was exposed, and a muted ALSA Speaker control blocked playback despite software routing to the Speaker sink.

The reason the Speaker control became muted was not established. These observations do not prove a driver, firmware or codec defect.

## Fix

Apply only to the matched current device/card. The successful configuration required the Speaker HiFi profile and both playback switches on.

After inspecting current profiles:

```bash
read -r -p 'Current Speaker HiFi profile index from EnumProfile: ' SPEAKER_PROFILE_INDEX
wpctl set-profile "${AUDIO_DEVICE_ID:?Discover device ID}" "${SPEAKER_PROFILE_INDEX:?Discover profile index}"
wpctl status
```

Profile changes can recreate objects. Rediscover IDs after each change.

If Master is off, unmute it. Unmute Speaker on the matched ALSA card:

```bash
amixer -c "${ALSA_CARD:?Discover ALSA card}" sset Master unmute
amixer -c "$ALSA_CARD" sset Speaker unmute
amixer -c "$ALSA_CARD" sget Master
amixer -c "$ALSA_CARD" sget Speaker
```

Historical successful command: `amixer -c 1 sset Speaker unmute` restored speaker playback in the successful configuration. Card 1 was the matched card then; use the discovered ALSA card now.

To route an existing Brave stream through the Pulse-compatible interface, inspect current sinks and stream properties while Brave is playing audio:

```bash
pactl info
pactl list sinks short
pactl list sinks
pactl list sink-inputs
```

Confirm the interface is available, select the current Tiger Lake-H Speaker sink by its inspected description/name, and identify Brave's playback stream by its application properties. Do not guess based on the first sink or stream.

```bash
read -r -p 'Current inspected Speaker sink name: ' SPEAKER_SINK
read -r -p 'Current Brave sink-input index: ' BRAVE_STREAM
pactl move-sink-input "${BRAVE_STREAM:?Discover current Brave stream}" "${SPEAKER_SINK:?Discover current Speaker sink}"
```

Do not use a wpctl object ID as a pactl sink-input index. Rediscover the stream if playback restarts. This procedure does not require changing the system default sink.

## Verification

Verified session outcome reported by the user on 2026-10-05:

- Speaker playback resumed after unmuting the ALSA Speaker control in the successful configuration.
- Brave was successfully routed to the Tiger Lake-H Speaker afterward.

For a recurrence, inspect both mixer switches, current profile/sink and Brave stream destination; then confirm audible playback from the internal speakers at a comfortable existing volume. Software routing alone is not proof of sound.

```bash
amixer -c "${ALSA_CARD:?Discover ALSA card}" sget Master
amixer -c "$ALSA_CARD" sget Speaker
wpctl status
pactl list sinks short
pactl list sink-inputs
```

Record the new test date/outcome in machine incident history. No audio command, current playback test or raw diagnostic collection was performed while implementing Phase 1.

## Persistence

Persistence across logout, PipeWire/WirePlumber restart, profile changes and reboot was not supplied or verified. Rediscover objects and recheck the profile, mixer switches and routing after any such transition.

Do not add startup scripts, hard-coded object IDs or permanent mixer/profile configuration based solely on this session. A persistent fix requires a separately verified investigation.

## Rollback

Before changes, record the active profile, Master/Speaker switch state and stream destination locally. To restore them, rediscover the device/card/stream, inspect current profiles/sinks, then select the previously recorded profile and route. Use `mute` or `unmute` on the matched mixer control only according to its prior state.

A profile change may destroy the original stream/sink; skip stream restoration if it no longer exists. The provided investigation did not verify rollback, so these are restoration guidance, not a tested recovery claim.

## Lessons learned

- The Headphones HiFi choice did not expose Speaker in this session; inspect profile availability before debugging application routing.
- Routing to Speaker did not resolve silence while the ALSA Speaker control remained muted.
- Inspect Master and Speaker independently.
- Session object IDs and profile/card indices are observations, not permanent configuration.
- Preserve these unsuccessful states because they explain why routing-only diagnosis was insufficient.

## References

- Evidence: user-provided verified findings in the Phase 1 request, 2026-10-05; no original command transcript was provided.
- [Machine record](../../machines/baltazar-zbook-debian/README.md).
- [Repository contract](../../AGENTS.md).
- [WirePlumber wpctl reference](https://pipewire.pages.freedesktop.org/wireplumber/man/wpctl.html) — command semantics.
- [PipeWire pw-cli reference](https://docs.pipewire.org/page_man_pw-cli_1.html) — parameter inspection.
- [ALSA amixer manual source](https://github.com/alsa-project/alsa-utils/blob/master/amixer/amixer.1) — mixer inspection and unmute syntax.
- [PulseAudio pactl manual source](https://github.com/pulseaudio/pulseaudio/blob/master/man/pactl.1.xml.in) — sink/stream inspection and movement.

Tool references support command syntax, not this machine's observed facts.
