# -------------------------------------------------------------------
# Set dotfile paths for easier editing.
# -------------------------------------------------------------------
export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/zsh

# -------------------------------------------------------------------
# Report time and code stuff.
# -------------------------------------------------------------------
# display how long all tasks over 10 seconds take
export REPORTTIME=10

# define the code directory
# # This is where my code exists and where I want the `c` autocomplete to work from exclusively
 if [[ -d ~/code ]]; then
     export CODE_DIR=~/code
 fi

# -------------------------------------------------------------------
# ZSH Utilities 
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source $ZSH/config/zshutils

if [ -f $ZSH/custom/zshutils ]; then
    source $ZSH/custom/zshutils
fi
# -------------------------------------------------------------------
# Prompt styling and such
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source $ZSH/config/zshprompt

if [ -f $ZSH/custom/zshprompt ]; then
    source $ZSH/custom/zshprompt
fi

# -------------------------------------------------------------------
# ZSH Config options
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source $ZSH/config/zshconfig

if [ -f $ZSH/custom/zshconfig ]; then
    source $ZSH/custom/zshconfig
fi

# -------------------------------------------------------------------
# Paths
# -------------------------------------------------------------------
# Function to check if custom path exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source $ZSH/config/zshpaths

if [ -f $ZSH/custom/zshpaths ]; then
    source $ZSH/custom/zshpaths
fi

# -------------------------------------------------------------------
#  Aliases
# -------------------------------------------------------------------
# Function to check if custom alias exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source $ZSH/config/zshalias

if [ -f $ZSH/custom/zshalias ]; then
    source $ZSH/custom/zshalias
fi

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
# Function to check if custom functions exist
# If not we display an error (comment this or the error if you don't
# want to use it.


source $ZSH/config/zshfunctions

if [ -f $ZSH/custom/zshfunctions ]; then
    source $ZSH/custom/zshfunctions
fi

# -------------------------------------------------------------------
# Plugins
# -------------------------------------------------------------------
# Function to check if plugins exist
# If not we display an error (comment this or the error if you don't
# want to use it.

source $ZSH/config/zshplugins

if [ -f $ZSH/custom/zshplugins ]; then
    source $ZSH/custom/zshplugins
fi
