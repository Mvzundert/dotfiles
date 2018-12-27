# -------------------------------------------------------------------
# Path to your oh-my-zsh installation.
# -------------------------------------------------------------------
#
export ZSH=$HOME/.oh-my-zsh

# -------------------------------------------------------------------
# ZSH Config options
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.
#
if [ -f ~/dotfiles/zsh/custom/zshconfig ]; then
  source ~/dotfiles/zsh/custom/zshconfig
else
  source ~/dotfiles/zsh/config/zshconfig
fi

# -------------------------------------------------------------------
# Plugins
# -------------------------------------------------------------------
# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
plugins=(git extract composer history )

# -------------------------------------------------------------------
# Load Oh-My-ZSH
# -------------------------------------------------------------------
# Source oh-my-zsh after we've done the config and plugins.

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Paths
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source ~/dotfiles/zsh/config/zshpaths

if [ -f ~/dotfiles/zsh/custom/zshpaths ]; then
  source ~/dotfiles/zsh/custom/zshpaths
fi

# -------------------------------------------------------------------
#  Custom Aliases
# -------------------------------------------------------------------
# Function to check if custom alias exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source ~/dotfiles/zsh/config/zshalias

if [ -f ~/dotfiles/zsh/custom/zshalias ]; then
  source ~/dotfiles/zsh/custom/zshalias
fi

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.


source ~/dotfiles/zsh/config/zshfunctions

if [ -f ~/dotfiles/zsh/custom/zshfunctions ]; then
  source ~/dotfiles/zsh/custom/zshfunctions
fi

# -------------------------------------------------------------------
# Custom Widgets
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source ~/dotfiles/zsh/config/zshwidgets

if [ -f ~/dotfiles/zsh/custom/zshwidgets ]; then
  source ~/dotfiles/zsh/custom/zshwidgets
fi
