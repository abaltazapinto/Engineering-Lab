# Current verified lab relationships

Type/classification: **CURRENT VERIFIED** from the canonical records at baseline `903cc25de7658e5bac6dc9d1ccc86e6bc6b198db` and the user-supplied Toshiba live inspection recorded on 2026-10-05. Compiled on 2026-10-05; documentation editing performed no new live topology discovery.

## Evidence-supported relationships

This is a relationship index, not a completed LAN/WAN wiring diagram or proof of current end-to-end reachability.

| Documented relationship | Canonical evidence owner |
|---|---|
| Pi 5 host and documented service records | [rpi5 observations](../../machines/rpi5/observations.md), [Nextcloud](../services/nextcloud.md), [Pi-hole](../services/pihole.md), [Navidrome](../services/navidrome.md) |
| Pi 4 remote-access path: SSH over Tailscale was reported successfully inspected | [rpi4-samorinha observations](../../machines/rpi4-samorinha/observations.md) |
| Toshiba authenticated into the existing tailnet; Tailscale manages its local resolver/MagicDNS configuration | [toshiba-node observations](../../machines/toshiba-node/observations.md) |
| Toshiba → Tailscale DNS/MagicDNS → configured existing Pi-hole resolver; client-side DNS query succeeded | [Toshiba DNS verification](../../machines/toshiba-node/observations.md#subsequent-dns-verification), [Pi-hole service](../services/pihole.md) |
| Pi 5 → rsync over SSH → Toshiba: manual Nextcloud data copy observed in progress | [Toshiba copy observation](../../machines/toshiba-node/observations.md#manual-nextcloud-data-copy-over-ssh), [Nextcloud service](../services/nextcloud.md) |
| Concrete host identities and separate Proxmox hosts | [machine index](../../machines/README.md) and linked host records |

Service descriptions own purpose/dependencies; machine observations own placement/runtime details. A running remote-access component is not a newly verified pairwise connection between every listed host. The source client for the Pi 4 inspection is not identified here.

## Identity and current-state boundaries

The current `raspberrypi` hostname belongs to [rpi5](../../machines/rpi5/README.md), not the [rpi4-samorinha](../../machines/rpi4-samorinha/README.md) record. The old source assignment is superseded. Hostnames are useful documented names, not immutable hardware identity; runtime addresses remain dated observations in owning records.

Arch is not an active platform. Toshiba's narrow manual-copy role is supported by new live evidence; broader old Toshiba roles, Proxmox hardware associations, Pi 5 location and planned services are not adopted. The unresolved [Bragança availability condition](../../machines/pve-braganca/README.md) has no established root cause.

The separate attempted `pve-lab` inspection actually targeted the HP ZBook `baltazar`; it does not identify or establish Proxmox implementation on [pve-lab](../../machines/pve-lab/README.md). That host's record remains unchanged and requires its own correctly targeted inspection.

## Unknown links

Beyond the evidence-supported relationships above, actual LAN subnets, uplinks, routers/switches, bridge membership, routing/NAT, DNS paths and other cross-host reachability remain unverified. The observed copy establishes SSH transport, not its underlying Tailscale/LAN route. No additional connecting arrows or network configuration are invented.

Subsequent Tailscale DNS status and successful client-query evidence verify the configured Toshiba → Tailscale DNS/MagicDNS → Pi-hole relationship above. This is not a direct Toshiba-to-Pi-hole network link, a local Pi-hole role or proof of the DNS path for every tailnet client. Actual forwarding/cache behavior for an individual query remains unobserved.

The [historical mobile-sharing path](../incidents/undated-mobile-tethering-router-sharing.md) is retained separately; it is not a current gateway designation. No private/Tailscale addresses or historical interface/profile values are needed in this relationship index.

## Procedures

Use [connectivity/DNS](../../runbooks/networking/connectivity-and-dns.md), [Tailscale](../../runbooks/networking/tailscale.md), [SSH](../../runbooks/networking/ssh-remote-access.md) and [Internet sharing](../../runbooks/networking/internet-sharing.md) for evidence-led diagnosis. New current links require dated verification before this index is extended.
