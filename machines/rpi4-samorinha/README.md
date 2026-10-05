# rpi4-samorinha

Status: initial concrete-host record. Identity is user-confirmed; unknown facts remain unknown. Evidence provenance and observation dates are recorded below.

## Role

Concrete Raspberry Pi 4 node in the Samorinha / Bragança lab. Selected runtime capabilities are evidenced in the Services section; application workloads remain unverified.

## Hardware / platform

See [inventory.md](inventory.md) for confirmed hardware and attached-device evidence.

## OS

Linux; see [dated SSH observations](observations.md) for architecture and kernel. Exact installed distribution/release is not established by the supplied kernel-build description.

## Desired state

TODO: Link selected capability profiles and identify intended exceptions. Desired state is not observed state.

## Observed state

See [observations.md](observations.md) for the dated Tailscale and verified SSH evidence, uptime, storage utilization, mount state and selected running services. These values are observations, not permanent configuration.

## Machine-specific configuration

TODO: Record necessary exceptions and non-secret settings once. Keep credentials external.

## Reproducible configuration references

Platform configuration: [raspberry-pi mapping](../../configs/platforms/raspberry-pi.md), currently a placeholder. Desired capability profiles and machine-specific exceptions still require review; this link does not assert the profile is applied.

## Networking

Hostname `rpi4-samorinha` was verified over SSH on 2026-10-05. SSH over Tailscale was successful; see [observations.md](observations.md). No current Tailscale IP or credential is stored. Addresses and runtime device names are not permanent identity.

## Services

See [running services observed 2026-10-05](observations.md#running-services-observed-2026-10-05) for verified active remote access and selected networking, graphical login, printing, discovery and other components. The dated observation owns the unit list and interpretation limits; it is not desired configuration or evidence of an NFS server or additional application workloads.

## Known issues

Observed operational condition: external Toshiba disk utilization was 87% at the 2026-10-05 inspection. See [observations.md](observations.md). This is not yet an incident, a fault diagnosis or evidence of disk failure; data contents are unknown.

## Incident history

2026-10-05: SSH inspection successfully verified hostname and recorded system/storage evidence in [observations.md](observations.md). No diagnosed incident or fix is established by this inspection.
