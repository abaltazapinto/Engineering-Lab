# Debian lab baseline

This document captures the preferred baseline for the primary Debian host used in the lab.

## Recommended starting point
- Install Debian stable and update the system before changing anything else.
- Prefer official Debian repositories and packages over third-party sources where possible.
- Keep a log of packages installed, services enabled, and configuration changes.

## Suggested packages
- `sudo`, `git`, `curl`, `wget`, `jq`, `htop`, `net-tools`, `ca-certificates`
- `docker.io` or `podman` depending on the runtime decision
- `ansible` for repeatable configuration where useful

## Suggested workflow
1. Update the host.
2. Review the current network configuration.
3. Decide whether Docker or Podman will be the default container runtime.
4. Record the decision in [docs/DECISIONS.md](DECISIONS.md).

## Notes
- For production-like environments, prefer systemd-managed services and explicit configuration files.
- For lab experiments, keep changes small and reversible.
