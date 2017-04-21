# -------------------------------------------------------------------
# Path to your oh-my-zsh installation.
# -------------------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
# -------------------------------------------------------------------
# ZSH Config options
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.
if [ -f ~/.zsh_config/zshconfig ]; then
  source ~/.zsh_config/zshconfig
else
  print "404: ~/.zsh_config/zshconfig not found."
fi
# -------------------------------------------------------------------
# Plugins
# -------------------------------------------------------------------
# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
if [ -f ~/.zsh_config/zshpaths ]; then
  source ~/.zsh_config/zshpaths
else
  print "404: ~/.zsh_config/zshpaths not found."
fi
# -------------------------------------------------------------------
#  Custom Aliases
# -------------------------------------------------------------------
# Function to check if custom alias exist
# If not we display an error (comment this or the error if you don't
# want to use it.
if [ -f ~/.zsh_config/zshalias ]; then
  source ~/.zsh_config/zshalias
else
  print "404: ~/.zsh_config/zshalias not found."
fi
# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.
if [ -f ~/.zsh_config/zshfunctions ]; then
  source ~/.zsh_config/zshfunctions
else
  print "404: ~/.zsh_config/zshfunctions not found."
fi
# -------------------------------------------------------------------
# Custom Widgets
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.
if [ -f ~/.zsh_config/zshwidgets ]; then
  source ~/.zsh_config/zshwidgets
else
  print "404: ~/.zsh_config/zshwidgets not found."
fi
