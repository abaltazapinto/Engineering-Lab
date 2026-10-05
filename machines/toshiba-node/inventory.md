# toshiba-node: inventory

## Concrete host identity and hardware

CURRENT VERIFIED from the user's live inspection on 2026-10-05:

| Inventory field | Confirmed fact |
|---|---|
| Repository key / hostname | `toshiba-node` |
| Vendor | TOSHIBA |
| Model | TECRA R940 |
| Architecture | x86_64 |
| CPU | Intel Core i5-3230M @ 2.60GHz |
| Logical CPUs | 4; no physical-core count inferred |
| Internal drive | HGST HTS725050A7E630, mechanical HDD; not an SSD |

RAM and disk/partition measurements are owned by [dated observations](observations.md#hardware-and-storage-measurements), not duplicated as a permanent partition/mount configuration. No hardware serial, Machine ID or Boot ID is recorded.

## Confirmed software and configured capability

- Debian GNU/Linux 13 (trixie), installed rather than a future installation proposal. Exact versions belong to the dated observations.
- Tailscale installed and `tailscaled` configured enabled at inspection. Active runtime state and successful tailnet authentication belong to the dated observations; configured enablement alone is not a reboot test.

No desired service stack or unverified workload is added. The verified Tailscale DNS/MagicDNS relationship with the configured Pi-hole resolver is owned by [dated observations](observations.md#subsequent-dns-verification), not a local Pi-hole installation or a copied DNS configuration.

## Old inventory reconciliation

| Older source fact / idea | Classification after live evidence | Treatment |
|---|---|---|
| Toshiba laptop, i5-3230M, HGST disk identity | CURRENT VERIFIED / independently corroborated | Use the concrete TECRA R940 record above; no guessed Proxmox association |
| Approximately 8 GB RAM and 500 GB HDD | Corroborated approximate description | Actual inspected GiB measurements are in observations; nominal approximations and measured units are not conflicting exact values |
| Install Debian as future work | STALE / SUPERSEDED | Debian is already installed; do not retain this as pending work |
| Broad backup-role proposal | Only a manual data-copy destination is CURRENT VERIFIED by new live evidence | See the [copy observation](observations.md#manual-nextcloud-data-copy-over-ssh); no automation, complete backup or recovery design is established |
| Monitoring, MQTT, container or virtualization responsibilities | PLANNED / PROPOSED, not verified | Do not import as current or desired roles |
| Older BIOS/SMART/self-test/throughput/power-on-hour details | Historical source only; not a current health assessment | Not imported from the old note by this update |

Source context: [old Homelab inventory](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/embedded-engineering-homelab-inventory.md), Toshiba section. Current facts are supported by the new live evidence, not by copying the giant inventory. Its duplicate and all source history remain untouched.
