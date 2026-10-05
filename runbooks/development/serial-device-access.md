# Serial-device permission and port-busy diagnosis

Migrated in Phase 2 Batch 1, 2026-10-05. Source notes contain procedures and historical lessons; original incident dates/platform versions are not established unless stated. Migration does not prove a fix on every machine.

## Symptoms

Source incident: an ESP32 upload to a serial device reported permission denied. A device being busy is a separate diagnostic branch. No machine association, exact incident date or successful repeat-upload evidence is established by the migrated subset.

## Environment

Linux serial devices such as ttyUSB/ttyACM. Source permission example used the `dialout` group; discover the actual target device and appropriate access policy rather than assuming the group or device number.

## Investigation

Discover devices and current identity:
```bash
find /dev -maxdepth 1 \( -name 'ttyUSB*' -o -name 'ttyACM*' \) -ls
ls -l /dev/serial/by-id/
id -nG
read -r -p 'Inspected serial device path: ' SERIAL_DEVICE
stat -L "${SERIAL_DEVICE:?Select the current device}"
udevadm info --query=all --name="$SERIAL_DEVICE"
```
`stat -L` follows a selected by-id symlink so permissions are checked on the target device, not on the link itself. Compare the device owner/group/mode with the active session groups and inspect relevant group membership through `getent group`. Account configuration and the groups in an already-running shell are not the same observation.

For a busy port, inspect users of the selected device:
```bash
lsof "$SERIAL_DEVICE"
fuser -v "$SERIAL_DEVICE"
```
Insufficient visibility may require authorized elevated read access. An open serial monitor is a hypothesis until identified; do not kill a process or disable a service based only on the symptom.

## Root cause

The source explains owner/group access and the need to refresh active-session groups after account membership changes. It does not provide enough evidence here to claim the precise original session state or a completed upload fix. Busy-device causes remain hypotheses until an owning process is found.

## Fix

Only if inspection establishes `dialout` as the appropriate device-access group and membership is missing, the source's proposed account correction is:
```bash
sudo usermod -aG dialout "$(id -un)"
```
Run from the intended user's session, not a root shell. Fully log out and back in, then recheck active groups and rediscover the device. `-aG` appends membership; using `-G` without `-a` can replace supplementary groups.

For an identified busy port, close the owning monitor normally before retrying. Do not migrate hard-coded board/tool paths or upload parameters; choose them from the actual project/device.

## Verification

After a fresh login, verify the intended group is active, confirm read/write access to the inspected device, and retry the original operation without hiding it behind unnecessary privilege. Record the actual outcome. No group modification, device access, upload or hardware test was performed during this migration.

## Persistence

An authorized account-group change persists, but an existing shell is not retroactively updated. Device nodes/numbers may be recreated; inspect available by-id links rather than hard-code ttyUSB0. Port ownership and device permissions must be rechecked after reconnecting.

## Rollback

Record prior supplementary groups before changing membership. Remove only membership added by this fix through the platform's account-management procedure if reversal is required; preserve every pre-existing group. Do not alter device mode as a rollback shortcut.

## Lessons learned

World-writable device permissions are temporary and broaden access; running the uploader as root can obscure diagnosis and create root-owned files. These are rejected approaches explained by the source, not claims that they were actually attempted. Differentiate missing device, permission denial and port busy.

## References

[scripts: AGENTE/LINUX_ENGINEERING_NOTEBOOK.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/AGENTE/LINUX_ENGINEERING_NOTEBOOK.md) — sections 1 and 6 only; personal group output, teaching material, networking and host context excluded.

[Debian usermod reference](https://manpages.debian.org/trixie/passwd/usermod.8.en.html).
