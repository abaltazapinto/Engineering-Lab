# Engineering-Lab repository contract

Engineering-Lab is the canonical operational engineering knowledge base for Linux machines, homelab, infrastructure, troubleshooting and reproducible configuration.

## Canonical ownership

- `machines/`: observed and machine-specific state, necessary identifiers, exceptions and incident history.
- `runbooks/`: reusable troubleshooting and procedures, including verification, persistence and rollback.
- `homelab/`: infrastructure architecture, networking, service relationships and placement.
- `configs/profiles/`: portable desired capabilities independent of distribution.
- `configs/platforms/`: mappings from capabilities to Debian, Ubuntu, Proxmox and Raspberry Pi platforms.
- `configs/templates/`: reusable configuration templates.
- `configs/services/`: reusable service configuration.
- `scripts/`: automation belonging specifically to Engineering-Lab.
- `decisions/`: dated architectural and organizational decisions; approved planning snapshots may live under `decisions/planning/`.

## Agent workflow

1. Inspect existing state, relevant documentation and working-tree changes before changing anything.
2. Prefer small, reversible changes. Preserve existing useful documentation until its replacement and retirement are explicitly authorized.
3. Never store secrets, tokens, passwords, credentials or private keys. Use external secret storage; review content before writing or staging it.
4. Avoid unnecessary personal information and unauthorized proprietary material.
5. Distinguish observed state (dated, evidenced) from desired state (intent). Mark unknown facts and planned/unverified behavior explicitly.
6. Never assume dynamic IDs are stable: rediscover device, sink, stream, process and other session identifiers before using them. Profile and card indices require current inspection too.
7. Preserve useful troubleshooting history, including failed approaches that explain a lesson. Do not silently rewrite historical observations as current state.
8. Document verification after a fix, including what was actually tested, evidence date, persistence status and remaining limits.
9. Avoid duplicating canonical information. Link the owning machine record, runbook, config or decision instead.
10. Keep necessary operational IP addresses, usernames and hostnames in the owning documentation; sanitize examples and unnecessary/sensitive identifiers. Do not erase useful machine identity indiscriminately.
11. Reusable configuration belongs in configs; machine records reference it and record exceptions. Automation consumes canonical configuration rather than maintaining another copy.
12. Keep standalone utilities that do not belong to this operational knowledge base in the external scripts repository.

## Phase boundary

Phase 1 establishes structure, governance, templates and the user-provided verified audio incident. It does not authorize the full scripts migration, REVIEW MANUALLY transfers, duplicate deletion, commits or pushes. Approved planning snapshots are historical proposals, not proof of implemented tools or deployed machines.

## Verification

Run `bash scripts/verify_repo.sh` and `git diff --check` after repository changes. Inspect `git status --short` and document material limitations. Do not run hardware-changing runbook commands merely to check documentation.
