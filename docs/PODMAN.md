# Podman

Podman is a strong alternative when rootless operation and a more daemonless model are preferred.

## Trade-offs
- Pros: rootless containers, better fit for security-focused labs, and a more service-oriented model with systemd units.
- Cons: slightly less ubiquitous than Docker in some examples, and some workflows may need adaptation.

## Recommended approach
- Use Podman when container isolation and a more Linux-native design are priorities.
- Prefer rootless containers for development and lab experimentation where practical.
- Keep container definitions versioned in the repository for repeatability.

## Reference
- Official Podman documentation: https://podman.io/docs
