# Dotfiles

Repository of configuration files for a Linux workstation using Niri window manager. Repository is private and not intended for distribution. Managed via Git.

Repo: `ecto-devs/dotfiles`

This document describes repository layout and installation procedure for automated agents.

## Stack

* **WM:** Niri
* **Bar / Themes:** Noctalia
* **Terminal:** Ghostty
* **Shell:** Fish + Tide prompt
* **Editor:** Neovim + lazy.nvim
* **File manager:** Yazi
* **Multiplexer:** Herdr
* **Utils:** zoxide, fzf, eza, fastfetch, lazygit

## Structure

```
fish/      # Fish config, Tide prompt, functions, completions
ghostty/   # Ghostty config + custom GLSL cursor shaders
herdr/     # Herdr terminal multiplexer config & plugins
niri/      # Niri KDL config split into modules
noctalia/  # Noctalia bar config & palettes
nvim/      # Neovim init + lua plugins/options/keymaps
yazi/      # Yazi config, flavors, plugins
```

Each tool lives under its own dir mirroring the target `~/.config/<tool>` layout.

## Quick start

Clone repository to a local path and run install script to symlink configurations to $HOME.

```bash
git clone git@github.com:ecto-devs/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Install script creates symlinks from repository directories to expected $HOME locations. Requires stow or manual symlinking.

### Fish
Requires `cachyos-fish-config`, `fzf`, `zoxide`, `eza`.
Config lives in `fish/linux/fish/`. Tide prompt is fully vendored in `functions/`.

### Ghostty
Config: `ghostty/.config/ghostty/config`
Theme: `noctalia`. Custom shaders in `shaders/`.

### Niri
Main config: `niri/.config/niri/config.kdl` includes modular pieces:
`animation.kdl`, `autostart.kdl`, `keybinds.kdl`, `input.kdl`, `display.kdl`, `layout.kdl`, `rules.kdl`, `misc.kdl`, `noctalia.kdl`.

### Noctalia
Bar config: `noctalia/.config/noctalia/config.toml`
Palettes: `noctalia/.config/noctalia/palettes/`

### Neovim
Init: `nvim/.config/nvim/init.lua`
Plugins managed by lazy.nvim. Lazy lock is gitignored.

### Yazi
Config: `yazi/.config/yazi/`
Flavor: `noctalia.yazi/`. Plugins in `plugins/`.

## Git ignore highlights

* Fish generated `fish_variables*`, completions, conf.d, functions
* Neovim `lazy-lock.json`, matugen generated files
* Herdr logs, session, plugins.lock
* Yazi bookmarks & gvfs private data

## Notes

* Vi mode is enabled in Fish: `set -g fish_key_bindings fish_vi_key_bindings`
* Editor set to `nvim`
* ROCm env vars are set for AMD GPU workflows
* Install script is `install.sh` in repository root. Run after clone to apply configurations.
