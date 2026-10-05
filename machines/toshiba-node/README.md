# toshiba-node

Status: concrete machine, CURRENT VERIFIED from user-supplied live inspection on 2026-10-05. Canonical repository key and verified hostname: `toshiba-node`.

## Role

TOSHIBA laptop running Debian, verified as the destination of an in-progress manual Nextcloud data copy from the Pi 5 using rsync over SSH on 2026-10-05. See the [dated copy observation](observations.md#manual-nextcloud-data-copy-over-ssh). No automated or complete disaster-recovery backup role is established; operational location remains unknown.

## Hardware / platform

See [inventory.md](inventory.md) for confirmed TECRA hardware and HDD identity. The internal drive is a mechanical HDD, not an SSD.

## OS

Debian GNU/Linux 13 (trixie). Exact inspected Debian/kernel versions and architecture evidence are recorded in [observations.md](observations.md).

## Desired state

No portable provisioning or automated backup profile has been selected. The observed manual-copy role is not evidence of scheduling, retention or a complete backup design. Other old inventory service/monitoring proposals remain unverified.

## Observed state

See [2026-10-05 observations](observations.md) for hardware/storage measurements, software versions, Tailscale enablement/activity/authentication and resolver state. No additional live inspection was performed during documentation editing.

## Machine-specific configuration

Tailscale currently manages the local resolver/MagicDNS configuration according to the supplied evidence. Details and interpretation limits are owned by the dated observations. No configuration changes were made by this documentation update.

## Reproducible configuration references

The shared [Debian platform mapping](../../configs/platforms/debian.md) is still a placeholder. This record does not assert that a portable profile is applied or reconstruct a reproducible configuration from runtime evidence.

## Networking

Tailscale installation and successful authentication into the existing tailnet were verified. Subsequent [DNS verification](observations.md#subsequent-dns-verification) established successful use of Tailscale DNS/MagicDNS with the existing Pi-hole configured upstream. The hostname is not a runtime node address; direct Pi-hole access and general peer reachability remain separate from this DNS evidence.

## Services

Tailscale and the observed manual rsync-over-SSH copy are documented. The copy establishes the specific transfer path, not SSH unit enablement, general peer reachability or a storage-server, container or monitoring role. Source/destination paths and verification limits are owned by the dated observations.

## Known issues

No specific fault was supplied. Copy completion, database consistency and restore testing remain unverified; disk health and connectivity beyond the observed DNS/copy paths are also unknown.

## Incident history

2026-10-05: live evidence established this Toshiba identity and current Debian/Tailscale state. [Inventory reconciliation](inventory.md#old-inventory-reconciliation) records which older facts are corroborated and which proposal is superseded. No incident fix, rollback or restart/persistence test is claimed.
