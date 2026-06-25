#!/usr/bin/env bash
set -euo pipefail

KITTY_DIR="$HOME/.config/kitty"
NVIM_DIR="$HOME/.config/nvim"
BAT_CONFIG="$HOME/.config/bat/config"
DOOM_CONFIG_DIR="$HOME/.config/doom"

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------
usage() {
    echo "Usage: theme-switch.sh <theme>"
    echo "  themes: gruvbox | doom-one | tokyonight"
    exit 1
}

# Cross-platform in-place sed
ised() {
    local expr="$1" file="$2"
    if sed --version &>/dev/null 2>&1; then
        sed -i "$expr" "$file"       # GNU sed (Linux)
    else
        sed -i '' "$expr" "$file"    # BSD sed (macOS)
    fi
}

# -------------------------------------------------------------------
# Parse argument
# -------------------------------------------------------------------
THEME="${1:-}"
if [[ ! "$THEME" =~ ^(gruvbox|doom-one|tokyonight)$ ]]; then
    usage
fi

echo "==> Switching everything to $THEME …"

# -------------------------------------------------------------------
# Kitty — terminal emulator
# -------------------------------------------------------------------
kitty_switch() {
    local kitty_theme="$1"
    case "$1" in
        gruvbox) kitty_theme="gruvbox-dark" ;;
    esac
    local theme_file="$KITTY_DIR/$kitty_theme.conf"
    local current="$KITTY_DIR/current-theme.conf"

    if [[ ! -f "$theme_file" ]]; then
        echo "   kitty: WARNING — $theme_file not found, skipping"
        return
    fi

    cp "$theme_file" "$current"
    echo "   kitty: current-theme.conf -> $1"

    if command -v kitty &>/dev/null && kitty @ ls &>/dev/null 2>&1; then
        kitty @ set-colors --all -c "$current" 2>/dev/null || true
        echo "   kitty: hot-reloaded all windows"
    fi
}

# -------------------------------------------------------------------
# Neovim — editor
# -------------------------------------------------------------------
nvim_switch() {
    local theme_file="$NVIM_DIR/current-theme.lua"
    local nvim_colorscheme

    case "$1" in
        gruvbox)   nvim_colorscheme="gruvbox" ;;
        doom-one)  nvim_colorscheme="doom-one" ;;
        tokyonight) nvim_colorscheme="tokyonight" ;;
    esac

    echo "vim.cmd.colorscheme '$nvim_colorscheme'" > "$theme_file"
    echo "   nvim: current-theme.lua -> $nvim_colorscheme"

    if command -v nvim &>/dev/null; then
        for server in $(nvim --serverlist 2>/dev/null || true); do
            nvim --server "$server" --remote-expr "vim.cmd.colorscheme('$nvim_colorscheme')" 2>/dev/null || true
        done
    fi
}

# -------------------------------------------------------------------
# Bat — syntax highlighter
# -------------------------------------------------------------------
bat_switch() {
    local config="$BAT_CONFIG"
    if [[ ! -f "$config" ]]; then
        echo "   bat: config not found, skipping"
        return
    fi

    local bat_theme
    case "$1" in
        gruvbox)   bat_theme="gruvbox" ;;
        doom-one)  bat_theme="Dracula" ;;
        tokyonight) bat_theme="Dracula" ;;
    esac

    ised "s/^--theme=.*/--theme=\"$bat_theme\"/" "$config"
    echo "   bat: theme -> $bat_theme"
}

# -------------------------------------------------------------------
# Doom Emacs
# -------------------------------------------------------------------
doom_switch() {
    local config="$DOOM_CONFIG_DIR/config.el"
    if [[ ! -f "$config" ]]; then
        echo "   doom-emacs: config not found, skipping"
        return
    fi

    local doom_theme
    case "$1" in
        gruvbox)    doom_theme="doom-gruvbox" ;;
        doom-one)   doom_theme="doom-one" ;;
        tokyonight) doom_theme="doom-tokyo-night" ;;
    esac

    ised "s/(setq doom-theme '[^)]*'/(setq doom-theme '$doom_theme'/" "$config"
    echo "   doom-emacs: theme -> $doom_theme"
}

# -------------------------------------------------------------------
# Run all
# -------------------------------------------------------------------
kitty_switch "$THEME"
nvim_switch "$THEME"
bat_switch "$THEME"
doom_switch "$THEME"

echo "==> Done. Switched to $THEME."
