# rpi4-samorinha: dated observations

## 2026-10-05 — interactive SSH inspection

Source: verified findings supplied by the user after interactive SSH inspection. No new SSH connection or live hardware inspection was performed while editing this record.

### System and connectivity

- Linux, architecture `aarch64`.
- Kernel: `6.12.75+rpt-rpi-v8`.
- Reported build: Raspberry Pi/Debian kernel build. This alone does not establish the installed distribution/release.
- Uptime at inspection: 12 days, 19 hours, 44 minutes.
- SSH access over Tailscale successfully verified.

The earlier supplied Tailscale snapshot also showed this node online; its capture time was not supplied (report received 2026-10-05). No IP is retained as permanent identity. See [inventory.md](inventory.md) for hostname/hardware and attached-device identification.

### Filesystem usage from df

| Filesystem / device path | Observed mount | Total | Used | Available | Used % |
|---|---|---|---|---|---|
| Root: `/dev/mmcblk0p2` | Root filesystem | 58G | 13G | 44G | 22% |
| Boot: `/dev/mmcblk0p1` | `/boot/firmware` | 510M | Not supplied | Not supplied | Not supplied |
| External Toshiba: `/dev/sdb1` | `/media/abaltaza/TOSHIBA EXT` | Approximately 932G | 808G | 124G | 87% |

Values are supplied reported measurements, not permanent capacity assignments or desired configuration. Runtime paths and current mounts may change. The external mount path is retained here because it is useful operational evidence; the embedded username is not a credential or an assertion of a permanent login account.

### Block-device layout from lsblk

Additional user-supplied evidence observed 2026-10-05. Sizes below are block-device/partition sizes reported by `lsblk`, distinct from the filesystem totals reported by `df` above. Filesystem types, labels, device paths and attachments describe the inspected layout, not permanent identity or desired configuration.

| Observed device | Parent | Reported size | Filesystem / use | Label |
|---|---|---|---|---|
| `mmcblk0` | — | 59.5G | Parent block device | Not supplied |
| `mmcblk0p1` | `mmcblk0` | 512M | vfat | `bootfs` |
| `mmcblk0p2` | `mmcblk0` | 59G | ext4 | `rootfs` |
| `sdb` | — | 931.5G | Parent block device | Not supplied |
| `sdb1` | `sdb` | 931.5G | NTFS | `TOSHIBA EXT` |
| `zram0` | — | 2G | swap | Not supplied |
| `loop0` | — | 2G | swap | Not supplied |
| `sda` | — | 0B | Purpose unknown | Not supplied |

`lsblk` confirmed the boot, root and external mount locations already recorded in the filesystem-usage table; root was mounted at `/`. Their paths and current mount state are not repeated here. USB identification remains in [inventory.md](inventory.md); no additional physical-device association or purpose is inferred for `sda`, `zram0` or `loop0` beyond the supplied evidence.

### Operational condition

The external Toshiba filesystem was at **87% utilization**. Flag for a later evidence-based capacity review. No incident, fault, cause or urgency threshold has been established. Do not infer the contents, data ownership, retention policy, services or disk health from this measurement.

### Running services observed 2026-10-05

Source: additional verified runtime evidence supplied by the user. These units were running at observation; this does not establish boot enablement, persistence or current health after that date.

| Running systemd units | Evidenced capability / interpretation |
|---|---|
| `ssh.service`, `tailscaled.service` | Verified active SSH and Tailscale remote-access capabilities; successful SSH over Tailscale is documented above |
| `NetworkManager.service`, `wpa_supplicant.service` | Observed networking components; connection type and wireless association are not established by these units alone |
| `lightdm.service` | Evidence of a graphical login environment; no active graphical user session is established |
| `cups.service`, `cups-browsed.service` | Observed printing capability; configured printers or successful printing are not established |
| `avahi-daemon.service` | Active mDNS/DNS-SD discovery; advertised services were not supplied |
| `rpcbind.service`, `nfs-blkmap.service` | Observed NFS-related components only; no NFS server role, exports or active mounts are established |
| `bluetooth.service` | Observed Bluetooth service; paired devices or active connections were not supplied |

This is a selected operational service observation, not an exhaustive base-system unit inventory. Do not infer Docker, Nextcloud, Pi-hole, MQTT or other workloads from it. Their presence or absence was not established.

### Docker CLI availability observed 2026-10-05

The attempted command `docker ps -a` returned `-bash: docker: command not found`. The Docker CLI was not installed/available in the inspected shell at that time. No container listing was obtained.

This does not establish the absence of every container runtime, a Docker daemon or container workloads. It is not a permanent constraint or a decision against running containers in the future.

### Limits and follow-up

Installed distribution/release, exact storage identity (serial/UUID), mount persistence, detailed service configuration and additional workloads remain unverified. Future checks should rediscover current devices, mounts and service state. No configuration was changed and no fix, rollback or persistence test is claimed.
