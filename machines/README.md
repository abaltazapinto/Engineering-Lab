# Machines

This inventory represents concrete hosts, not generic hardware platforms. Repository keys are stable documentation keys: they are independent of runtime IP addresses and need not follow a mutable hostname. Retain the approved existing keys; no broad rename is needed.

## Host inventory

Identity associations below are supplied by the user in Phase 1.1 and subsequent live evidence on 2026-10-05. Exact OS releases and hardware details remain unknown unless evidenced in a linked record. Role/location columns summarize inventory scope; detailed observations belong to each host record.

| Repository machine key | Hostname / known node name | Platform / OS | Role | Operational location | Current documentation status |
|---|---|---|---|---|---|
| [baltazar-zbook-debian](baltazar-zbook-debian/README.md) | `debian-baltazar` (supplied node name) | Debian / HP ZBook | Primary Debian workstation | Not supplied | Identity confirmed; audio runbook linked; detailed inventory pending |
| [p520-ubuntu](p520-ubuntu/README.md) | `abaltaza-thinkstation-p520-1` (supplied node name) | Ubuntu / ThinkStation P520 | Ubuntu workstation | Not supplied | Identity confirmed; detailed state pending |
| [pve-lab](pve-lab/README.md) | `pve-lab` (supplied node name) | Proxmox | Current Proxmox lab host | Porto | Identity confirmed; hardware/version/workloads pending |
| [pve-braganca](pve-braganca/README.md) | `pve-braganca` (supplied node name) | Proxmox | Separate Proxmox host | Bragança | Identity confirmed; availability condition unresolved |
| [rpi5](rpi5/README.md) | `raspberrypi` (verified current hostname) | Raspberry Pi 5 Model B Rev 1.1 / Debian 13 (trixie) | Concrete Pi 5 node; desired workload role unspecified | Not supplied | Hardware/OS/storage/service and authorized Docker workload evidence dated 2026-10-05 |
| [rpi4-samorinha](rpi4-samorinha/README.md) | `rpi4-samorinha` (SSH-verified hostname) | Raspberry Pi 4 / Linux; distribution release unverified | Pi node | Samorinha / Bragança lab | Hardware/system/storage and selected service evidence dated 2026-10-05; additional workloads unverified |
| [toshiba-node](toshiba-node/README.md) | `toshiba-node` (verified hostname) | TOSHIBA TECRA R940 / Debian 13 (trixie) | Manual Nextcloud data-copy destination | Not supplied | Hardware/software/DNS and in-progress rsync/SSH copy evidence dated 2026-10-05 |

## Runtime observations

Online/offline state is not identity. Supplied Tailscale evidence is recorded in each host's Observed state (or dated observations file), with report date 2026-10-05; the snapshot capture time was not supplied. It is not a new live probe or a complete service-health assessment. No transient status or IP is placed in identity columns.

## Platform and lifecycle boundary

`machines/*` documents what a concrete host actually is/does. `configs/platforms/*` documents how a reusable platform is configured. The [Raspberry Pi platform mapping](../configs/platforms/raspberry-pi.md) remains valid independently of the separate Pi records.

Arch Linux is no longer active or desired infrastructure. The user reports it was removed because the machine/resources were needed for the current Proxmox lab. The exact former-machine-to-Proxmox association has not been established; do not attach that history to a guessed host. No Arch-specific material or current-Arch claim was found in this repository at the Phase 1.1 audit. Any useful pre-existing Arch documentation discovered later is historical/reference material, not current state or an active platform target; preserve it without starting a migration.

The Phase 1 generic `raspberry-pi` template became the `raspberrypi` record. Positive identification on 2026-10-05 established it as a Raspberry Pi 5, so its repository key is now `rpi5`; its current hostname remains `raspberrypi`. The separate Raspberry Pi 4 record `rpi4-samorinha` must not be merged with it. Both use the shared Raspberry Pi platform mapping. Proxmox hosts likewise have separate records.

Use [TEMPLATE.md](TEMPLATE.md) for future concrete hosts. Keep useful dated incidents and link reusable runbooks. Do not record credentials or infer services from connectivity/storage evidence.
