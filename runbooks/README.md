# Runbooks

Reusable troubleshooting and procedures live here. Use [TEMPLATE.md](TEMPLATE.md); state applicability, separate observations from hypotheses, retain useful failed approaches and document actual verification.

## Available runbooks

| Purpose | Canonical procedure |
|---|---|
| Workstation audio | [HP ZBook SOF/PipeWire speakers](audio/hp-zbook-sof-pipewire-speakers.md) |
| Vim editing and configuration isolation | [Vim operations](development/vim.md) |
| Markdown clipboard-image failures | [Vim clipboard images](development/vim-clipboard-images.md) |
| C/Pthreads tools and execution mistakes | [C debugging](development/c-debugging.md) |
| Serial permissions and busy ports | [Serial-device access](development/serial-device-access.md) |
| Desktop session/window compatibility | [X11/Wayland diagnosis](desktop/x11-wayland-diagnostics.md) |
| Branch/tracking and safe local workflow | [Git workflow](git/workflow.md) |

The audio runbook records user-supplied session findings. Phase 2 Batch 1 adds only reusable workstation knowledge, with pinned source references and separate verification limits. No homelab/network/service source migration, personal notes, transcripts or opaque artifacts are included. Source files and duplicates remain untouched pending review.

The two REVIEW MANUALLY sources contribute only explicit technical subsets authorized by the migration plan: notebook sections 1/6 (serial) and 20 (Git), and Vim operational/clipboard diagnosis. Their personal environment, teaching policies and unrelated sections are excluded. Do not treat these extracts as authorization for the remaining source material.

Machine records own actual state and incident chronology. Runbooks link them and avoid permanent runtime IDs.

## Batch 1 verification — 2026-10-05

Repository structure, documentation links/anchors, whitespace and optional-fragment checks are required before review. Scratch checks passed for Bash alias definitions, Vim mapping setup and visual-block insertion, a synthetic Pthreads build/run, Memcheck, Helgrind and GDB breakpoint/thread/backtrace/continue operations. GDB required an explicitly approved retry outside the sandbox's ptrace restriction.

These checks did not invoke the image plugin or clipboard, send desktop events, modify user configuration/groups, access serial hardware, perform Git network/mutation operations, or validate an existing project. End-to-end hardware/GUI procedures remain applicability-dependent and unverified on target machines.
