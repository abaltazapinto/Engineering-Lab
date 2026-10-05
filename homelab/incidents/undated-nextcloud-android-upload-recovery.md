# Historical case: Nextcloud Android uploads resumed

Type/classification: **HISTORICAL VERIFIED**, source-attested. Event date: **unknown**. Historical host/deployment: **unknown**. Record migrated on 2026-10-05; not a new incident or a current-state assertion.

## Observed at the time

The source says Android uploads stopped. It does not give the exact client error, application version, affected files, logs or duration.

## Investigation and attempted change

ClamAV integration was investigated. The `files_antivirus` app was re-enabled. No specific failed approach, rejected hypothesis or command transcript is recorded; none is invented here.

## Reported outcome

The source reports that uploads resumed after the re-enable action. This is the recorded recovery sequence, not independent validation of the exact causal mechanism or proof that enabling this app resolves every upload failure.

## Root cause and remaining uncertainty

Root cause is not established. Date, physical host, deployment context, configuration, intervening actions, antivirus test results and persistence are unknown. It is not known whether this case belongs to the currently documented Pi 5 deployment.

## Current-state boundary

The [canonical Nextcloud service record](../services/nextcloud.md) owns current documented service relationships and links its machine observations. This case does not replace them, assign a historical host/IP/version, or prescribe a current security-policy change. The old host-side administration examples are not accepted commands for the current container deployment.

## Reusable lesson and verification limits

Use [Nextcloud upload diagnosis](../../runbooks/services/nextcloud-upload-recovery.md) to distinguish observation, app state and deployment context before a reviewed change. For any new recovery, verify the original upload and intended scan behavior, then record persistence separately. No rollback or restart validation was supplied for the historical case.

## Source

[scripts: Homelab/03_SERVICES_NEXTCLOUD_IOT.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/Homelab/03_SERVICES_NEXTCLOUD_IOT.md) — Nextcloud section, pinned source snapshot. Only the reported symptom/intervention/outcome is extracted; personal data, guessed host associations and raw transcripts are excluded.
