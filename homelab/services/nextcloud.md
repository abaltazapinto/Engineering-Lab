# Nextcloud service stack

## Purpose and relationships

The observed related stack comprises a Nextcloud application, associated MariaDB database, Redis component and ClamAV service for malware/antivirus scanning. These purposes and associations were supplied by the user; this is not an inferred Compose design or an end-to-end integration validation.

## Runtime evidence

See [rpi5: Docker workload observation, 2026-10-05](../../machines/rpi5/observations.md#docker-workloads-observed-with-authorized-access) for placement, container names, image tags, published port and reported status. Do not duplicate that machine-specific snapshot here.

## Unverified configuration

Credentials, volumes, networks, Compose configuration, complete backup strategy and complete application/integration health are not established. No deployable configuration or recovery command is inferred from this evidence alone. No containers were modified or restarted.

## Manual data copy — CURRENT VERIFIED

On 2026-10-05, a manual rsync-over-SSH data copy from the documented Pi 5 deployment to Toshiba was observed running successfully. [Toshiba's dated operation record](../../machines/toshiba-node/observations.md#manual-nextcloud-data-copy-over-ssh) owns the exact paths, running-state evidence and limits.

This establishes an implemented manual data-copy relationship, not completed-copy verification, automation, scheduling, retention, versioning, database consistency, restore testing or a complete Nextcloud disaster-recovery backup. No backup system or restore procedure is created here.

## Diagnosis and qualified history

Use the [upload investigation guide](../../runbooks/services/nextcloud-upload-recovery.md). Its [historical Android-upload case](../incidents/undated-nextcloud-android-upload-recovery.md) has an unknown event date and host; it is not automatically an incident on the current Pi 5 deployment or proof of a universal antivirus fix.
