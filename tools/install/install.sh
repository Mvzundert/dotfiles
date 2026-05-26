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
