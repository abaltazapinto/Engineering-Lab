# Historical case: mobile tethering through a Linux gateway

Type/classification: **HISTORICAL VERIFIED**, source-attested. Event date: **unknown**. Migrated on 2026-10-05. This is a reported working setup, not a newly diagnosed failure.

## Observed arrangement

The sources report a previously working path:

```text
mobile uplink → USB tethering → Linux gateway → Ethernet → router → downstream clients
```

The long inventory attributes its previous gateway example to a ThinkStation/Ubuntu environment; the services note describes a generic Linux gateway. These overlapping notes are not independent confirmations. No current machine association or present lab route is inferred.

## Attempts and reported outcome

The source contains a NetworkManager shared-mode connection example and interface/carrier/DHCP/routing observations. It does not show a command transcript proving that exact recipe was applied. Connection activation/deactivation examples are not verified fixes.

The arrangement is described as working, but individual connectivity tests, duration, packet flow and configuration details are not supplied. No failed attempt or root cause is documented; do not manufacture one.

## Historical identifiers and current-state boundary

Old subnet/address values, branded profile names, personal phone/client identifiers and specific router branding are omitted. They are unnecessary to understand the method. Interfaces and router WAN/LAN/AP mode are not established.

This diagram is historical and must not become the [current verified relationships](../networking/topology.md). Current use of this arrangement, the exact source-to-current gateway association and persistence remain unverified. No current profile, static IP, NAT, DHCP or firewall configuration is created.

## Reusable diagnosis

[Internet-sharing diagnosis](../../runbooks/networking/internet-sharing.md) owns the reusable procedure and links shared connectivity/DNS observations. Select actual interfaces/profile and retain fallback access before any later change. No source connection-up/down or IPv6-disable recipe is applied by this migration.

## Sources

[scripts: Homelab/embedded-engineering-homelab-inventory.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/embedded-engineering-homelab-inventory.md) — §3 previous networking scenario; [scripts: Homelab/03_SERVICES_NEXTCLOUD_IOT.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/03_SERVICES_NEXTCLOUD_IOT.md) — Internet sharing. The duplicate inventory in Futuro_eu remains untouched and supplies no second payload.
