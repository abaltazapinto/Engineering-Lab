# Historical case: resolver file overwritten during networking work

Type/classification: **HISTORICAL VERIFIED**, source-attested. Event date and host: **unknown**. Migrated on 2026-10-05.

## Observation

The source reports that `/etc/resolv.conf` had previously been overwritten during networking work. It also lists DNS diagnostic commands. It does not supply original/new file contents, a timestamp or a proven resolution failure.

## Attempts and outcome

No exact change command, actor, attempted recovery, failed approach or successful fix is documented. The nearby diagnostic list is not evidence that every command was run or restored service.

## Root cause and uncertainty

No root cause or impact is established. Resolver ownership/manager, host, nameservers, symptom and persistence are unknown. This note does not diagnose the current Pi-hole service, either Proxmox host or a current DNS outage.

## Historical versus current state

No old resolver/IP/subnet content is copied as current configuration. Current [Pi-hole service facts](../services/pihole.md) are owned separately and do not identify this historical host. The reported file change remains a caution, not evidence of today's resolver configuration.

## Reusable lesson

Use [connectivity and DNS diagnosis](../../runbooks/networking/connectivity-and-dns.md) to identify resolver ownership before any correction. Do not overwrite a managed resolver file or restart networking without understanding the failure. No tested rollback/recovery recipe can be extracted from this source.

## Source

[scripts: Homelab/03_SERVICES_NEXTCLOUD_IOT.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/03_SERVICES_NEXTCLOUD_IOT.md) — Pi-hole / DNS section. Only the source-attested overwrite observation is retained; no guessed chronology, raw resolver file or credential data.
