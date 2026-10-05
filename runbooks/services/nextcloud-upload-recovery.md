# Nextcloud upload failure: evidence-led investigation

Type: reusable procedure. Approved plan classification: **REQUIRES VERIFICATION** for source command candidates; syntax/reference review does not verify a target machine or successful recovery. Migrated in Batch 2A on 2026-10-05.

## Symptoms

An upload fails or stops. The [historical Android upload case](../../homelab/incidents/undated-nextcloud-android-upload-recovery.md) owns the source-reported intervention/outcome; it is not a universal repair recipe.

## Environment

Discover the actual deployment and authorized administrative context. The [canonical Nextcloud record](../../homelab/services/nextcloud.md) owns architecture and links current runtime evidence; do not infer Compose, paths, volumes, proxy/TLS, credentials or backups.

## Investigation

First distinguish the client's observed error from connectivity, application and storage evidence. Use [connectivity/DNS diagnosis](../networking/connectivity-and-dns.md) only for the network branch.

For an inspected Docker deployment and already-authorized daemon access, a curated inventory view avoids container IDs:
```bash
docker ps --format 'table {{.Names}}\t{{.Status}}'
```
Do not grant socket access or escalate privileges merely to hide an access error; use the actual authorized access method. Running/healthy status is not proof of a successful upload or antivirus scan.

For a known, authorized storage path (`<path>`):
```bash
read -r -p 'Inspected application storage path: ' STORAGE_PATH
df -h "${STORAGE_PATH:?Select the verified path}"
```
Inspect relevant application/antivirus logs and app state through the deployment's verified admin procedure. Record only a sanitized symptom/result, not raw logs or personal filenames. The old host-side `sudo -u www-data php occ` examples are not copied as executable steps: the current container context and admin path need independent verification.

## Root cause

No root cause is established from the old note. Antivirus integration was investigated, but the source does not identify the precise mechanism or rule out networking, storage, client, proxy or application causes. A running ClamAV container does not prove that the old failure happened on the currently documented host.

## Fix

Select an authorized change only after evidence identifies the relevant failing state. Do not automatically enable/disable files_antivirus, restart containers or change antivirus policy. The historical case records what was reported to precede recovery, not what must be done today.

## Verification

After a separately reviewed correction, test the original client upload and confirm the expected application/scan behavior. Record date, deployment context and result; a container health flag is insufficient. No upload, app change or container operation was performed during Batch 2A.

## Persistence

The historical note has no reboot/restart/repeat-upload evidence. A present repair needs independent persistence and regression checks; do not claim the old recovery proves them.

## Rollback

Record relevant prior app/config state before any later change and follow the actual deployment's reviewed restoration procedure. This guide supplies no guessed app-disable, database or container rollback command.

## Lessons learned

Separate symptom, investigation, intervention and observed recovery. Reuse the historical case as a diagnostic lead, not a proven cause or accepted security-policy change. Keep personal upload data and runtime container IDs out of documentation.

## References

[scripts: Homelab/03_SERVICES_NEXTCLOUD_IOT.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/03_SERVICES_NEXTCLOUD_IOT.md) — Nextcloud historical facts and diagnostic candidates only.

[Docker container listing/formatting](https://docs.docker.com/reference/cli/docker/container/ls/).
