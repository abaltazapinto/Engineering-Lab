# Pi-hole

## Purpose and deployment form

Pi-hole FTL is evidenced directly as a running systemd service. It is not shown as a Docker workload in the supplied container inspection.

## Runtime evidence

See [rpi5: running-service observation, 2026-10-05](../../machines/rpi5/observations.md#running-services-observed-2026-10-05) for placement and exact unit evidence. Host-specific runtime state is maintained there.

## Verification limits

Running-service evidence alone does not establish DNS configuration or client behavior. Subsequent [Toshiba DNS verification](../../machines/toshiba-node/observations.md#subsequent-dns-verification) establishes Tailscale's configured Pi-hole resolver relationship and a successful client-side query through Tailscale DNS/MagicDNS. It does not provide Pi-hole-side query/forwarding evidence or establish every client's DNS path. Persistence and backup strategy remain unverified. No service changes or restarts were performed.

For resolver/listener/reachability investigation, use [connectivity and DNS diagnosis](../../runbooks/networking/connectivity-and-dns.md). Historical resolver changes linked there do not establish this service's current configuration or cause.
