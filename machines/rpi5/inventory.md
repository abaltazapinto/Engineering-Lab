# rpi5: inventory

## Concrete host identity

- Repository key: `rpi5`.
- Current hostname: `raspberrypi`.
- Verified hardware model from `/proc/device-tree/model`: Raspberry Pi 5 Model B Rev 1.1.
- Operational location: not supplied.

Evidence: user-supplied verified inspection on 2026-10-05. This is the host formerly documented under `machines/raspberrypi/`, not the separate Raspberry Pi 4 in Samorinha. The repository key does not depend on a runtime address or a mutable hostname.

## Primary storage

Primary storage is NVMe. Device/partition paths, filesystem types/labels, capacities and current mounts are recorded once in the [dated storage layout](observations.md#block-device-layout-from-lsblk). No unique NVMe hardware model, serial or persistent filesystem identifier was supplied; do not treat the observed device path as permanent hardware identity.

## Observation boundary

Installed OS/version, architecture, kernel, uptime, utilization, swap and running services are dated in [observations.md](observations.md). They are not permanent hardware facts or desired configuration. No storage contents or additional workloads are inferred; confidential machine identifiers and credentials are excluded.
