#!/usr/bin/env bash
set -euo pipefail

# One command to scaffold this machine's dev environment from the repo.
# HTTPS clone so a fresh machine needs no SSH key; switch your remote to SSH
# afterward with: git -C "$TARGET" remote set-url origin git@github.com:mathcrln/dotfiles.git
REPO="https://github.com/mathcrln/dotfiles.git"
TARGET="$HOME/Developer/dotfiles"

# 1. Install Nix if missing, then load it into this shell.
if ! command -v nix >/dev/null 2>&1; then
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
  if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  fi
fi

# 2. Enable flakes.
mkdir -p "$HOME/.config/nix"
grep -q "experimental-features" "$HOME/.config/nix/nix.conf" 2>/dev/null || \
  echo "experimental-features = nix-command flakes" >> "$HOME/.config/nix/nix.conf"

# 3. Clone the repo (source of truth).
if [ ! -d "$TARGET" ]; then
  git clone "$REPO" "$TARGET"
fi

# 4. Build + activate. `nix run` bootstraps home-manager itself; -b backs up
#    any pre-existing files HM would otherwise refuse to overwrite.
nix run github:nix-community/home-manager/release-25.11 -- \
  switch -b pre-hm --flake "$TARGET#mathcrln"

echo ""
echo "Done. Open a new terminal."
