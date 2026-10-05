# Tailscale peer and remote-access diagnosis

Type: reusable procedure. Approved plan classification: **REQUIRES VERIFICATION** for source command candidates; syntax/reference review does not verify a target machine or successful recovery. Migrated in Batch 2A on 2026-10-05.

## Symptoms

A known peer is not reachable, a hostname resolves unexpectedly, or a Tailscale response is mistaken for proof of application health.

## Environment

Inspected Tailscale CLI/daemon on the actual client. The [current machine index](../../machines/README.md) owns peer-to-host associations; old inventories do not. Use [shared connectivity/DNS diagnosis](connectivity-and-dns.md) first when the underlying link or resolver is in doubt.

## Investigation

Inspect the installed CLI and local peer view:
```bash
tailscale version
tailscale status
```
Review output locally: it can include account, endpoint and address values. Do not paste the table into permanent documentation or treat a last-seen value as current physical-host state.

Select the approved peer (`<tailscale-node>`):
```bash
read -r -p 'Approved current Tailscale peer: ' TS_PEER
tailscale ping --c 3 --timeout 5s "${TS_PEER:?Select an approved peer}"
```
Check installed `tailscale ping --help` before use. This sends bounded diagnostic traffic; run it only against the intended authorized peer. Record whether the attempted path responded without preserving unnecessary endpoint/IP details.

A Tailscale-layer response does not establish SSH authentication, the OS listener or a healthy application. Continue with [SSH diagnosis](ssh-remote-access.md) or the intended service's diagnostic path.

## Root cause

A failed peer test alone does not identify host power, network, daemon, policy or service failure. Use evidence to distinguish these possibilities. The current [pve-braganca condition](../../machines/pve-braganca/README.md) remains unresolved; this runbook does not diagnose it.

## Fix

No daemon reset, re-authentication, logout, ACL change or key creation is prescribed from the old notes. A correction requires the observed failure and approved access; avoid disrupting the only remote-management path.

## Verification

Verify the intended remote operation separately after any authorized correction. A successful peer probe and a successful application connection answer different questions. No peer connection was tested during migration.

## Persistence

Peer status and addresses are observations. Do not use an old Tailscale IP as permanent host identity, and do not infer physical-machine count from multiple install identities. Verify reconnect/restart behavior separately.

## Rollback

These local observations and peer probes do not change daemon/configuration state. A later mutating fix requires a saved relevant prior state and a local/fallback access plan.

## Lessons learned

Resolve identities from canonical machine records before probing. The superseded Pi-4 association in old source tables is not imported. Historical snapshots do not replace current dated observations or prove an outage cause.

## References

[scripts: Homelab/02_TAILSCALE_NETWORK_MAP.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/02_TAILSCALE_NETWORK_MAP.md) — core/baseline diagnostics only; [scripts: Homelab/embedded-engineering-homelab-inventory.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/embedded-engineering-homelab-inventory.md) — §10 command candidates, no old peer table.

[Tailscale CLI reference](https://tailscale.com/docs/reference/tailscale-cli).
