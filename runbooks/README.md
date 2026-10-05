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
| Network layers and resolver ownership | [Connectivity and DNS](networking/connectivity-and-dns.md) |
| Tailscale peer/host distinction | [Tailscale diagnosis](networking/tailscale.md) |
| Remote-access failure classes | [SSH diagnosis](networking/ssh-remote-access.md) |
| Mobile uplink and downstream sharing | [Internet sharing](networking/internet-sharing.md) |
| Evidence-led application upload diagnosis | [Nextcloud uploads](services/nextcloud-upload-recovery.md) |

The audio runbook records user-supplied session findings. Phase 2 Batch 1 added reusable workstation knowledge, with pinned source references and separate verification limits; it included no homelab/network/service migration. Batch 2A adds reusable network/remote-access diagnosis, qualified historical references and curated current machine/relationship evidence. Personal notes, transcripts and opaque artifacts are excluded. Source files and duplicates remain untouched pending review.

In Batch 1 the two REVIEW MANUALLY sources contributed only notebook sections 1/6 (serial) and 20 (Git), and Vim operational/clipboard diagnosis. Batch 2A separately selects the approved notebook sections 11/12/14/15 diagnostic subsets and approved historical/diagnostic subsets of the Homelab sources. Personal environment, teaching policies, uncertain host facts and proposed architectures remain excluded; selected subsets do not authorize the rest of those files.

Machine records own actual state and incident chronology. Runbooks link them and avoid permanent runtime IDs.

## Batch 1 verification — 2026-10-05

Repository structure, documentation links/anchors, whitespace and optional-fragment checks are required before review. Scratch checks passed for Bash alias definitions, Vim mapping setup and visual-block insertion, a synthetic Pthreads build/run, Memcheck, Helgrind and GDB breakpoint/thread/backtrace/continue operations. GDB required an explicitly approved retry outside the sandbox's ptrace restriction.

These checks did not invoke the image plugin or clipboard, send desktop events, modify user configuration/groups, access serial hardware, perform Git network/mutation operations, or validate an existing project. End-to-end hardware/GUI procedures remain applicability-dependent and unverified on target machines.

## Batch 2A evidence boundaries

Source procedure candidates retain REQUIRES VERIFICATION for target-machine applicability; reference/syntax review does not establish a live fix. Historical facts are owned by the [qualified case index](../homelab/incidents/README.md), including unknown event dates. [Current topology](../homelab/networking/topology.md) contains only relationships supported by canonical machine/service records. User-supplied live evidence is dated in its owning machine observations. Documentation editing does not initiate live peer/SSH/application tests, network changes, config deployment or source retirement.
