#!/usr/bin/env bash
set -euo pipefail

# 1. Install Determinate Nix if missing.
if ! command -v nix >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

# 2. Activate home-manager from this repo.
nix run github:nix-community/home-manager/release-25.11 -- \
  switch -b pre-hm --flake ".#mathcrln"

echo "Done. Open a new terminal."