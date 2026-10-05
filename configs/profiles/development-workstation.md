# Development workstation: portable desired capabilities

Status: concept only. No package list, provisioning implementation or installed-state assertion.

This profile describes desired development capabilities independent of distribution: a usable development shell, version control, editor, compilation/debugging workflow and isolated language environments. Embedded development and container tooling can be explicit optional additions rather than assumptions for every workstation.

[Platform mappings](../platforms/README.md) will describe release/architecture-specific implementation after inspection and verification. [Machine records](../../machines/README.md) select capabilities, record exceptions and document observed results.

To reproduce a Debian environment on Ubuntu, select equivalent capabilities, review Ubuntu-specific mappings and configuration differences, then verify behavior on the target. Do not copy a package dump, home directory or entire personal shell configuration.

## Open definition work

- Confirm required versus optional capabilities.
- Define supported OS releases and CPU architectures.
- Inspect actual tool requirements before choosing packages.
- Define configuration parameters, validation, rollback and persistence.
- Keep credentials external and machine-specific state out of shared definitions.
