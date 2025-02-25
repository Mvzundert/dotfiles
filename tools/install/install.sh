#! /bin/bash

echo " "
echo "+++++++++++++++++++++++++++++++++++++++"
echo "++++++++++ Starting installer.... +++++"
echo "+++++++++++++++++++++++++++++++++++++++"
echo " "

export DOTFILES=$HOME/.dotfiles

if [[ -d ~/code ]]; then
	export CODE_DIR=~/code
fi

# =======================================
# ========= OS dependencies =============
# =======================================
if [ "$(uname)" == "linux-gnu" ]; then
	echo "\n\nRunning on Linux"
	source apt.sh
fi

if [ "$(uname)" == "Darwin" ]; then
	echo "\n\nRunning on OSX"
	source brew.sh
	source osx.sh
fi

echo "Initializing submodule(s)"
git submodule update --init --recursive

#=======================================
#========= Dotfiles +===================
#=======================================
DIR="$HOME/code/dotfiles"

if [ ! -d $DIR ]; then
	echo "set symlink for dotfiles"
	ln -s $CODE_DIR/dotfiles $HOME/.dotfiles
fi

#=======================================
#========= ZSHRC =======================
#=======================================
FILE="$HOME/.zshrc"

if [ -f $FILE ]; then
	#  echo "File $FILE exists."
	echo "zshrc file was already installed...skipping"
else
	#  echo "$FILE File created"
	echo "zshrc file has been installed"
	# Symlink the .zshrc file that makes sure the config works
	ln -s $DOTFILES/shells/zsh/.zshrc $HOME
fi

#=======================================
#========= Neovim ======================
#=======================================
DIR="$HOME/.config/nvim"

if
	[ ! -d $DIR ]
	echo "NeoVim has been installed...skipping"
then
	echo "NeoVim symlinked"
	ln -s $DOTFILES/tools/nvim/ $HOME/.config/
fi

#=======================================
#========= Starship Conf ===============
#=======================================
FILE="$HOME/.config/starship.toml"

if [ -f $FILE ]; then
	#  echo "File $FILE exists."
	echo "Starship was already installed....skipping"
else
	echo "Starship has been installed."
	# Symlink the .tmux.conf file that makes sure the config works
	ln -s $DOTFILES/tools/prompt/starship_nf.toml $HOME/.config/starship.toml
fi

#=======================================
#========= TMUX  TPM ===================
#=======================================
DIR="$HOME/.tmux/plugins/tpm"

# Check if the tmux dir is emtpy (it should be)
if [ "$(ls -A $DIR)" ]; then
	# if we have TPM already we skip it.
	echo "TPM has been installed...skipping"
else
	# if we don't have TPM we install it.
	echo "TPM has been installed"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

#=======================================
#========= TMUX Conf ===================
#=======================================
FILE="$HOME/.tmux.conf"

if [ -f $FILE ]; then
	#  echo "File $FILE exists."
	echo "Tmux.conf was already installed....skipping"
else
	#  echo "$FILE File created"
	echo "Tmux.conf has been installed."
	# Symlink the .tmux.conf file that makes sure the config works
	ln -s $DOTFILES/tools/multiplex/tmux/.tmux.conf $HOME
fi

echo '________          __    _____.__.__                 '
echo '\______ \   _____/  |__/ ____\__|  |   ____   ______'
echo ' |    |  \ /  _ \   __\   __\|  |  | _/ __ \ /  ___/'
echo ' |    `   (  (_) )  |  |  |  |  |  |_\  ___/ \___ \ '
echo '/_______  /\____/|__|  |__|  |__|____/\____) ______)'
echo '.... have been installed!'
echo ''
echo ''
echo 'Please look over the ~dotfiles/zsh/config, tmux.conf  and ~/.vim folders to select plugins, themes, and options.'
