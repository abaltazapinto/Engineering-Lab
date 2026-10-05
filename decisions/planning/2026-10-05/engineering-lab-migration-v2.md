# Engineering-Lab migration plan v2

Proposal only — 2026-10-05. Paired with /tmp/engineering-lab-architecture.md. No migration is authorized or executed by this plan.

## Inputs and coverage

Read /tmp/repository-migration-audit.md and /tmp/repository-migration-manifest.json and reviewed the current Engineering-Lab structure/content. Current recursive remote trees match the audited snapshots: scripts master c367a2fbef46eec94f16277a1c8e8bd4c2fda822 (42 files, 19 directories); Engineering-Lab main 18ecc65858fe88ed3dd630e5e32614e6a7ffb4f9 (8 files, 3 directories). Both trees are complete. All 72 audited paths have exactly one row below. Prior in-session technical-content review is reused; personal/opaque exclusions remain unopened. Historical versions and deleted paths remain outside exhaustive coverage.

Destinations are relative to Engineering-Lab unless prefixed scripts-repo:. Brace expressions list individual files. <confirmed-id> requires identity review and expands to an established machine record, not a literal directory. Parent-directory rows are summaries: never override the child review/exclusion rows. EXCLUDED means no transfer, not deletion. Unimplemented destination files are proposals, not evidence that configurations or scripts exist.

## Changes from v1

- Operational Linux/tooling knowledge, environment setup, editor configuration and debugging move into Engineering-Lab runbooks/configs. The standalone scripts repository retains utilities and their minimal usage notes.
- machines/ owns actual per-machine facts and incident evidence. homelab/ owns cross-machine design and service relationships. runbooks/ owns reusable diagnosis.
- Actual IP addresses, usernames, hostnames and other required infrastructure identifiers may be retained in canonical owning machine documentation after review. Sanitize only unnecessary/personal/third-party-sensitive context or generic examples. This explicitly replaces v1's blanket real-identifier exclusion.
- Secrets, tokens, credentials, private keys, unnecessary personal information and unauthorized proprietary content remain excluded everywhere. No raw personal file transfer.
- The monolithic notebook is split by purpose; no replacement all-purpose notebook or archive of raw transcripts.
- Rename legacy decisions into dated decision records; separate current state from reproducible shared profiles and platform mappings.
- Twelve rows change category; more rows change destination even if their category stays the same.

New counts (files and directory rows combined): 20 MERGE, 34 REVIEW MANUALLY, 11 KEEP IN SCRIPTS, 5 MOVE TO ENGINEERING-LAB, 2 RENAME. MOVE on existing Engineering-Lab/scripts is retain/no-op. REVIEW MANUALLY rows may propose several derivative destinations, but copying the original is never the default. Counts are planning classifications, not numbers of files approved to transfer.

## Proposed destination ownership

Use the full tree in the paired architecture proposal. Root README and ROADMAP remain root documents. No permanent catch-all docs/ remains. Machine records use README/inventory/state/history; machines index links records rather than repeating facts. Operational procedures are runbooks. Profiles/templates and platform mappings are configs. Provisioning/inventory/verification helpers are Engineering-Lab/scripts. Decisions are decisions/. Homelab design/services/networking use references to machine IDs and state keys.

The initial machine IDs (debian-dev-01, ubuntu-dev-01, proxmox-01, rpi5-01, rpi4-01, toshiba-01) are proposed logical IDs. Confirm actual environment associations and shared physical devices before importing observations. Planned nodes remain planned; unknown source incidents remain unassigned historical cases in relevant runbooks.

## Complete second migration map

### abaltazapinto/scripts

| Audited path | V1 → V2 classification | Proposed destination(s) | Migration rule / knowledge to retain |
|---|---|---|---|
| `AGENTE` | REVIEW MANUALLY → MERGE | runbooks/; machines/ | Split by operational purpose; children control review restrictions. Do not migrate agent policies. |
| `AGENTE/CURRENT_TASKS.md` | REVIEW MANUALLY | machines/debian-dev-01/README.md; ROADMAP.md (reviewed operational extracts only) | Confirm environment/role and operational tasks. Exclude teaching preferences and unnecessary personal context; current machine assignment is provisional. |
| `AGENTE/LINUX_ENGINEERING_NOTEBOOK.md` | REVIEW MANUALLY | runbooks/linux/{diagnostic-workflow,command-reference,users-and-permissions,services-and-logs,packages-and-scheduling}.md; runbooks/development/serial-device-access.md; runbooks/networking/{connectivity-and-dns,tailscale,internet-sharing}.md; runbooks/storage/disk-health.md; runbooks/git/workflow.md; machines/<confirmed-id>/history.md; runbooks/development/{vim,vim-clipboard-images,c-debugging,python-environments}.md | Split unique technical knowledge by purpose, merge editor/Git/debugging overlap with their owners, preserve serial-permission failures and investigation method. Retain necessary real identifiers only in confirmed machine history/state; omit unrelated personal material. |
| `AGENTE/vim` | MERGE | runbooks/development/; configs/templates/vim/ | Vim operational knowledge and reproducible configuration now belong to Engineering-Lab. |
| `AGENTE/vim/VIM.md` | REVIEW MANUALLY | runbooks/development/vim.md; runbooks/development/vim-clipboard-images.md; configs/templates/vim/vimrc; machines/<confirmed-id>/history.md | Retain mappings only if needed for the intended development profile; extract reviewed reusable snippets, clipboard diagnosis and failures. Exclude teaching policy/personal mappings unrelated to operation. |
| `Futuro_eu` | REVIEW MANUALLY | No directory transfer; inventory child feeds machines/ and homelab/ | Personal planning namespace is not an architectural category. |
| `Futuro_eu/embedded_engineer` | REVIEW MANUALLY | No directory transfer; classify children separately | Do not mix personal schedule with operational inventory. |
| `Futuro_eu/embedded_engineer/embedded-engineering-homelab-inventory.md` | REVIEW MANUALLY | machines/README.md; machines/<confirmed-id>/{README.md,inventory.md,state.yaml,history.md}; homelab/architecture.md | Exact duplicate of Homelab long inventory. Use one source extract with both provenance paths; keep operational identifiers in owning machine records, omit unnecessary personal detail. |
| `Futuro_eu/embedded_engineer/schedule.md` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Personal schedule remains untouched; do not open/copy for migration. |
| `GIT` | KEEP IN SCRIPTS | scripts-repo:GIT/ | Standalone post-PR utility checklist remains. |
| `GIT/procedure_AFTER_PR.md` | KEEP IN SCRIPTS | scripts-repo:GIT/procedure_AFTER_PR.md | Keep utility-specific workflow. Link from runbooks/git/workflow.md; do not copy the checklist. Respect master/main differences. |
| `Homelab` | MERGE | machines/; homelab/; runbooks/; decisions/ | Redistribute by facts, cross-machine design, procedures and choices; no wholesale folder transfer. |
| `Homelab/01_HOMELAB_INVENTORY.md` | REVIEW MANUALLY | machines/README.md; machines/<confirmed-id>/{README.md,inventory.md,state.yaml,history.md}; homelab/architecture.md | Reconcile numbered and long inventories, distinguish active/planned roles. Real machine/network IDs can be retained where operationally necessary; no duplicated inventory in homelab. |
| `Homelab/02_TAILSCALE_NETWORK_MAP.md` | REVIEW MANUALLY | machines/<confirmed-id>/state.yaml; homelab/networking/tailscale.md; homelab/networking/topology.md; runbooks/networking/tailscale.md | Review actual environment-to-identity mappings. Keep essential endpoint/interface addresses in machine state and relationships in homelab; use generic diagnostic examples in runbook. |
| `Homelab/03_SERVICES_NEXTCLOUD_IOT.md` | REVIEW MANUALLY | homelab/services/{README,nextcloud,mqtt,monitoring,iot}.md; homelab/networking/{dns,topology}.md; runbooks/services/{nextcloud-upload-recovery,mqtt-diagnostics}.md; runbooks/networking/{connectivity-and-dns,internet-sharing}.md; machines/<confirmed-id>/history.md | Review service placement and topology; retain essential operational identifiers by ownership. Preserve Nextcloud recovery, resolver changes and failure exercises. Mark suggested stacks planned; history remains historical. |
| `Homelab/04_GIT_HOMELAB_STRUCTURE.md` | MERGE | README.md; ROADMAP.md; decisions/0002-purpose-based-organization.md; scripts/inventory/{collect-system,collect-network}.sh (future reviewed implementations) | Replace legacy suggested layout with purpose-based navigation and roadmap. Snapshot snippets are design inputs, not working scripts; raw output is local-only and requires review. |
| `Homelab/embedded-engineering-homelab-inventory.md` | REVIEW MANUALLY | machines/README.md; machines/<confirmed-id>/{README.md,inventory.md,state.yaml,history.md}; homelab/architecture.md | Preferred extraction source for identical long inventories. Confirm machine mapping; distribute facts once, preserve observed versus proposed roles and useful dated history. |
| `Homelab/nodes` | REVIEW MANUALLY | machines/ (confirmed records only) | Five empty children are not useful operational content; decide scaffold disposition separately. |
| `Homelab/nodes/toshiba-node` | REVIEW MANUALLY | machines/toshiba-01/ (provisional mapping) | Confirm whether this is the same Toshiba from hardware notes; instantiate substantive machine record, not empty copies. |
| `Homelab/nodes/toshiba-node/README.md` | REVIEW MANUALLY | machines/toshiba-01/README.md | Zero-byte placeholder: no migration content. Proposed destination describes responsibility only; populate from confirmed evidence in a later task. |
| `Homelab/nodes/toshiba-node/bootstrap.sh` | REVIEW MANUALLY | scripts/provision/apply-profile.py (future shared implementation; no source content) | Zero-byte placeholder: no migration content. Proposed destination describes responsibility only; populate from confirmed evidence in a later task. |
| `Homelab/nodes/toshiba-node/hardware.md` | REVIEW MANUALLY | machines/toshiba-01/inventory.md | Zero-byte placeholder: no migration content. Proposed destination describes responsibility only; populate from confirmed evidence in a later task. |
| `Homelab/nodes/toshiba-node/install-notes.md` | REVIEW MANUALLY | machines/toshiba-01/history.md | Zero-byte placeholder: no migration content. Proposed destination describes responsibility only; populate from confirmed evidence in a later task. |
| `Homelab/nodes/toshiba-node/network.md` | REVIEW MANUALLY | machines/toshiba-01/state.yaml | Zero-byte placeholder: no migration content. Proposed destination describes responsibility only; populate from confirmed evidence in a later task. |
| `Homelab/pc toshiba.txt` | REVIEW MANUALLY | machines/toshiba-01/inventory.md; machines/toshiba-01/history.md; runbooks/storage/disk-health.md | Review host association and evidence date. Keep useful actual disk measurements in machine history/inventory, generic interpretation in runbook; do not erase necessary machine identity. |
| `Homelab/powershell-lab` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Scratch exercise; no whole-directory migration. |
| `Homelab/powershell-lab/teste.txt` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | 22-byte exercise output, no distinct operational lesson; leave untouched. |
| `Homelab/windows-linux.md` | REVIEW MANUALLY | runbooks/git/windows-compatibility.md; machines/<confirmed-id>/history.md (only if incident relevant) | Extract PowerShell object/cmdlet comparison and operational diagnosis. Exclude unrelated directory listing and personal transcript; retain identifiers only if needed to explain a confirmed incident. |
| `Homelab/windows.md` | MOVE TO ENGINEERING-LAB | runbooks/git/windows-compatibility.md | Preserve LF/CRLF warning and Windows-incompatible filename investigation; merge reviewed PowerShell content and repair malformed Markdown. |
| `LINUX_GERAIS` | MERGE | runbooks/linux/; runbooks/development/; runbooks/storage/; configs/ | Operational knowledge now belongs to Engineering-Lab, independent of old directory naming. |
| `LINUX_GERAIS/VIM` | MERGE | runbooks/development/ | Merge with reviewed main Vim source; do not keep a second maintained reference. |
| `LINUX_GERAIS/VIM/needed_all_time.md` | MERGE | runbooks/development/vim.md | Retain unique visual-block, indentation and editing recipes; distinguish destructive editor commands. |
| `LINUX_GERAIS/ambientes_venv.md` | KEEP IN SCRIPTS → MOVE TO ENGINEERING-LAB | runbooks/development/python-environments.md | Environment discovery/isolation supports shared development capabilities; Whisper utility links this canonical reference. |
| `LINUX_GERAIS/anacron` | KEEP IN SCRIPTS → MOVE TO ENGINEERING-LAB | runbooks/linux/ | Scheduler diagnosis is operational knowledge. |
| `LINUX_GERAIS/anacron/saber_que_correu.md` | KEEP IN SCRIPTS → MERGE | runbooks/linux/packages-and-scheduling.md | Preserve scheduler diagnostics; clearly separate observing execution from forcing job execution. |
| `LINUX_GERAIS/bash` | REVIEW MANUALLY | configs/templates/bash/; configs/profiles/; machines/ | Split shared shell intent from machine exceptions; never transfer full personal .bashrc. |
| `LINUX_GERAIS/bash/bashrc_portatil_porto.md` | REVIEW MANUALLY | configs/templates/bash/aliases.sh; configs/profiles/{development,embedded-development}.yaml; configs/platforms/{debian,ubuntu}.yaml; machines/debian-dev-01/state.yaml; runbooks/development/c-debugging.md; runbooks/git/workflow.md | Confirm actual host. Parameterize paths; keep necessary user/path values in machine state only. Extract reviewed alias snippets, resolve duplicate PATH and aliases. Unreviewed gacp branch-renaming behavior is not a standard provisioning step. |
| `LINUX_GERAIS/comandos.md` | KEEP IN SCRIPTS → MERGE | runbooks/linux/command-reference.md; runbooks/linux/packages-and-scheduling.md; runbooks/storage/disk-health.md | Classify commands by operational task; merge notebook overlap; distinguish examples from verified procedures. |
| `LINUX_GERAIS/gdb_comands.md` | RENAME → MERGE | runbooks/development/c-debugging.md | Fix typo by selecting meaningful destination rather than an extra rename; retain thread/GDB failures and explanations. |
| `LINUX_GERAIS/linux_pthreads_valgrind_commands.md` | KEEP IN SCRIPTS → MERGE | runbooks/development/c-debugging.md; configs/templates/bash/aliases.sh; configs/profiles/development.yaml | One C/Pthreads/GDB/Valgrind guide. Config snippet owns aliases, runbook explains them; preserve compiling-before-Valgrind, executable selection and race lessons. |
| `LINUX_GERAIS/retirar_pens.md` | KEEP IN SCRIPTS → MOVE TO ENGINEERING-LAB | runbooks/linux/removable-storage.md | Reusable storage operation belongs to canonical operational knowledge. |
| `LINUX_GERAIS/vim_clipboard_image.md` | MERGE | runbooks/development/vim-clipboard-images.md | Merge clipboard diagnosis with reviewed Vim source. Preserve escaped-variable and filename/case failures; unnecessary screenshot names omitted. |
| `books` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Personal/third-party material; untouched, no migration. |
| `books/Brian Ward - How Linux Works_ What Every Superuser Should Know (2004, No Starch Press) - libgen.li.epub` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Opaque third-party ebook not opened/copied. No content extraction. |
| `brave` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Personal browser data; leave untouched. |
| `brave/bookmarks_6_30_26.html` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Personal bookmark export not opened/copied; no automatic URL harvesting. |
| `rato` | KEEP IN SCRIPTS | scripts-repo:rato/ | Standalone utility source and minimal usage remain; binary/swap children require review. |
| `rato/.move_mouse.c.swp` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Recovery artifact may hold unsaved data; do not copy or assume safe deletion. |
| `rato/move_mouse` | REVIEW MANUALLY | EXCLUDED — no Engineering-Lab destination | Opaque compiled artifact; do not copy/run. Future reviewed source rebuild is separate from historical-data review. |
| `rato/move_mouse.c` | KEEP IN SCRIPTS | scripts-repo:rato/move_mouse.c | Standalone mouse utility, not lab automation. |
| `rato/saber.md` | MERGE | runbooks/desktop/x11-wayland-diagnostics.md; scripts-repo:docs/desktop/AUTOMATION.md | Engineering-Lab owns reusable session diagnosis/failed X11 assumptions. Scripts owns minimal utility usage; link between them, do not copy shared prose. |
| `starship` | REVIEW MANUALLY | configs/templates/starship/; runbooks/desktop/; machines/ | Reviewed reusable shell setup belongs to development environment; actual host/VM state is separate. |
| `starship/starship_configs_host_sioptr.md` | REVIEW MANUALLY | configs/templates/starship/starship.toml; runbooks/desktop/starship.md; machines/<confirmed-id>/{state.yaml,history.md} | Review host/VM association. Preserve diagnostics, warnings and rollback; shared template uses variables, necessary host-specific differences live in machine record. |
| `teclado` | KEEP IN SCRIPTS | scripts-repo:teclado/ | Standalone keyboard/window automation stays; diagnostic knowledge extracted once. |
| `teclado/ativar_programa_activo_click.md` | KEEP IN SCRIPTS | scripts-repo:teclado/ativar_programa_activo_click.md | Distinct utility-specific example stays alongside utility; no execution or duplicate operational guide. |
| `teclado/ativar_programa_activo_click_teams.md` | KEEP IN SCRIPTS | scripts-repo:teclado/ativar_programa_activo_click_teams.md | Distinct utility-specific example stays alongside utility; no execution or duplicate operational guide. |
| `teclado/ativar_programa_activo_enter.md` | KEEP IN SCRIPTS | scripts-repo:teclado/ativar_programa_activo_enter.md | Distinct utility-specific example stays alongside utility; no execution or duplicate operational guide. |
| `teclado/saber.md` | MERGE | scripts-repo:docs/desktop/AUTOMATION.md; runbooks/desktop/x11-wayland-diagnostics.md | Merge unique utility usage with rato guide; retain general window/session failure analysis in runbook with source links. Label broken historical snippets, avoid presenting them as working code. |
| `teclado/script_teclado.sh` | KEEP IN SCRIPTS | scripts-repo:teclado/script_teclado.sh | Standalone utility. Hard-coded session window ID requires a future utility change; no execution during planning. |
| `whisper_wsl` | KEEP IN SCRIPTS | scripts-repo:whisper_wsl/ | Standalone transcription workflow remains; no media or personal transcript migration. |
| `whisper_wsl/comeco.md` | KEEP IN SCRIPTS | scripts-repo:whisper_wsl/comeco.md | Keep utility invocation/activation specifics; link runbooks/development/python-environments.md for shared isolation guidance. |

### abaltazapinto/Engineering-Lab

| Audited path | V1 → V2 classification | Proposed destination(s) | Migration rule / knowledge to retain |
|---|---|---|---|
| `.vscode` | REVIEW MANUALLY | EXCLUDED from new architecture; leave in place pending review | Repository color preferences are not machine state or provisioning content. |
| `.vscode/settings.json` | REVIEW MANUALLY | EXCLUDED from new architecture; leave in place pending review | Contains editor color preferences. Retain today; optional future project preference retention is separate from environment migration. |
| `README.md` | MERGE | README.md | Keep root overview as navigation to purpose directories. Replace legacy docs links during later migration; no copies of detailed procedures. |
| `ROADMAP.md` | MERGE | ROADMAP.md | Keep root plan with profile portability, machine onboarding and homelab milestones; planned work is not deployed state. |
| `docs` | MERGE | runbooks/; machines/; decisions/ | Redistribute existing files by purpose; retire legacy namespace only after provenance and links verified. |
| `docs/DEBIAN.md` | MERGE | runbooks/provisioning/platform-baselines/debian.md; configs/profiles/{linux-base,development}.yaml; configs/platforms/debian.yaml; machines/debian-dev-01/{state.yaml,history.md} | Separate generic setup from completed workstation observations dated 2026-07-19. Confirm machine mapping and refresh state; historical installed list remains historical until verified. Runtime recommendations are optional. |
| `docs/DECISIONS.md` | MERGE → RENAME | decisions/0001-repository-as-source-of-truth.md | Preserve original 2026-07-19 decision/date/consequences. Add future organizational decisions separately; do not backdate new choices. |
| `docs/DOCKER.md` | MOVE TO ENGINEERING-LAB → MERGE | runbooks/services/container-runtimes.md; decisions/0004-container-runtime-strategy.md (proposal) | Preserve Docker operational recommendations and alternatives beside Podman, without implying final default chosen. |
| `docs/PODMAN.md` | MOVE TO ENGINEERING-LAB → MERGE | runbooks/services/container-runtimes.md; decisions/0004-container-runtime-strategy.md (proposal) | Preserve Podman/rootless/systemd trade-offs; one shared comparison and a separately dated choice/proposal. |
| `scripts` | MOVE TO ENGINEERING-LAB | scripts/ | Already in Engineering-Lab: retain purpose; reorganize helper child only. Future provision/inventory tools are new work. |
| `scripts/verify_repo.sh` | MOVE TO ENGINEERING-LAB → RENAME | scripts/verify/verify_repo.sh | Relocate and update repository-root calculation (old one-level path would become scripts/) plus obsolete required paths in future migration. Verify syntax and missing-file behavior; it is currently an existence check, not a content/privacy validator. |

## Implementation order for a later authorized migration

1. Recheck both heads and worktrees. Confirm repository visibility/access and intended machine identity mapping. Establish necessary identifier policy and physical-device/environment relationships before moving actual state.
2. Define machine and profile schemas with validation: separate desired capability selections from observed versions/state, platform release/architecture support and explicit overrides. No profiles are treated as runnable until this is implemented.
3. Extract reviewed dated machine observations into machine records. Reconcile inventory conflicts; record unknown dates/roles honestly. Keep useful actual operational identifiers in their owning fields, omit unrelated context. Review source before writing any content; never stage a raw sensitive intermediate.
4. Consolidate runbooks from notebook/editor/Linux/debugging/network/service/history sources. Retain failed hypotheses and outcomes. Review correctness before promoting historical snippets to verified procedures; include source path/commit for provenance.
5. Extract portable alias/editor/prompt snippets into config templates and capability intent into profiles. Platform mappings own package names; scripts must not introduce a second package list. Machine-only values remain in machine state; secrets remain external.
6. Assemble homelab architecture, networking and service records using machine/config/runbook references. Distinguish existing services from design candidates. Do not duplicate addresses or the inventory in topology/service catalogs.
7. Update root navigation and roadmap; preserve the original decision and add new choices with truthful dates/status. Future container-runtime decision is proposed until actually chosen.
8. Reorganize Engineering-Lab verification helper. Changing its directory also requires updating root traversal and required paths; a rename alone would break it. Implement later profile tools only after schema review, with plan-first behavior and backup/verification. Never treat empty bootstrap or notebook snippets as implemented automation.
9. Keep standalone utilities in scripts; give utility guides links to the canonical runbooks. Resolve relative and cross-repository links, including renamed paths.
10. Validate complete mapping, unique facts, profile resolution, platform compatibility, source provenance, privacy and secret exclusions, meaningful command syntax/behavior checks, Markdown/Windows path compatibility, and no unsupported assertions of deployed state. Runbooks and profiles should declare applicable OS/version, not assume Debian commands work unchanged on every node.
11. Review the concrete migration diff. Only after separate authorization should old sources be retired or replaced by lightweight pointers; no full-history import, recursive copy, bulk cherry-pick, source deletion or history rewriting is part of this proposal.

No source file is moved, deleted, edited, staged, committed or pushed in this task. Only the two authorized /tmp Markdown files are created.

## What remains in scripts

- GIT/procedure_AFTER_PR.md and its parent directory: standalone checklist, referenced rather than copied.
- rato/move_mouse.c and the utility namespace: source/usage stays; binary and swap require separate manual disposition.
- teclado utility script and three distinct utility examples: stay with keyboard/window utility.
- whisper_wsl and comeco.md: transcription invocation specifics stay, linking shared Python-environment runbook.
- Proposed scripts-repo:docs/desktop/AUTOMATION.md: consolidated minimal utility usage from rato/saber.md and teclado/saber.md. General diagnostic lessons live once in Engineering-Lab.

Excluded personal/third-party material is left untouched by this task; this is not a recommendation to keep personal data permanently in the utilities repo.

## What moves or is reorganized into Engineering-Lab

- Confirmed machine inventory, OS/installed capability state, addresses/identity where needed, and dated historical observations → machines/.
- Reusable Linux administration, serial permissions, editor/clipboard, C/debugging, Python isolation, scheduler/storage, Windows Git, network/service diagnosis → runbooks/.
- Lab architecture, essential topology, Tailscale relationships, Nextcloud/MQTT/monitoring/IoT service design and placement → homelab/.
- Reviewed portable shell/Vim/Starship configuration, shared capabilities and OS-specific package mapping → configs/.
- Reusable future profile planning/application and inventory helpers plus existing verifier → Engineering-Lab/scripts/.
- Existing source-of-truth choice and new purpose/profile/runtime decisions → decisions/.
- Root overview/roadmap stay and absorb organizational guidance by links; existing docs are split/merged by purpose.

All reviewed extracts follow the target tree rather than preserving old namespaces. A multi-destination row means splitting content ownership, not copying the whole document to every destination.

## Manual review

The table lists every blocked path. The substantive review groups are:
- Notebook/current tasks/Vim context: reusable knowledge versus personal teaching policies and unrelated preferences; confirm incident identity.
- Both long inventories and numbered inventory: reconcile facts, identify machines, retain necessary identifiers, omit unrelated personal/geographic context and sensitive third-party information.
- Tailscale network map and services notes: confirm network identities/topology/placement and secret-free content; real canonical machine values are allowed after review.
- Toshiba hardware measurements: confirm source host and date; retain useful evidence in its machine record.
- Bash/Starship host configurations: split reusable settings from machine-specific exceptions and irrelevant personal content.
- PowerShell transcript: keep operational failures and command model; remove unrelated directory listings/person-specific paths.
- Empty node scaffold and scratch output: decide value/disposition; no useful content to transfer.
- Browser export, schedule, ebook, compiled executable, swap and editor colors: excluded/pending disposition. Do not copy personal/opaque artifacts or infer safe deletion.

Review does not automatically mean redaction. Necessary machine identifiers are reviewed for accurate ownership; credentials and unnecessary personal information are excluded regardless of usefulness elsewhere.

## Duplicates that can eventually be removed

| Source group | Evidence / relationship | Single owner after consolidation | Condition before retirement |
|---|---|---|---|
| Futuro_eu/embedded_engineer/embedded-engineering-homelab-inventory.md and Homelab/embedded-engineering-homelab-inventory.md | Exact same blob cffe9e2970d8f710eefa6a7fea85f9c66b93cb5b | Per-machine inventory/state/history plus homelab architecture references | Reconcile numbered inventory, preserve useful facts/provenance from both paths, review identifiers; then both old copies can be retired |
| Homelab/01_HOMELAB_INVENTORY.md with long inventory | Semantic overlap, not exact duplicate | machines/ records and homelab/architecture.md | Resolve conflicts, avoid dropping unique hardware/environment observations |
| AGENTE/vim/VIM.md, LINUX_GERAIS/VIM/needed_all_time.md, LINUX_GERAIS/vim_clipboard_image.md and notebook Vim section | Overlapping recipes and diagnostic history | runbooks/development/vim.md, vim-clipboard-images.md; configs/templates/vim/vimrc for config | Preserve unique block-editing, clipboard/mapping, escaped-variable and filename lessons; exclude personal agent policy |
| Linux notebook, command-reference notes, Bash aliases, GDB/Pthreads/Valgrind notes | Topic overlap and repeated aliases | runbooks by task; configs/templates/bash/aliases.sh owns deployable aliases | Preserve distinct failure lessons and correct applicability; link config rather than duplicate snippet definitions |
| rato/saber.md and teclado/saber.md | Shared inhibitor/expect/xdotool material with distinct session findings | scripts utility guide plus runbooks/desktop/x11-wayland-diagnostics.md, each with a distinct purpose | Preserve unique utility usage and failed session assumptions; avoid repeating diagnostic text across repos |
| Homelab/04_GIT_HOMELAB_STRUCTURE.md with README/ROADMAP/DECISIONS | Overlapping organizational proposal | Root navigation/roadmap plus decisions | Preserve rationale and useful staged milestones; update links |
| docs/DEBIAN.md completed-state list mixed with generic baseline | Mixed ownership, not an exact duplicate | machines/debian-dev-01 state/history and provisioning baseline/profile | Confirm machine association; do not label old observations current |

No non-empty exact blob duplicate was found across the two repositories in v1; current trees are unchanged. Five zero-byte node files are scaffolds, not historical knowledge duplicates. Compiled executable and editor swap are generated/recovery artifacts, not safe duplicate-removal candidates. A later cleanup must be explicitly authorized, and history must remain accessible without importing sensitive Git history.

