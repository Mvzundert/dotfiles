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

## Fastfetch
System info fetch, custom config at `tools/tui/fastfetch/config.jsonc`.

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

Config lives in `tools/nvim/`. Uses Neovim 0.12+ native features:
- **Plugin manager**: `vim.pack.add()` (replaces lazy.nvim)
- **LSP**: `vim.lsp.config()` / `vim.lsp.enable()` with mason for binary management
- **Treesitter**: native `vim.treesitter.ensure_installed`
- **Inline completion**: native `vim.lsp.inline_completion.enable()`
- **Plugins**: blink.cmp (completion), conform.nvim (format), snacks.nvim (picker/zen/terminal), gitsigns.nvim, noice.nvim, which-key.nvim, bufferline.nvim, oil.nvim, trouble.nvim, todo-comments.nvim, markview.nvim, cloak.nvim, mini.nvim, friendly-snippets, tokyonight.nvim (theme)

# Tools

## Window Managers (Linux)
- **Hyprland** — `tools/wayland/hypr/` — compositor with Hypridle/Hyprlock, wofi launcher, dunst notifications
- **Sway** — `tools/wayland/sway/` — i3-compatible Wayland compositor
- **Cosmic** — `tools/wayland/cosmic/` — COSMIC desktop environment config
- **Waybar** — `tools/wayland/waybar/` — status bar (shared across WMs)
- **Kanshi** — `tools/wayland/kanshi/` — multi-monitor profiles (Home/Office/Traveling/Presentation)

## Scripts
Handy utilities in `tools/scripts/`:
- `idle.sh` — Caffeine toggle (supports Hyprland & Sway)
- `powermenu.sh` — Power menu for Wayland sessions
- `any2pdf.sh` — Convert any file to PDF
- `random_wallpaper.sh` — Wallpaper rotation via swww
- `cosmic-clip.sh` — COSMIC clipboard helper + systemd service
- `laptoplid.sh` — Laptop lid action handler
- `sddm-setup.sh` — SDDM display manager setup

## macOS
- **Homebrew**: `tools/homebrew/Brewfile` (328+ formulae and casks)

## Arch Linux
- **Package lists**: `tools/arch/{official,aur}_pkglist.txt`
- **Setup scripts**: `full_system_setup.sh`, `install_packages.sh`, `install_config.sh`, `audit_arch.sh`
- **Pacman config**: `tools/arch/pacman.conf`

## Cross-Shell Prompt
Starship prompt at `tools/prompt/starship.toml` — git status, 9+ language modules, Docker context, hostname/LAN IP (SSH only).

## Other Tools
- **Bat** — `tools/bat/config` (Dracula theme)
- **Eza** — 14 theme files in `tools/eza/themes/`
- **Zed** — `tools/zed/settings.json`
- **SSH helpers** — `tools/ssh/` (minimal remote configs)
- **Doom Emacs** (archival) — `tools/doom-emacs/`
- **StyLua** — `tools/nvim/.stylua.toml`

# Prerequisites

- Git
- Fish shell
- Kitty terminal (or Ghostty)
- Neovim 0.12+
- Starship prompt
- Homebrew (macOS)
- Nerd Font (JetBrainsMono Nerd Font recommended)
- swww (wallpaper engine, Linux)

# Usage

Run the installer to symlink configs:

```bash
./tools/install/install.sh
```

Or symlink individual configs manually to `~/.config/`.
