#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_dirs=(
  machines runbooks homelab
  configs/profiles configs/platforms configs/templates configs/services
  scripts decisions
)

required_files=(
  README.md ROADMAP.md AGENTS.md
  docs/DEBIAN.md docs/DOCKER.md docs/PODMAN.md docs/DECISIONS.md
  machines/README.md machines/TEMPLATE.md
  machines/baltazar-zbook-debian/README.md
  machines/p520-ubuntu/README.md
  machines/pve-lab/README.md
  machines/pve-braganca/README.md
  machines/rpi5/README.md
  machines/rpi5/inventory.md
  machines/rpi5/observations.md
  machines/rpi4-samorinha/README.md
  machines/rpi4-samorinha/inventory.md
  machines/rpi4-samorinha/observations.md
  machines/toshiba-node/README.md
  machines/toshiba-node/inventory.md
  machines/toshiba-node/observations.md
  runbooks/README.md runbooks/TEMPLATE.md
  runbooks/audio/hp-zbook-sof-pipewire-speakers.md
  runbooks/development/vim.md
  runbooks/development/vim-clipboard-images.md
  runbooks/development/c-debugging.md
  runbooks/development/serial-device-access.md
  runbooks/desktop/x11-wayland-diagnostics.md
  runbooks/git/workflow.md
  runbooks/networking/connectivity-and-dns.md
  runbooks/networking/tailscale.md
  runbooks/networking/ssh-remote-access.md
  runbooks/networking/internet-sharing.md
  runbooks/services/nextcloud-upload-recovery.md
  homelab/README.md
  homelab/networking/topology.md
  homelab/incidents/README.md
  homelab/incidents/undated-nextcloud-android-upload-recovery.md
  homelab/incidents/undated-mobile-tethering-router-sharing.md
  homelab/incidents/undated-resolver-file-overwrite.md
  configs/profiles/README.md configs/profiles/development-workstation.md
  configs/platforms/README.md
  configs/platforms/debian.md configs/platforms/ubuntu.md
  configs/platforms/proxmox.md configs/platforms/raspberry-pi.md
  configs/templates/README.md configs/services/README.md
  configs/templates/bash/aliases.sh configs/templates/vim/markdown-images.vim
  scripts/README.md scripts/verify_repo.sh
  decisions/README.md decisions/TEMPLATE.md
  decisions/2026-10-05-repository-structure.md
  decisions/planning/README.md
  decisions/planning/2026-10-05/engineering-lab-architecture.md
  decisions/planning/2026-10-05/engineering-lab-migration-v2.md
)

for dir in "${required_dirs[@]}"; do
  if [[ ! -d "$repo_dir/$dir" ]]; then
    echo "Missing required directory: $dir" >&2
    exit 1
  fi
done

for file in "${required_files[@]}"; do
  if [[ ! -s "$repo_dir/$file" ]]; then
    echo "Missing or empty required file: $file" >&2
    exit 1
  fi
done

bash -n "$repo_dir/configs/templates/bash/aliases.sh"

echo "Repository verification passed (structure, canonical runbooks/cases, alias syntax and retained documentation)."
