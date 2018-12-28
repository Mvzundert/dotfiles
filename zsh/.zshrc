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

