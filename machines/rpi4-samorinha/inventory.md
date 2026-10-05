# rpi4-samorinha: inventory

## Concrete host identity

- Verified hostname: `rpi4-samorinha`.
- Hardware: Raspberry Pi 4.
- Operational location: Samorinha / Bragança lab.

Evidence: user-reported interactive SSH inspection on 2026-10-05. These are confirmed inventory facts at that inspection, not guarantees that a hostname or attachment can never change.

## Storage and attached devices

| Device | Identifying evidence | Qualification |
|---|---|---|
| Toshiba Canvio Advance Disk | Observed USB vendor/product ID `0480:0820` | External storage device present at inspection; no serial or filesystem UUID supplied |
| VIA Labs USB hub | Observed USB vendor/product ID `2109:3431` | Hub present at inspection |
| ASMedia device | Observed USB vendor/product ID `174c:1156` | Exact function/model not established |

USB vendor/product IDs identify device types, not necessarily unique physical units. `/dev/sdb1` and `/dev/mmcblk0p*` are observed runtime device paths, not canonical hardware identity. No permanent mount or provisioning configuration is inferred.

See [observations.md](observations.md) for kernel, uptime, capacities, utilization, mount points, connectivity and selected running-service evidence. The [dated block-device layout](observations.md#block-device-layout-from-lsblk) adds partition topology, filesystem types and labels; those observations do not establish permanent device paths or mount configuration. Storage contents and additional application workloads are unknown. Runtime services are not permanent hardware inventory. No passwords or credentials are recorded.
