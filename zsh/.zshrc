# Enable zsh profiling for debugging
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# define the code directory
# # This is where my code exists and where I want the `c` autocomplete to work from exclusively
if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZSH/.p10k.zsh ]] || source $ZSH/.p10k.zsh

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
