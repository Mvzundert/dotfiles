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
if [ -f ~/dotfiles/zsh/config/zshconfig ]; then
  source ~/dotfiles/zsh/config/zshconfig
else
  print "404: ~/dotfiles/zsh/config/zshconfig not found."
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
plugins=(git extract web-search composer history sudo)

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

if [ -f ~/dotfiles/zsh/config/zshpaths ]; then
  source ~/dotfiles/zsh/config/zshpaths
else
  print "404: ~/dotfiles/zsh/config/zshpaths not found."
fi

# -------------------------------------------------------------------
#  Custom Aliases
# -------------------------------------------------------------------
# Function to check if custom alias exist
# If not we display an error (comment this or the error if you don't
# want to use it.

if [ -f ~/dotfiles/zsh/config/zshalias ]; then
  source ~/dotfiles/zsh/config/zshalias
else
  print "404: ~/dotfiles/zsh/config/zshalias not found."
fi

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.

if [ -f ~/dotfiles/zsh/config/zshfunctions ]; then
  source ~/dotfiles/zsh/config/zshfunctions
else
  print "404: ~/dotfiles/zsh/config/zshfunctions not found."
fi

# -------------------------------------------------------------------
# User Custom Aliases
# -------------------------------------------------------------------
# Function to check if user custom alias exist
# If not we display an error (comment this or the error if you don't
# want to use it.

if [ -f ~/dotfiles/zsh/custom/zshalias ]; then
  source ~/dotfiles/zsh/custom/zshalias
else
  print "404: ~/dotfiles/zsh/custom/zshalias not found."
fi

# -------------------------------------------------------------------
# Custom Widgets
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.
if [ -f ~/dotfiles/zsh/config/zshwidgets ]; then
  source ~/dotfiles/zsh/config/zshwidgets
else
  print "404: ~/dotfiles/zsh/config/zshwidgets not found."
fi
