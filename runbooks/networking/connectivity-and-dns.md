# Linux connectivity and DNS diagnosis

Type: reusable procedure. Approved plan classification: **REQUIRES VERIFICATION** for source command candidates; syntax/reference review does not verify a target machine or successful recovery. Migrated in Batch 2A on 2026-10-05.

## Symptoms

A host/service is unreachable, names fail to resolve, or a connection appears active without the required application working. Separate physical link, address/route, name resolution, transport/listener and application layers.

## Environment

Linux with the inspected networking tools. `ip`/`ss` are iproute2 tools; NetworkManager and systemd-resolved are optional, not generic Linux assumptions. Use only installed tools and known authorized test destinations. Outputs may contain private addresses/accounts: inspect locally and record only sanitized relevant evidence.

## Investigation

Start with local read-only observations:
```bash
ip -br link
ip -br addr
ip route
ss -lntup
```
Inspect the actual interface, route and intended service listener; insufficient privileges may hide process details. A listener's presence is not proof clients can reach it.

If NetworkManager manages this host:
```bash
command -v nmcli
nmcli device status
nmcli connection show --active
```
Discover names; never choose the first interface or assume a remembered address. Do not use secret-display options.

For the resolver, first inspect its ownership and existing state:
```bash
ls -l /etc/resolv.conf
readlink -f /etc/resolv.conf
cat /etc/resolv.conf
```
Read locally; do not commit resolver contents. If systemd-resolved is actually present, `resolvectl status` is an additional view, not a required tool on every machine.

Select an authorized host (`<host>`) for bounded tests:
```bash
read -r -p 'Approved hostname: ' NET_HOST
getent hosts "${NET_HOST:?Select an approved host}"
ping -c 4 "$NET_HOST"
```
`getent` tests the system name-service path, not DNS alone. If installed and a DNS query is appropriate, `dig "$NET_HOST"` examines DNS separately. A ping failure can reflect filtering, not necessarily a dead host; success establishes only the tested reachability. Test the intended application separately.

## Root cause

No universal root cause is established. Compare evidence across layers before choosing a hypothesis. The [historical resolver overwrite](../../homelab/incidents/undated-resolver-file-overwrite.md) records a change, not a verified cause of a current DNS failure.

## Fix

Choose the smallest correction only after the failing layer and configuration owner are established. Do not overwrite resolv.conf, restart NetworkManager, unblock every radio or reload a driver as an automatic response. Retain a reviewed prior state and fallback management path before a mutating fix.

## Verification

Repeat the failing name/route/service test and the user's application action after a separately authorized fix. Record outcome/date and remaining limits. Batch 2A checked documentation and command syntax/reference semantics only; no live lab or external-host tests were run.

## Persistence

Runtime interfaces, addresses, routes and resolver state can change. A transient recovery is not evidence of persistence across reconnect/login/reboot; verify those transitions separately before documenting them as supported.

## Rollback

Observation commands do not change configuration. For a later correction, restore the inspected previous state through its actual manager; no universal resolver/network reset recipe is supplied.

## Lessons learned

Reachability, DNS and application health are different tests. Never publish raw diagnostic bundles. Use this as the shared diagnostic owner: [Tailscale](tailscale.md), [SSH](ssh-remote-access.md) and [Internet sharing](internet-sharing.md) add their specific branches rather than duplicate these commands. Current Pi-hole architecture is owned by its [service record](../../homelab/services/pihole.md).

## References

[scripts: AGENTE/LINUX_ENGINEERING_NOTEBOOK.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/AGENTE/LINUX_ENGINEERING_NOTEBOOK.md) — §14 and network quick card; [scripts: Homelab/02_TAILSCALE_NETWORK_MAP.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/02_TAILSCALE_NETWORK_MAP.md) — diagnostic sections only; [scripts: Homelab/03_SERVICES_NEXTCLOUD_IOT.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/03_SERVICES_NEXTCLOUD_IOT.md) — DNS diagnostic subset.

[NetworkManager nmcli reference](https://networkmanager.dev/docs/api/latest/nmcli.html). Check installed `ip`, `ss`, `getent`, `dig` and `resolvectl` help/manuals for target applicability.
