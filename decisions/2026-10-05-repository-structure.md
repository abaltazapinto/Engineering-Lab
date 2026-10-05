# Phase 1: purpose-based repository structure

## Date

2026-10-05.

## Status

Accepted for Phase 1 by the user. Full migration remains unimplemented.

## Context

The architecture and migration plan v2 are approved. The repository needs stable ownership rules before moving historical material from the external scripts repository.

## Decision

Use machines, runbooks, homelab, configs (profiles/platforms/templates/services), scripts and decisions as defined by [AGENTS.md](../AGENTS.md).

Initial user-selected machine directory keys are baltazar-zbook-debian, p520-ubuntu, pve-lab and raspberry-pi. They replace provisional machine keys in the historical architecture for this phase, without asserting unknown host facts.

Preserve approved planning snapshots under [planning/](planning/README.md). Preserve legacy docs and roadmap in place. Create templates, profile/platform concepts and the verified audio runbook only; do not migrate REVIEW MANUALLY sources, delete duplicates, modify the external scripts repository, commit or push.

## Alternatives

Continue organizing by inherited source folders; or implement the complete migration immediately. Purpose-based ownership makes reproduction and troubleshooting easier; phased implementation allows source review before migration.

## Consequences

Shared desired capabilities are separated from observed machine state. Legacy documents coexist temporarily through links. Planning snapshots may contain superseded provisional paths, but remain immutable historical references.

Phase 2 must explicitly select migration scope and resolve manual-review items before any transfer or retirement.

## Verification

Phase 1 repository verification and whitespace checks must pass before delivery. Their results are reported in the implementation handoff; runtime machine/audio behavior is not tested by repository checks.

## References

- [Approved architecture](planning/2026-10-05/engineering-lab-architecture.md).
- [Approved migration plan v2](planning/2026-10-05/engineering-lab-migration-v2.md).
- [Original source-of-truth decision](../docs/DECISIONS.md).
