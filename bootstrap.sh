#!/usr/bin/env bash
# Takes a fresh WSL/Debian box from nothing to a built home-manager config.
# Run this once. After it finishes, use ./rebuild.sh for every later change.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

echo "==> Step 1: Determinate Nix"
if command -v nix >/dev/null 2>&1; then
  echo "    nix already installed, skipping"
else
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix \
    | sh -s -- install --no-confirm
  # shellcheck disable=SC1091
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

echo "==> Step 2: symlink this repo to ~/.dotfiles"
# home.nix resolves its mkOutOfStoreSymlink paths through ~/.dotfiles, so this
# has to exist before the first switch or the build will fail to find them.
ln -sfn "$DIR" ~/.dotfiles

echo "==> Step 3: first home-manager switch"
# home-manager isn't installed yet on a fresh box, so run it straight from the
# release branch this once. The user config it applies is still pinned by this
# repo's flake.lock. After this, rebuild.sh works normally.
# "$USER" here is the attr name in flake.nix's homeConfigurations - it has to match.
nix run github:nix-community/home-manager/release-26.05 -- \
  switch --flake ~/.dotfiles#$USER

echo "==> Done. Use ./rebuild.sh for future changes."
