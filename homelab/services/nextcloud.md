# Nextcloud service stack

## Purpose and relationships

The observed related stack comprises a Nextcloud application, associated MariaDB database, Redis component and ClamAV service for malware/antivirus scanning. These purposes and associations were supplied by the user; this is not an inferred Compose design or an end-to-end integration validation.

## Runtime evidence

See [rpi5: Docker workload observation, 2026-10-05](../../machines/rpi5/observations.md#docker-workloads-observed-with-authorized-access) for placement, container names, image tags, published port and reported status. Do not duplicate that machine-specific snapshot here.

## Unverified configuration

Credentials, volumes, networks, Compose configuration, storage contents, backup strategy and complete application/integration health are not established. No deployable configuration or recovery procedure is created from this evidence alone. No containers were modified or restarted.
