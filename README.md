# THE CRANKY DEVELOPER'S MANIFESTO

I am developing this project for the sole purpose of my own enjoyment.
I make no promises about release date, features, usability, stability,
practicality, or compliance with any normal standards of software
development.

In pursuit of my unhindered enjoyment of this project, the only end-user
I choose to care about in this project is myself, and maybe a few select
friends. The timeline, the features, and the implementation are all
solely at my discretion. I reserve the right to make arbitrary decisions,
and change them at a moment's notice, without owing anyone an explanation.

If you see something here you like, you're welcome to fork the code under
the terms of the LICENSE and do as you wish with it.

If you're still intent on treating this as a viable project, you're welcome
to submit issues and pull requests. I may respond, or I may leave it sitting
indefinitely. If I ignore your bug report or brilliant contribution until
doomsday, don't take it personally.

If you decide to try and _use_ this software, you're taking your sanity
into your own hands. As long as it runs on my machine, that is all I care
about. It may be unstable, or not support your system. I offer neither
warranty nor technical support.

Long story short, I'm just coding for the love of coding!!

# DotFiles

My personal dotfiles, managed across macOS and Linux. Installer available at `./tools/install/install.sh`.

> **Note:** You'll need to manage dependencies yourself if you cherry-pick configs without running the full installer.

# Shells

## Fish (primary)
Opinionated Fish config with Starship prompt, zoxide navigation, fnm Node management, fzf integration, and per-OS key bindings. Config lives in `shells/fish/`.

## ZSH (legacy)
Minimal ZSH setup, kept for reference. Config lives in `shells/zsh/`.

# Terminal Emulators

## Kitty (primary)
GPU-accelerated terminal with Tokyo Night theme. Per-OS settings for font size and opacity:
- **macOS**: font_size 20, opacity 1.0
- **Linux**: font_size 14, opacity 0.9

Config lives in `tools/tui/kitty/`.

## Ghostty
Alternative terminal config. Lives in `tools/tui/ghostty/`.

## Others
Configs for Alacritty (`tools/tui/alacritty/`) and WezTerm (`tools/tui/wezterm/`) are also available.

# Tmux

Terminal multiplexer with TPM plugin manager, vim-style navigation, fzf session switching, and sesh integration.

Key commands:
- `prefix + z`: zoom in on current pane (toggle)
- `prefix + ,`: rename current window
- `prefix + R`: Reload tmux configuration
- `prefix + 1-9`: go to window
- `prefix + n`: next window
- `prefix + p`: previous window
- `prefix + q`: close pane
- `prefix + Q`: close window (confirmation)

Config lives in `tools/multiplex/tmux/`.

# Neovim

Config lives in `tools/nvim/`. Built with lazy.nvim, includes LSP via mason, Treesitter, blink.cmp, snacks.nvim, and Tokyo Night theme.

# Tools

## Window Managers (Linux)
- **Hyprland** — `tools/wayland/hypr/`
- **Sway** — `tools/wayland/sway/`
- **Cosmic** — `tools/wayland/cosmic/`
- **Waybar** — `tools/wayland/waybar/`

Each WM has its own keybinds, window rules, and startup configs.

## Scripts
Handy utilities in `tools/scripts/`:
- `idle.sh` — Caffeine toggle (supports Hyprland & Sway)
- `powermenu.sh` — Power menu for Wayland sessions
- `any2pdf.sh` — Convert any file to PDF
- `random_wallpaper.sh` — Wallpaper rotation

## Brewfile
macOS Homebrew packages in `tools/homebrew/Brewfile` (328+ formulae and casks).

## Starship Prompt
Cross-shell prompt config in `tools/prompt/starship.nf.toml`.

## Git Configs
Per-machine git configurations in `tools/git/` (husband, work, etc.).

## Eza Themes
14 theme files for the modern `ls` replacement in `tools/eza/themes/`.

## Arch Linux
Package lists and setup scripts for Arch Linux in `tools/arch/` (both official and AUR packages).

## Other Tools
- Bat — `tools/bat/config`
- Fastfetch — `tools/tui/fastfetch/config.jsonc`
- Zed — `tools/zed/settings.json`
- SSH helpers — `tools/ssh/`
- Doom Emacs (archival) — `tools/doom-emacs/`

# Prerequisites

- Git
- Fish shell
- Kitty terminal (or Ghostty)
- Neovim 0.12+
- Starship prompt
- Homebrew (macOS)
- Nerd Font (JetBrainsMono Nerd Font recommended)

# Usage

Run the installer to symlink configs:

```bash
./tools/install/install.sh
```

Or symlink individual configs manually to `~/.config/`.
