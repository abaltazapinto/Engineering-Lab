# Engineering Lab

This repository is the source of truth for an infrastructure-focused engineering lab running on Debian, with supporting notes for Ubuntu, Arch, and Windows. It collects reproducible documentation, decision records, and starter configuration for Docker, Podman, Kubernetes, Raspberry Pi, MQTT, Prometheus, Grafana, Tailscale, networking, and backups.

## Goals

- Keep platform-specific notes in one place.
- Document decisions and trade-offs clearly.
- Prefer official documentation and reproducible steps.
- Separate the lab’s operating model from any one machine or host.

## Repository layout

- [README.md](README.md) – repository overview and operating principles.
- [ROADMAP.md](ROADMAP.md) – near-term and long-term lab priorities.
- [docs/](docs/) – host OS, platform, and operations guidance.
- [configs/](configs/) – example configuration files and templates.
- [scripts/](scripts/) – automation and verification helpers.

## Operating principles

- Understand the environment before changing it.
- Prefer small, reversible steps over large disruptive changes.
- Record important decisions in the repository.
- Keep automation and documentation aligned.

## Suggested starting points

- [docs/DEBIAN.md](docs/DEBIAN.md) for the primary Debian host baseline.
- [docs/DOCKER.md](docs/DOCKER.md) and [docs/PODMAN.md](docs/PODMAN.md) for container choices.
- [docs/KUBERNETES.md](docs/KUBERNETES.md) for cluster strategy.
- [docs/TAILSCALE.md](docs/TAILSCALE.md), [docs/PROMETHEUS.md](docs/PROMETHEUS.md), and [docs/GRAFANA.md](docs/GRAFANA.md) for remote access and observability.
