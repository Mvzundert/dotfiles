# Enable zsh profiling for debugging
# zmodload zsh/zprof

# Set encoding
export LC_ALL=en_US.UTF-8

# -------------------------------------------------------------------
# Set dotfile paths for easier editing.
# -------------------------------------------------------------------
# Detect dotfiles root from the .zshrc symlink location, fallback to known path
if [[ ! -d "$DOTFILES" && -L "$HOME/.zshrc" ]]; then
    local target="$(readlink "$HOME/.zshrc")"
    [[ "$target" != /* ]] && target="$(dirname "$HOME/.zshrc")/$target"
    DOTFILES="$(cd "$(dirname "$target")/../.." && pwd -P)"
fi
: ${DOTFILES:=$HOME/code/dotfiles}
export DOTFILES
export ZSH=$DOTFILES/shells/zsh
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
