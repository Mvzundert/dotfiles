#!/usr/bin/env bash
set -euo pipefail

KITTY_DIR="$HOME/.config/kitty"
NVIM_DIR="$HOME/.config/nvim"
DOOM_CONFIG_DIR="$HOME/.config/doom"

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------
usage() {
    echo "Usage: theme-switch.sh <theme>"
    echo "  themes: gruvbox | doom-one | tokyonight"
    exit 1
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
    if [[ ! -d "$KITTY_DIR" ]]; then
        echo "   kitty: config dir not found, skipping"
        return
    fi

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
    if [[ ! -d "$NVIM_DIR" ]]; then
        echo "   nvim: config dir not found, skipping"
        return
    fi

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
    local bat_theme
    case "$1" in
        gruvbox)   bat_theme="gruvbox" ;;
        doom-one)  bat_theme="Dracula" ;;
        tokyonight) bat_theme="Dracula" ;;
    esac

    local fish_conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}/fish/conf.d"
    if [[ ! -d "$fish_conf_dir" ]]; then
        echo "   bat: fish conf.d not found, skipping"
        return
    fi

    printf 'set -gx BAT_THEME "%s"\n' "$bat_theme" > "$fish_conf_dir/theme_bat.fish"
    echo "   bat: theme -> $bat_theme (via BAT_THEME env var)"
}

# -------------------------------------------------------------------
# Doom Emacs
# -------------------------------------------------------------------
doom_switch() {
    local doom_theme_file="$DOOM_CONFIG_DIR/current-theme.el"
    if [[ ! -d "$DOOM_CONFIG_DIR" ]]; then
        echo "   doom-emacs: config dir not found, skipping"
        return
    fi

    local doom_theme
    case "$1" in
        gruvbox)    doom_theme="doom-gruvbox" ;;
        doom-one)   doom_theme="doom-one" ;;
        tokyonight) doom_theme="doom-tokyo-night" ;;
    esac

    printf "(setq doom-theme '%s)\n" "$doom_theme" > "$doom_theme_file"
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
