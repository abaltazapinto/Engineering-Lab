# rpi5: dated observations

## 2026-10-05 — verified inspection

Source: verified evidence supplied by the user. No new SSH connection, Docker access attempt or live system inspection was performed while editing this record. See [inventory.md](inventory.md) for canonical hardware identity.

### System and connectivity

- Architecture: arm64 / aarch64.
- OS: Debian GNU/Linux 13 (trixie).
- Debian version observed: 13.5.
- Kernel: `6.12.75+rpt-rpi-2712`.
- Uptime: approximately 74 days, 23 hours at inspection.

The earlier supplied Tailscale snapshot showed this host online (report received 2026-10-05; snapshot capture time not supplied). Active SSH/Tailscale service evidence is recorded below. No current Tailscale IP or SSH source IP is retained, and running services alone do not establish a new end-to-end SSH test.

### Block-device layout from lsblk

| Observed device | Parent | Reported size | Filesystem / use | Label | Observed mount |
|---|---|---|---|---|---|
| `nvme0n1` | — | 238.5G | Primary NVMe block device | Not supplied | — |
| `nvme0n1p1` | `nvme0n1` | 512M | vfat | `bootfs` | `/boot/firmware` |
| `nvme0n1p2` | `nvme0n1` | 238G | ext4 | `rootfs` | `/` |
| `zram0` | — | 2G | swap | Not supplied | Swap device |
| `loop0` | — | 2G | swap | Not supplied | Swap device |

These are observed paths, topology and current mount/use state; no permanent mount configuration or stable device numbering is established.

### Filesystem usage from df

| Filesystem | Size | Used | Available | Used % |
|---|---|---|---|---|
| Root, identified in the block-device table | 234G | 168G | 54G | 76% |

Filesystem totals and block-device/partition sizes are different reported measurements. Utilization is dated runtime state, not a fixed assignment or a diagnosis of a storage problem. Storage contents remain unknown.

### Running services observed 2026-10-05

These relevant units were running at observation. This does not establish boot enablement, persistence, complete application health or additional workloads.

| Running systemd units | Evidenced capability / interpretation |
|---|---|
| `docker.service`, `containerd.service` | Docker Engine and containerd verified running; see the separately obtained Docker workload observation below |
| `pihole-FTL.service` | Pi-hole FTL verified running directly as a systemd service, not a listed Docker workload; DNS configuration and end-to-end DNS behavior were not supplied |
| `tailscaled.service`, `ssh.service` | Verified active Tailscale and SSH remote-access capabilities |
| `NetworkManager.service`, `wpa_supplicant.service` | Observed networking components; connection type/wireless association not established |
| `avahi-daemon.service` | Observed mDNS/DNS-SD discovery capability; advertised services not supplied |
| `cups.service`, `cups-browsed.service` | Observed printing capability; configured printers/successful printing not established |
| `lightdm.service` | Evidence of a graphical login environment; active graphical session not established |
| `rpcbind.service`, `nfs-blkmap.service` | NFS-related components only; no NFS server role, exports or active NFS mounts established |
| `bluetooth.service` | Observed Bluetooth service; paired devices/connections not supplied |

This is a selected runtime observation, not an exhaustive base-system service inventory. Application workload evidence comes from the separate Docker inspection below; do not infer MQTT or other unsupplied workloads from the systemd list.

### Docker access

`docker ps -a` as user `abaltaza` returned permission denied while connecting to `/var/run/docker.sock`.

- Docker CLI is installed.
- Docker daemon is running, supported by the supplied running-service evidence.
- The inspected user could not access the Docker daemon socket.
- Container inventory was not available from this unprivileged attempt; the later supplied authorized inspection is recorded below.

This is an observed access limitation, not evidence that Docker is broken. The underlying permission/group configuration was not supplied, so no specific permission root cause is asserted. No groups, socket permissions or configuration were changed during documentation. The username is retained only as necessary context for this access result.

### Docker workloads observed with authorized access

Source: additional verified evidence supplied by the user from `sudo docker ps -a` on 2026-10-05. The documentation update did not run Docker commands or modify/restart containers. Container IDs are omitted; names, status durations and published ports describe this inspection only.

| Container name at inspection | Image observed | Status observed | Published port evidence | Purpose / qualification |
|---|---|---|---|---|
| `nc_clamav` | `clamav/clamav-debian:stable_base` | Up 3 weeks (healthy) | Not supplied | ClamAV associated with Nextcloud malware/antivirus scanning; reported health status is not an end-to-end scan test |
| `navidrome` | `deluan/navidrome:latest` | Up 2 months | 4533 published; exact binding/mapping not supplied | Self-hosted music server; user explicitly considers the project/setup unfinished |
| `nc_app` | `nextcloud:31-apache` | Up 2 months | Host 8080 → container 80 | Nextcloud application |
| `nc_db` | `mariadb:11` | Up 2 months | Not supplied | MariaDB associated with the Nextcloud deployment |
| `nc_redis` | `redis:7` | Up 2 months | Not supplied | Redis associated with the Nextcloud deployment |

Nextcloud, MariaDB, Redis and ClamAV form an observed related service stack. These associations/purposes are user-supplied evidence; no credentials, volumes, Docker networks, Compose definitions, backup strategy or successful integration tests are inferred from `docker ps`. Running status is not proof of complete application functionality. Image tags are observed values, not approved desired versions or immutable image digests.

Canonical service descriptions: [Nextcloud stack](../../homelab/services/nextcloud.md), [Navidrome](../../homelab/services/navidrome.md), and [Pi-hole](../../homelab/services/pihole.md). Pi-hole runs directly as the systemd service recorded above, not as a workload in this Docker list. Status ages are dated observations, not permanent state.

### Historical Docker learning evidence

At the same 2026-10-05 inspection, container `nervous_knuth` used image `hello-world` and was Exited (0) approximately 5 months earlier. The user identifies it as the initial Docker test. It is historical learning evidence, not an active homelab service; no exact test date is inferred from the relative age. Its generated container name is not a canonical service or machine identity.

### Limits and follow-up

Operational location, desired workload role, detailed service/container configuration, storage contents, backup strategy, persistent mount settings and behavior across restart/reboot remain unknown. Container inventory is now evidenced for the supplied authorized snapshot; future authorized inspection should rediscover current state. No additional workloads, fix, rollback or persistence test are claimed. Navidrome remains unfinished.

Machine ID, Boot ID, current Tailscale IP, SSH source IP, passwords and credentials are deliberately omitted.
