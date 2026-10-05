# Proposed Engineering-Lab architecture

Status: proposal only, 2026-10-05. No repository files changed. This design supersedes the first audit's destination layout and blanket identifier-redaction rule; it retains that audit's secret/personal-data exclusions and history limitations.

Inputs: /tmp/repository-migration-audit.md, /tmp/repository-migration-manifest.json, current Engineering-Lab tracked files, and current scripts repository. Read-only remote checks confirmed unchanged snapshots: scripts master at c367a2fbef46eec94f16277a1c8e8bd4c2fda822; Engineering-Lab main at 18ecc65858fe88ed3dd630e5e32614e6a7ffb4f9. No current scripts files were cloned or copied. Prior technical-content audit was reused; deliberately excluded personal/opaque files remain unopened.

## Proposed final tree

```text
Engineering-Lab/
├── README.md
├── ROADMAP.md
├── machines/
│   ├── README.md                         # machine index: IDs, roles, links only
│   ├── _template/
│   │   ├── README.md                     # identity, role, lifecycle, documentation links
│   │   ├── inventory.md                  # hardware and dated observations
│   │   ├── state.yaml                    # OS, interfaces, addresses, profile refs, overrides
│   │   └── history.md                    # dated incidents, failed attempts, outcomes
│   ├── debian-dev-01/                    # proposed stable ID; confirm actual host mapping
│   │   └── {README.md,inventory.md,state.yaml,history.md}
│   ├── ubuntu-dev-01/
│   │   └── {README.md,inventory.md,state.yaml,history.md}
│   ├── proxmox-01/
│   │   └── {README.md,inventory.md,state.yaml,history.md}
│   ├── rpi5-01/
│   │   └── {README.md,inventory.md,state.yaml,history.md}
│   ├── rpi4-01/
│   │   └── {README.md,inventory.md,state.yaml,history.md}
│   └── toshiba-01/
│       └── {README.md,inventory.md,state.yaml,history.md}
├── runbooks/
│   ├── README.md
│   ├── _template.md
│   ├── provisioning/
│   │   ├── onboard-machine.md
│   │   ├── reproduce-development-environment.md
│   │   └── platform-baselines/
│   │       ├── debian.md
│   │       ├── ubuntu.md
│   │       ├── proxmox.md
│   │       └── raspberry-pi.md
│   ├── linux/
│   │   ├── diagnostic-workflow.md
│   │   ├── command-reference.md
│   │   ├── users-and-permissions.md
│   │   ├── services-and-logs.md
│   │   ├── packages-and-scheduling.md
│   │   └── removable-storage.md
│   ├── development/
│   │   ├── serial-device-access.md
│   │   ├── c-debugging.md
│   │   ├── python-environments.md
│   │   ├── vim.md
│   │   └── vim-clipboard-images.md
│   ├── networking/
│   │   ├── connectivity-and-dns.md
│   │   ├── tailscale.md
│   │   └── internet-sharing.md
│   ├── services/
│   │   ├── nextcloud-upload-recovery.md
│   │   ├── mqtt-diagnostics.md
│   │   └── container-runtimes.md
│   ├── storage/
│   │   ├── disk-health.md
│   │   └── backup-and-restore.md
│   ├── desktop/
│   │   ├── x11-wayland-diagnostics.md
│   │   └── starship.md
│   └── git/
│       ├── workflow.md
│       └── windows-compatibility.md
├── homelab/
│   ├── README.md
│   ├── architecture.md                   # roles, dependencies, current versus proposed design
│   ├── networking/
│   │   ├── topology.md                   # relationships and references to machine interfaces
│   │   ├── dns.md
│   │   └── tailscale.md
│   └── services/
│       ├── README.md                     # service catalog; links, not duplicate records
│       ├── nextcloud.md
│       ├── mqtt.md
│       ├── monitoring.md
│       └── iot.md
├── configs/
│   ├── README.md
│   ├── profiles/
│   │   ├── linux-base.yaml
│   │   ├── development.yaml
│   │   ├── embedded-development.yaml
│   │   ├── container-host.yaml
│   │   └── homelab-node.yaml
│   ├── platforms/
│   │   ├── debian.yaml
│   │   ├── ubuntu.yaml
│   │   ├── proxmox.yaml
│   │   └── raspberry-pi-os.yaml
│   ├── templates/
│   │   ├── bash/aliases.sh
│   │   ├── vim/vimrc
│   │   ├── starship/starship.toml
│   │   └── systemd/
│   └── services/
│       ├── nextcloud/
│       ├── mqtt/
│       ├── monitoring/
│       └── containers/
├── scripts/
│   ├── README.md
│   ├── provision/
│   │   ├── plan-profile.py                # future: resolve profile, platform, machine overrides
│   │   └── apply-profile.py               # future: explicit selected changes, backup, verify
│   ├── inventory/
│   │   ├── collect-system.sh              # future: local-only observation, no auto-commit
│   │   └── collect-network.sh
│   └── verify/
│       ├── verify_repo.sh
│       └── verify-environment.sh          # future: capability checks
└── decisions/
    ├── README.md
    ├── _template.md
    ├── 0001-repository-as-source-of-truth.md
    ├── 0002-purpose-based-organization.md
    ├── 0003-machine-state-and-portable-profiles.md
    └── 0004-container-runtime-strategy.md
```

Brace notation expands to four files in each machine directory. These are candidate machine IDs, not assertions of existing hostnames or installed systems. Confirm identities and whether Debian/Ubuntu are dual-boot environments on one physical device. Create active machine records only for confirmed environments; otherwise use lifecycle=planned. Record separate OS environments with a shared physical-device reference when appropriate. Future machines use the same template without changing top-level structure. Proxmox and Raspberry Pi baseline/profile files are proposed, not verified procedures.

The tree is the target architecture, not a request to create every empty file now. Author content incrementally. Empty configs/services and systemd directories describe extension points; no placeholders should imply functioning deployments. Additional future technologies belong in the relevant existing purpose directory.

## Ownership rules

| Location | Owns | Does not repeat |
|---|---|---|
| machines/ | Actual per-machine identity, hardware, installed OS/version, network assignments, applied profiles, exceptions, dated incidents | General setup commands or shared profile definitions |
| runbooks/ | Reusable procedures, prerequisites, diagnosis, expected results, useful failed approaches, verification and rollback | Current machine addresses or service deployment facts |
| homelab/ | Cross-machine relationships, service intent/dependencies, network design, deployment/placement references | Hardware inventory, machine address lists, configuration file contents |
| configs/ | Desired portable profiles, platform mappings and deployable templates | Machine observations, secrets, tutorial transcripts |
| scripts/ | Reusable automation consuming profiles and machine inputs; inventory/validation tools | Embedded alternate package lists or copies of templates |
| decisions/ | Dated choices, context, alternatives and consequences | Operational instructions or current machine state |
| README.md / ROADMAP.md | Navigation and planned work | Copies of detailed architecture or procedures |

machines/README.md is the only machine index. Each inventory.md owns hardware facts; state.yaml owns current environment and network values; history.md owns dated past observations and incidents. README.md links them rather than repeats values. Inventory points to the environment's physical-device reference when multiple OS records share one physical machine; only one record owns the hardware facts.

homelab/networking/topology.md references machine IDs and interface keys, not a second address inventory. Homelab service records own placement, service-specific ports, data/backup relationships and deployment status; they reference the machine and config path. Config templates contain placeholders or relative machine-variable references, never duplicated real identifiers. Historical records may retain dated obsolete values only when needed to explain the incident; label them historical and reference current state.

README indexes contain links. Existing broad docs/ is redistributed by purpose and can eventually disappear once all links and knowledge are accounted for. No new general notebook or archive dump is proposed.

## Reproducing Debian development on Ubuntu

Portable intent lives in configs/profiles/development.yaml: capabilities such as C/C++ compilation, debugging, Git, editor, Python isolation and serial-device access. linux-base.yaml owns shared dependencies; embedded-development.yaml adds cross-compilation and serial tools. Optional browser, sync client, container runtime and GPU/Whisper components must be explicit options, not implicit dependencies of all machines.

configs/platforms/debian.yaml and ubuntu.yaml map capability IDs to release-appropriate packages and platform differences. Each file declares supported OS releases and architectures, repositories and verification requirements; unsupported combinations stop the plan. Raspberry Pi ARM packages/toolchains and Proxmox host policy are separate mappings. A Debian-derived Proxmox host does not inherit workstation desktop/repository choices automatically.

machines/<id>/state.yaml stores target profile references, actual OS/release/architecture, machine-only overrides and last verified application state. Do not clone Debian's observed package dump, home directory or .bashrc onto Ubuntu. Resolve effective desired configuration as shared profile composition → platform mapping → explicit machine overrides; conflicting capabilities or unsupported overrides stop planning. Profile inheritance uses references rather than duplicated lists.

Proposed machine record fields: stable machine ID, physical-device reference, lifecycle, role, OS family/release/architecture, necessary hostname/usernames/interface/address fields, selected profile IDs/options, explicit overrides, observed capabilities, last_verified, and config/runbook links. Secret fields are forbidden. Desired profile selection and observed state are distinct; matching the selection does not prove provisioning succeeded.

The future reproduction workflow:
1. Record Ubuntu identity/platform and select the same development capabilities as Debian. Preserve Ubuntu-specific overrides.
2. Resolve package and template differences into a dry-run plan, including unavailable capabilities and explicit optional components.
3. Review selected changes; back up affected configuration locally outside Git and apply only those changes. Prefer reviewed snippets/includes over overwriting an entire personal config.
4. Verify compiler, debugger, editor, environment isolation and actual serial-group access on Ubuntu. Record versions and validation date under that machine.
5. Keep failed attempts in Ubuntu history; promote reusable lessons into runbooks and link back. Roll back a failing component without discarding other machine state.

The profile YAML schema and provisioning programs are proposed new work. The migration must define/validate that schema before claiming profiles are executable. A later implementation may use Ansible internally, but should preserve this single profile/variable ownership model rather than create a second inventory and package list. This architecture proposal does not install packages, run provisioning or assert compatibility with particular releases.

## Troubleshooting and history

A runbook owns a reusable procedure; a machine history entry owns what actually happened on that machine. Service incidents reference the homelab service record and machine history; do not maintain a second incident narrative in the service page.

Runbook template: purpose, applicability/platform versions, prerequisites, read-only observations first, branching hypotheses, procedure, verification, rollback, known failed approaches, limitations and provenance. Mark unsupported commands and historical untested snippets clearly.

Machine incident template: date (unknown if unevidenced), symptom, environment, hypothesis, attempted action, observed outcome, failed approaches and what they ruled out, final resolution or unresolved status, links to relevant runbooks, source repository/path/commit. Preserve useful historical failures, not raw chat dumps or unrelated output. If source incident identity is uncertain, record it as an unassigned historical case in the relevant runbook until matched; never assign it to a guessed machine.

Split the Linux notebook by purpose. Merge C/GDB/Valgrind material into development/c-debugging.md; clipboard-specific lessons into vim-clipboard-images.md; operational Git/Windows issues into git/. The notebook's teaching policies and unrelated personal context do not become runbooks.

## Identifiers, secrets and privacy

Necessary infrastructure identifiers are valid canonical operational data in the intended private repository. Do not erase a machine's useful hostname, required operating account, interface names, assigned addresses or essential service/network relationships merely because they identify infrastructure. Stable directory IDs need not match mutable hostnames.

Decide per field: required to operate this machine or explain this incident? If yes, retain it in the owning machine or necessary homelab record after review. If no, omit it or replace it with a generic example in runbooks/templates. Actual usernames should appear only where needed for ownership/login/permissions; profile templates use variables. Personal names, email addresses, geographic/lifestyle detail and unrelated paths are not justified merely by appearing in a technical note.

Never migrate secrets, credentials, tokens, private keys, unnecessary personal information or proprietary information lacking authorization. A hostname/IP is not a credential, but a sensitive third-party endpoint or unrelated proprietary topology still requires exclusion/review. No actual identifiers or source secrets are reproduced in these two proposals. Real values should be reviewed at source before any future migration.

Keep secret values in an appropriate external secret store or local excluded runtime file. Commit at most generic variable names/examples and non-sensitive setup instructions. Protect local runtime files through ignores, but do not treat .gitignore as a scanner or security boundary. No full-history imports or bulk raw configuration copies.

## What remains in the standalone scripts repository

- rato/move_mouse.c and its build/use instructions; compiled binary and swap file remain pending manual disposition.
- teclado utilities and minimal usage notes, including the distinct click, targeted-click and key-loop examples.
- whisper_wsl workflow and any reviewed utility-specific invocation notes; no media/transcripts.
- GIT/procedure_AFTER_PR.md as a standalone post-PR utility checklist. Engineering-Lab may link it, while owning operational Git failure diagnosis.
- A short desktop-automation utility guide formed from unique usage material in rato/saber.md and teclado/saber.md. Engineering-Lab owns the reusable X11/Wayland diagnostic lesson; the utility guide links it rather than repeats it.

Linux operations, editor/environment reproduction, scheduler diagnostics, removable-storage procedures and C/debugging runbooks now belong to Engineering-Lab, unlike several first-audit recommendations. Utilities may link these canonical procedures. Personal files are excluded from the Engineering-Lab migration; being left untouched today does not designate scripts as their recommended permanent home.

## Review gates and eventual deduplication

Review notebook, Vim context, hardware/network inventories, Tailscale identities, service topology, machine shell/Starship config and shell transcripts before extraction. Confirm machine mappings, observed versus proposed roles, identifier necessity and any third-party/proprietary information. Hardware measurements belong to inventory/history if useful; they are not automatically redacted as personal data.

The two long inventory files are exact duplicates (blob cffe9e2970d8f710eefa6a7fea85f9c66b93cb5b). After reviewed facts are merged into their owning machine records and homelab design, both old copies can eventually be retired; preserve both provenance paths. The numbered inventory overlaps semantically and needs reconciliation, not automatic deletion.

Vim, shell-alias/C-debugging, desktop-automation and proposed repository-layout overlaps can eventually be consolidated after unique knowledge and failed approaches are retained. Do not call overlapping documents exact duplicates. Five empty node files are scaffolds, not knowledge duplicates. The executable is a build artifact and the swap is a recovery artifact; neither should be removed under a deduplication assumption.

Only a later authorized migration may create destination content or retire sources. This task creates just the architecture proposal and the second migration plan.

