# Docker

Docker remains a strong choice for labs that need the broadest ecosystem support and straightforward onboarding.

## Trade-offs
- Pros: large ecosystem, widely documented, strong compose support.
- Cons: daemon-based model, more privileged runtime behavior, and more operational nuance on Debian hosts.

## Recommended approach
- Use Docker for general container work where convenience matters most.
- Keep images pinned to specific versions when reproducibility matters.
- Store compose files in the repository when they are part of a lab workflow.

## Reference
- Official Docker documentation: https://docs.docker.com/
