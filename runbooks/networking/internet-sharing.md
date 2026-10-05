# USB tethering and NetworkManager shared-mode diagnosis

Type: reusable procedure. Approved plan classification: **REQUIRES VERIFICATION** for source command candidates; syntax/reference review does not verify a target machine or successful recovery. Migrated in Batch 2A on 2026-10-05.

## Symptoms

A gateway has mobile Internet but downstream clients cannot reach the intended service/Internet, or the tethered uplink and client-facing interface/profile are confused. These are diagnostic possibilities, not reported failures assigned to a current lab host.

## Environment

A Linux gateway actually managed by NetworkManager, a mobile USB uplink and a separately identified downstream Ethernet/client path. The [historical sharing case](../../homelab/incidents/undated-mobile-tethering-router-sharing.md) is a reported working arrangement, not the current lab topology. Use [shared connectivity/DNS diagnosis](connectivity-and-dns.md) for link/routes/resolution.

## Investigation

Discover upstream and downstream interfaces plus the intended profile locally; the current profile may be unbound until active. Inspect (`<connection>`):
```bash
read -r -p 'Inspected NetworkManager connection name: ' NET_CONNECTION
nmcli -f connection.id,connection.interface-name,ipv4.method,ipv6.method connection show id "${NET_CONNECTION:?Select the intended connection}"
```
For a NetworkManager IPv4 shared-mode design, the downstream profile's method should be `shared`; the uplink and downstream are distinct roles. An unexpected method is a hypothesis about this design, not proof that every valid gateway must use it.

Inspect the already-discovered downstream (`<interface>`):
```bash
read -r -p 'Inspected downstream interface: ' DOWNSTREAM_IF
cat "/sys/class/net/${DOWNSTREAM_IF:?Select the downstream interface}/carrier"
```
For a supported Ethernet interface, carrier is link evidence, not proof of DHCP, correct addressing or routing. An absent file requires tool/driver-specific inspection; do not guess a result.

If a bounded uplink reachability probe is appropriate:
```bash
read -r -p 'Approved reachable test host: ' TEST_HOST
read -r -p 'Inspected uplink interface: ' UPLINK_IF
ping -c 4 -I "${UPLINK_IF:?Select uplink}" "${TEST_HOST:?Select an approved test host}"
```
Then inspect a downstream client's obtained address/route/resolver locally and test each layer separately. Do not copy historical subnet values or assume the downstream router's WAN/LAN/AP mode. Packet capture is deferred unless specifically authorized and privacy-filtered.

## Root cause

No general failure cause is established by the successful historical arrangement. Separate mobile-uplink failure, physical carrier, DHCP/address/route, resolver and client application hypotheses. A running NetworkManager process alone does not verify shared-mode behavior.

## Fix

This batch supplies diagnosis, not a provisioning recipe. Do not blindly recreate the old branded profile, disable IPv6, bounce connections or restart NetworkManager. A new/shared profile or correction needs actual interface/settings inspection, conflict review and a known local/fallback management path before a separately authorized change.

## Verification

Verify uplink and downstream client behavior, including required resolution/application access, after a reviewed correction. Record exact inspected host/date and limits; do not use the old successful topology as proof the current profile works. No live network probe or connection change was performed during migration.

## Persistence

Interface names, lease/subnet state and USB enumeration are runtime-dependent. Even a saved profile needs a reconnect/reboot test before persistence is asserted. No historical subnet/profile is added as current config.

## Rollback

Before later mutations, record the relevant prior profile/settings outside Git without secrets and keep alternate access. Restore only the inspected previous configuration if needed; never down the only remote-management link as a generic rollback.

## Lessons learned

Identify the two interface roles first. Carrier, successful uplink reachability and actual downstream access are different observations. The source's connection-up/down and profile-add examples are not proven recovery steps for a current machine.

## References

[scripts: Homelab/embedded-engineering-homelab-inventory.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/embedded-engineering-homelab-inventory.md) — §3 previous gateway scenario and diagnostics; [scripts: Homelab/03_SERVICES_NEXTCLOUD_IOT.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/03_SERVICES_NEXTCLOUD_IOT.md) — Internet-sharing subset.

[NetworkManager connection inspection](https://networkmanager.dev/docs/api/latest/nmcli.html); [IPv4 shared method](https://networkmanager.dev/docs/api/latest/settings-ipv4.html).
