# pve-lab

Status: initial concrete-host record. Identity is user-confirmed; unknown facts remain unknown. Evidence provenance and observation dates are recorded below.

## Role

Current Proxmox lab host in Porto, confirmed by the user. Guest/workload inventory remains unverified.

## Hardware / platform

Proxmox host. Physical hardware specifications remain unknown.

## OS

Proxmox platform, confirmed by the user. Exact product version, underlying OS release, kernel and architecture remain unverified.

## Desired state

TODO: Link selected capability profiles and identify intended exceptions. Desired state is not observed state.

## Observed state

Offline in the supplied Tailscale snapshot. No cause or additional reachability test was supplied.

Evidence: user-supplied Phase 1.1 information received 2026-10-05. The Tailscale snapshot capture time was not supplied; no live probe was performed during this documentation update.

## Machine-specific configuration

TODO: Record necessary exceptions and non-secret settings once. Keep credentials external.

## Reproducible configuration references

Platform configuration: [proxmox mapping](../../configs/platforms/proxmox.md), currently a placeholder. Desired capability profiles and machine-specific exceptions still require review; this link does not assert the profile is applied.

## Networking

Known node name: `pve-lab`, as supplied by the user. See the [machine inventory](../README.md) for the confirmed association. A Tailscale node name is not an immutable hardware identity.

Do not store the current Tailscale IP as permanent identity. Addresses, leases and reachability require dated observations; no IP or credential is recorded here.

## Services

No services or workloads have been established by the supplied evidence. Record only verified services and link their canonical configuration/runbook records.

## Known issues

Offline in the supplied Tailscale snapshot; see Observed state. Cause and operational impact have not been established. Other issues remain unverified.

## Incident history

TODO: Record date, symptom, investigation, failed approaches, fix, verification, persistence and runbook references.
