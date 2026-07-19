#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$repo_dir/README.md"
  "$repo_dir/ROADMAP.md"
  "$repo_dir/docs/DEBIAN.md"
  "$repo_dir/docs/DOCKER.md"
  "$repo_dir/docs/PODMAN.md"
  "$repo_dir/docs/DECISIONS.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "Missing required file: $file" >&2
    exit 1
  fi
done

echo "Repository verification passed."
