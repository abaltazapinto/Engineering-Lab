# rpi5

Status: concrete-host record. Positive identification supplied by the user from inspection on 2026-10-05. Repository key `rpi5` replaces the formerly uncertain `raspberrypi` record; the current hostname remains `raspberrypi`. This host is independent of `rpi4-samorinha`.

## Role

Concrete Raspberry Pi 5 node with observed application workloads and host capabilities linked below. Desired workload role and operational location remain unspecified.

## Hardware / platform

See [inventory.md](inventory.md) for verified hardware identity and primary storage. Runtime paths and capacity measurements belong to dated observations.

## OS

See [system observations](observations.md#system-and-connectivity) for the inspected Debian release/version, architecture and kernel. These are observed state, not a permanent platform constraint.

## Desired state

TODO: Confirm desired capabilities and link selected profiles. Running services do not by themselves define desired configuration.

## Observed state

See [observations.md](observations.md) for dated system, uptime, storage, running-service and Docker-access evidence. No live inspection was performed during this documentation update.

## Machine-specific configuration

No configuration changes were performed. Storage persistence, detailed service configuration and machine exceptions remain unverified. Keep credentials external.

## Reproducible configuration references

Platform configuration: shared [Raspberry Pi mapping](../../configs/platforms/raspberry-pi.md), currently a placeholder. No provisioning profile is claimed to be applied.

## Networking

Current hostname `raspberrypi` was supplied as verified identity. Active SSH/Tailscale capabilities and the earlier snapshot observation are recorded in [observations.md](observations.md). No current Tailscale IP, SSH source IP, Machine ID, Boot ID or credentials are stored.

## Services

See [running services observed 2026-10-05](observations.md#running-services-observed-2026-10-05) and [authorized Docker workload evidence](observations.md#docker-workloads-observed-with-authorized-access). Canonical service descriptions are in the [homelab service catalog](../../homelab/services/README.md). Runtime names, images, ports and status ages remain in the dated observation; no NFS server role or additional unsupplied workloads are established.

## Known issues

The inspected user's Docker socket-access limitation is recorded in [Docker access](observations.md#docker-access); later authorized access supplied the workload snapshot. Docker is not described as broken. No groups, permissions or daemon configuration were changed. The [Navidrome project](../../homelab/services/navidrome.md) is explicitly unfinished.

## Incident history

2026-10-05: positive hardware/OS identification resolved the uncertain `raspberrypi` association. The documentation key was renamed to `rpi5`; dated evidence is retained in [observations.md](observations.md). No diagnosed failure, fix, rollback or persistence test is claimed.
