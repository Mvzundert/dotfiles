#! /bin/bash

echo " "
echo "+++++++++++++++++++++++++++++++++++++++"
echo "++++++++++ Starting installer.... +++++"
echo "+++++++++++++++++++++++++++++++++++++++"
echo " "

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "Dotfiles repo at: $DOTFILES"

# =======================================
# ========= OS dependencies =============
# =======================================
if [ "$(uname)" == "Linux" ]; then
	echo "Running on Linux"
	if command -v pacman &>/dev/null; then
		echo "Arch Linux detected, installing packages..."
		bash "$DOTFILES/tools/arch/install_packages.sh" install 2>/dev/null \
			|| echo "Package install skipped (run tools/arch/install_packages.sh manually)"
	else
		echo "Non-Arch Linux — skipping package manager setup."
		echo "Install dependencies manually, then re-run for config symlinks."
	fi
fi

if [ "$(uname)" == "Darwin" ]; then
	echo "Running on macOS"
	source "$SCRIPT_DIR/brew.sh"
	source "$SCRIPT_DIR/osx.sh"
fi

echo "Initializing submodule(s)"
git submodule update --init --recursive

mkdir -p "$HOME/.config"

#=======================================
#========= Dotfiles symlink ============
#=======================================
if [ ! -L "$HOME/.dotfiles" ]; then
	echo "Linking ~/.dotfiles -> $DOTFILES"
	ln -s "$DOTFILES" "$HOME/.dotfiles"
else
	echo "~/.dotfiles already linked — skipping"
fi

#=======================================
#========= Fish ========================
#=======================================
FISH_DIR="$HOME/.config/fish"
if [ ! -L "$FISH_DIR" ]; then
	[ -d "$FISH_DIR" ] && mv "$FISH_DIR" "$HOME/.config/fish.bak"
	echo "Symlinking Fish config"
	ln -s "$DOTFILES/shells/fish" "$FISH_DIR"
else
	echo "Fish config already linked — skipping"
fi

#=======================================
#========= ZSHRC =======================
#=======================================
FILE="$HOME/.zshrc"
if [ -f "$FILE" ] && [ ! -L "$FILE" ]; then
	mv "$FILE" "$FILE.bak"
fi
if [ ! -L "$FILE" ]; then
	echo "Symlinking .zshrc"
	ln -s "$DOTFILES/shells/zsh/.zshrc" "$FILE"
else
	echo ".zshrc already linked — skipping"
fi

#=======================================
#========= Neovim ======================
#=======================================
NVIM_DIR="$HOME/.config/nvim"
if [ ! -L "$NVIM_DIR" ]; then
	[ -d "$NVIM_DIR" ] && mv "$NVIM_DIR" "$HOME/.config/nvim.bak"
	echo "Symlinking Neovim config"
	ln -s "$DOTFILES/tools/nvim" "$NVIM_DIR"
else
	echo "Neovim config already linked — skipping"
fi

#=======================================
#========= Kitty =======================
#=======================================
KITTY_DIR="$HOME/.config/kitty"
if [ ! -L "$KITTY_DIR" ]; then
	[ -d "$KITTY_DIR" ] && mv "$KITTY_DIR" "$HOME/.config/kitty.bak"
	echo "Symlinking Kitty config"
	ln -s "$DOTFILES/tools/tui/kitty" "$KITTY_DIR"
else
	echo "Kitty config already linked — skipping"
fi

# Create OS-specific platform config symlink
PLATFORM_LINK="$DOTFILES/tools/tui/kitty/platform.conf"
if [ "$(uname)" == "Linux" ]; then
	ln -sf "platform-Linux.conf" "$PLATFORM_LINK"
elif [ "$(uname)" == "Darwin" ]; then
	ln -sf "platform-Darwin.conf" "$PLATFORM_LINK"
fi
echo "Platform config -> $(readlink "$PLATFORM_LINK")"

#=======================================
#========= Starship ====================
#=======================================
STARSHIP_FILE="$HOME/.config/starship.toml"
if [ ! -L "$STARSHIP_FILE" ]; then
	[ -f "$STARSHIP_FILE" ] && mv "$STARSHIP_FILE" "$STARSHIP_FILE.bak"
	echo "Symlinking Starship config"
	ln -s "$DOTFILES/tools/prompt/starship.toml" "$STARSHIP_FILE"
else
	echo "Starship config already linked — skipping"
fi

#=======================================
#========= Tmux + TPM ==================
#=======================================
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
	echo "Installing Tmux Plugin Manager (TPM)"
	mkdir -p "$(dirname "$TPM_DIR")"
	git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
	echo "TPM already installed — skipping"
fi

TMUX_FILE="$HOME/.tmux.conf"
if [ ! -L "$TMUX_FILE" ]; then
	[ -f "$TMUX_FILE" ] && mv "$TMUX_FILE" "$TMUX_FILE.bak"
	echo "Symlinking .tmux.conf"
	ln -s "$DOTFILES/tools/multiplex/tmux/.tmux.conf" "$TMUX_FILE"
else
	echo ".tmux.conf already linked — skipping"
fi

echo '________          __    _____.__.__                 '
echo '\______ \   _____/  |__/ ____\__|  |   ____   ______'
echo ' |    |  \ /  _ \   __\   __\|  |  | _/ __ \ /  ___/'
echo ' |    `   (  (_) )  |  |  |  |  |  |_\  ___/ \___ \ '
echo '/_______  /\____/|__|  |__|  |__|____/\____) ______)'
echo '.... have been installed!'

#=======================================
#========= Theme defaults ==============
#=======================================
echo ""
echo "Setting up theme defaults..."

THEME_KITTY="$DOTFILES/tools/tui/kitty"
if [ ! -f "$THEME_KITTY/current-theme.conf" ]; then
    cp "$THEME_KITTY/tokyonight.conf" "$THEME_KITTY/current-theme.conf"
    echo "Kitty: created default current-theme.conf (tokyo night)"
else
    echo "Kitty: current-theme.conf already exists — skipping"
fi

THEME_NVIM="$DOTFILES/tools/nvim"
if [ ! -f "$THEME_NVIM/current-theme.lua" ]; then
    echo "vim.cmd.colorscheme 'tokyonight'" > "$THEME_NVIM/current-theme.lua"
    echo "Neovim: created default current-theme.lua (tokyonight)"
else
    echo "Neovim: current-theme.lua already exists — skipping"
fi

THEME_FISH="$DOTFILES/shells/fish/conf.d/theme_bat.fish"
if [ ! -f "$THEME_FISH" ]; then
    printf 'set -gx BAT_THEME "Dracula"\n' > "$THEME_FISH"
    echo "Fish: created default theme_bat.fish (Dracula)"
else
    echo "Fish: theme_bat.fish already exists — skipping"
fi

THEME_DOOM="$DOTFILES/tools/doom-emacs"
if [ ! -f "$THEME_DOOM/current-theme.el" ]; then
    printf "(setq doom-theme 'doom-tokyo-night)\n" > "$THEME_DOOM/current-theme.el"
    echo "Doom Emacs: created default current-theme.el (doom-tokyo-night)"
else
    echo "Doom Emacs: current-theme.el already exists — skipping"
fi
