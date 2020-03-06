# Set encoding
export LC_ALL=en_US.UTF-8

# -------------------------------------------------------------------
# Set dotfile paths for easier editing.
# -------------------------------------------------------------------
export DOTFILES=$HOME/.dotfiles
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
# ZSH config
# -------------------------------------------------------------------
# Function to load all ZSH config
for file in $ZSH/config/*; do
    source "$file"
done

# -------------------------------------------------------------------
# Source all custom files
# -------------------------------------------------------------------
# Function to load all custom files, if you break it, it's on you.
for file in $ZSH/custom/custom_*; do
    source "$file"
done

# -------------------------------------------------------------------
# Custom .zshrc source highlighting
# see: https://github.com/zsh-users/zsh-syntax-highlighting
# Why must zsh-syntax-highlighting.zsh be sourced at the end of the .zshrc file?
# zsh-syntax-highlighting.zsh wraps ZLE widgets.
# It must be sourced after all custom widgets have been created (i.e., after all zle -N calls and after running compinit).
# Widgets created later will work, but will not update the syntax highlighting.
# -------------------------------------------------------------------
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
