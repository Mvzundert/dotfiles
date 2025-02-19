# Enable zsh profiling for debugging
# zmodload zsh/zprof

# Set encoding
export LC_ALL=en_US.UTF-8

# -------------------------------------------------------------------
# Set dotfile paths for easier editing.
# -------------------------------------------------------------------
export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh
export MODULES=$ZSH/modules

# -------------------------------------------------------------------
# Report time and code stuff.
# -------------------------------------------------------------------
# display how long all tasks over 10 seconds take
export REPORTTIME=10

# -------------------------------------------------------------------
# Load utils file to activate helpers
# -------------------------------------------------------------------
source $ZSH/utils.zsh

# -------------------------------------------------------------------
# Load file to determine which modules are active
# -------------------------------------------------------------------
source $ZSH/load.zsh

# -------------------------------------------------------------------
# Load config
# -------------------------------------------------------------------
# Function to load all ZSH config
for file in $ZSH/config/*; do
    source "$file"
done

# -------------------------------------------------------------------
# Load all custom files
# -------------------------------------------------------------------
# Function to load all custom files, if you break it, it's on you.
for file in $ZSH/custom/custom_*; do
    source "$file"
done

export ALTERNATE_EDITOR="nano"
export GPG_TTY=$(tty)

# -------------------------------------------------------------------
# Custom .zshrc source highlighting
# see: https://github.com/zsh-users/zsh-syntax-highlighting
# Why must zsh-syntax-highlighting.zsh be sourced at the end of the .zshrc file?
# zsh-syntax-highlighting.zsh wraps ZLE widgets.
# It must be sourced after all custom widgets have been created (i.e., after all zle -N calls and after running compinit).
# Widgets created later will work, but will not update the syntax highlighting.
# -------------------------------------------------------------------
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable zsh profiling for debugging
# zprof
