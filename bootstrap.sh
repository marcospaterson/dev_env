#!/usr/bin/env bash
# Takes a fresh WSL/Debian box from nothing to a built home-manager config.
# Run this once. After it finishes, use ./rebuild.sh for every later change.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
FLAKE="$DIR/flake.nix"

echo "==> Step 1: Determinate Nix"
if command -v nix >/dev/null 2>&1; then
  echo "    nix already installed, skipping"
else
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix \
    | sh -s -- install --no-confirm
  # shellcheck disable=SC1091
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

echo "==> Step 2: match the username in flake.nix to this machine"
# flake.nix pins one username. If this box uses a different user, rewrite it so
# the homeConfigurations attr matches $USER on every future switch.
if grep -q "user = \"${USER}\"" "$FLAKE"; then
  echo "    already set to '$USER', nothing to do"
else
  sed -i "s/^\(\s*user = \"\)[^\"]*\(\".*\)$/\1${USER}\2/" "$FLAKE"
  echo "    rewrote flake.nix to user '$USER'"
fi

echo "==> Step 3: symlink this repo to ~/.dotfiles"
# home.nix resolves its mkOutOfStoreSymlink paths through ~/.dotfiles, so this
# has to exist before the first switch or the build will fail to find them.
ln -sfn "$DIR" ~/.dotfiles

echo "==> Step 4: first home-manager switch"
# The flake pins both nixpkgs and home-manager, so running the activation
# package directly is enough - no separate home-manager install required.
cd "$DIR"
nix run ".#homeConfigurations.${USER}.activationPackage"

echo "==> Done. Use ./rebuild.sh for future changes."
