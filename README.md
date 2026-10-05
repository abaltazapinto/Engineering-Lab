# Engineering Lab

Engineering-Lab is the canonical operational engineering knowledge base for Linux machines, homelab, infrastructure, troubleshooting and reproducible configuration.

## Repository layout

| Location | Purpose |
|---|---|
| [machines/](machines/README.md) | Observed machine state, configuration exceptions and incident history |
| [runbooks/](runbooks/README.md) | Reusable procedures and troubleshooting |
| [homelab/](homelab/README.md) | Infrastructure architecture, networking and services |
| [configs/profiles/](configs/profiles/README.md) | Portable desired capabilities |
| [configs/platforms/](configs/platforms/README.md) | Distribution/platform capability mappings |
| [configs/templates/](configs/templates/README.md) | Reusable configuration templates |
| [configs/services/](configs/services/README.md) | Reusable service configuration |
| [scripts/](scripts/README.md) | Engineering-Lab automation and repository verification |
| [decisions/](decisions/README.md) | Dated choices and approved planning history |

[AGENTS.md](AGENTS.md) defines the repository contract. [ROADMAP.md](ROADMAP.md) preserves the existing roadmap.

## How to use this repository

1. Start with the relevant machine record. Record only evidenced observations, with dates; leave unknown facts unknown.
2. Describe intended capabilities through a shared profile and the appropriate platform mapping. Desired configuration is not proof that a machine implements it.
3. Use a runbook to investigate a problem. Record the fix, actual verification, persistence limits and useful failed approaches.
4. Keep reusable configuration in configs and link it from machine records. Record machine exceptions once.
5. Describe cross-machine architecture and service relationships in homelab. Reference machine facts instead of repeating inventories.
6. Record significant choices in decisions, with date, status, alternatives and consequences.

Necessary machine/network identifiers may belong in canonical machine documentation. Secrets, credentials and unnecessary personal information never belong here. Discover current runtime IDs instead of copying IDs from past sessions.

## Phase 1 starting points

- [Machine index](machines/README.md) and [machine template](machines/TEMPLATE.md).
- [HP ZBook speaker troubleshooting](runbooks/audio/hp-zbook-sof-pipewire-speakers.md).
- [Portable development profile concept](configs/profiles/development-workstation.md).
- [Phase 1 organizational decision](decisions/2026-10-05-repository-structure.md).
- [Approved planning snapshots](decisions/planning/README.md).

Profiles and platform mappings are concepts/placeholders in Phase 1. No provisioning tools or package mappings are claimed to be implemented.

## Existing documentation

Useful earlier documents remain unchanged during this phase:

- [Debian baseline](docs/DEBIAN.md).
- [Docker guidance](docs/DOCKER.md).
- [Podman guidance](docs/PODMAN.md).
- [Original source-of-truth decision](docs/DECISIONS.md).

These documents retain their historical context. Their future reorganization is governed by the migration plan; new indexes link them rather than duplicate their contents. Standalone utilities remain in the external scripts repository.

## Repository verification

```bash
bash scripts/verify_repo.sh
git diff --check
git status --short
```

The verifier checks the Phase 1 structure and preservation of legacy documents. It does not certify runtime audio, machine configuration, secret absence or provisioning compatibility.
