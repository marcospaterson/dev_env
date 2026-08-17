#!/usr/bin/env bash
# Apply the current home-manager config. Run this after editing home.nix,
# flake.nix, or any file under home/.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ln -sfn "$DIR" ~/.dotfiles
cd "$DIR"
nix run ".#homeConfigurations.${USER}.activationPackage"
