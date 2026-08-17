# Portability Guide

This repo turns a fresh WSL/Debian box into a working terminal + editor setup. It is designed to be cloned on any Windows + WSL machine and produce the same result. This guide covers moving it to a new machine (e.g. your work laptop).

## What the repo contains

| File | Purpose |
|---|---|
| `flake.nix` | Pins nixpkgs, nixpkgs-unstable, and home-manager versions |
| `home.nix` | Packages, shell, and symlinks for everything in `home/` |
| `bootstrap.sh` | One-time setup: installs Nix, rewrites the username, first switch |
| `rebuild.sh` | Every later change: re-applies the config |
| `home/AGENTS.md` | Single source of truth for agent instructions |
| `home/PLAYGROUND.md` | WezTerm + nvim hotkey training deck |
| `home/.config/wezterm` | WezTerm config (cross-platform) |
| `home/.config/nvim` | Neovim config (cross-platform) |

## Move to a new machine

1. **Push this repo to GitHub** (only needed once):
   ```
   git -C ~/.dotfiles add -A
   git -C ~/.dotfiles commit -m "portable setup"
   git -C ~/.dotfiles remote add origin <your-repo-url>
   git -C ~/.dotfiles push -u origin master
   ```
2. **On the new machine**, install WSL + WSLg with a Debian distro.
3. Clone the repo and bootstrap:
   ```
   git clone <your-repo-url> ~/my-term-config
   cd ~/my-term-config
   ./bootstrap.sh
   ```
   That is the entire install. `bootstrap.sh` installs Determinate Nix, rewrites the username in `flake.nix` to match the new machine, symlinks the repo to `~/.dotfiles`, and runs the first home-manager switch.

4. **One-time dependencies not managed by this repo** (both machines):
   - Windows: WSLg enabled (default in current Windows 11), `wsl --install` if needed.
   - Linux side: Mesa EGL so WezTerm can create windows:
     ```
     sudo apt-get update && sudo apt-get install -y libegl1 libegl-mesa0 libgl1-mesa-dri
     ```
     This was the fix for the original "wezterm opens nothing" bug.

## What is portable already

- **wezterm.lua** - no OS-specific code; renders on WSLg.
- **nvim/** - `colorscheme.lua` already detects Windows/WSL/Darwin for transparency. `plugin.lua` bootstraps lazy.nvim automatically, so plugins install on first launch on the new machine.
- **Symlinks** (`AGENTS.md`, configs, `PLAYGROUND.md`) all resolve through `~/.dotfiles`, which both scripts create.
- **Username** - `bootstrap.sh` rewrites `flake.nix`'s `user = "..."` to match `$USER` of the new machine. `rebuild.sh` and `bootstrap.sh` both use `$USER`, so nothing else hardcodes the name.

## What you must change per machine

- **`~/.gitconfig`** - git identity. Set it on the new machine:
  ```
  git config --global user.name "Your Name"
  git config --global user.email "you@work.com"
  ```
  Consider making it match your work email, not your personal one.
- **Fonts** - `nerd-fonts.hack` installs via home-manager. On WSL the fontconfig setup handles it; if glyphs look wrong, run `fc-cache -fv` and restart WezTerm.

## Day-to-day workflow

```
# after editing home.nix or anything in home/
./rebuild.sh
```

After editing `home/.config/wezterm/wezterm.lua`, hit `Ctrl+Shift+R` inside WezTerm instead of rebuilding.

## Troubleshooting on the new machine

| Symptom | Fix |
|---|---|
| `wezterm` opens nothing | install Mesa EGL (step 4 above) |
| `wezterm` command not found after bootstrap | open a new shell so the Nix profile is on PATH |
| `nix` not found in scripts | run `. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh` |
| glyphs look wrong | `fc-cache -fv`, restart WezTerm |
| username mismatch error | delete `flake.nix`, re-run `./bootstrap.sh` (it rewrites the username) |
