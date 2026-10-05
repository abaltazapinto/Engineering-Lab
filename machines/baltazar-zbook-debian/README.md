# baltazar-zbook-debian

Status: initial concrete-host record. Identity is user-confirmed; unknown facts remain unknown. Evidence provenance and observation dates are recorded below.

## Role

Primary Debian workstation / ZBook laptop, confirmed by the user.

## Hardware / platform

HP ZBook. Detailed hardware inventory remains to be collected.

## OS

Debian. Release, current kernel and architecture remain unverified in this record.

## Desired state

TODO: Link selected capability profiles and identify intended exceptions. Desired state is not observed state.

## Observed state

The user confirms this is the current Debian ZBook / primary Debian workstation. No online/offline status for this node was supplied in the Tailscale evidence.

Evidence: user-supplied Phase 1.1 information received 2026-10-05. The Tailscale snapshot capture time was not supplied; no live probe was performed during this documentation update.

## Machine-specific configuration

TODO: Record necessary exceptions and non-secret settings once. Keep credentials external.

## Reproducible configuration references

Platform configuration: [debian mapping](../../configs/platforms/debian.md), currently a placeholder. Desired capability profiles and machine-specific exceptions still require review; this link does not assert the profile is applied.

## Networking

Known node name: `debian-baltazar`, as supplied by the user. See the [machine inventory](../README.md) for the confirmed association. A Tailscale node name is not an immutable hardware identity.

Do not store the current Tailscale IP as permanent identity. Addresses, leases and reachability require dated observations; no IP or credential is recorded here.

## Services

No services or workloads have been established by the supplied evidence. Record only verified services and link their canonical configuration/runbook records.

## Known issues

TODO: Record observed symptoms and unresolved limitations; unknown is not issue-free.

## Incident history

2026-10-05: The user reported a successful Debian audio investigation. See the canonical [HP ZBook speaker runbook](../../runbooks/audio/hp-zbook-sof-pipewire-speakers.md) for verified findings, recovery and persistence limits. This does not establish the machine's current audio state; no audio commands were run during repository implementation.
