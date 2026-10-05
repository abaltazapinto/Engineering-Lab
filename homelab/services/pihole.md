# Pi-hole

## Purpose and deployment form

Pi-hole FTL is evidenced directly as a running systemd service. It is not shown as a Docker workload in the supplied container inspection.

## Runtime evidence

See [rpi5: running-service observation, 2026-10-05](../../machines/rpi5/observations.md#running-services-observed-2026-10-05) for placement and exact unit evidence. Host-specific runtime state is maintained there.

## Verification limits

DNS configuration, client usage, end-to-end DNS behavior, persistence and backup strategy are not established by running-service evidence. No service changes or restarts were performed.
