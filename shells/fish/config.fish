# ~/.config/fish/config.fish

# Enable starship prompt
starship init fish | source

# make the DOFILES variable available to all fish scripts
set -gx DOTFILES $HOME/code/dotfiles/

# Execute the font size script on terminal start
sh $DOTFILES/tools/tui/ghostty/scripts/set_font_size.sh

# Disable welcome message
set -g fish_greeting ""

# Load custom functions
for file in ~/.config/fish/functions/*.fish
    source $file
end

# Initialize zoxide
if type -q zoxide
    zoxide init fish | source
end

# use fnm to switch node versions
fnm env --use-on-cd | source

# Set environment variables
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -Ux COMPOSER_MEMORY_LIMIT -1 # Remove composer memory limit
set -Ux HOMEBREW_NO_ENV_HINTS 1

# Function to add a directory to PATH if it exists and isn't already in PATH
function add_to_path
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH $argv[1] $PATH
        end
    end
end

# Add common bin directories to PATH
add_to_path "$HOME/bin"
add_to_path "/usr/bin"
add_to_path "/usr/local/bin"
add_to_path "$HOME/.local/bin"
add_to_path "/usr/local/sbin"
add_to_path "/usr/sbin"
add_to_path "$HOME/.composer/vendor/bin"
add_to_path "$HOME/.rbenv/bin"
add_to_path "$HOME/.phpenv/bin"
add_to_path "/usr/local/opt/mysql-client/bin"
add_to_path "/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin"
add_to_path "$HOME/.cargo/bin"
add_to_path "/usr/local/go/bin"
add_to_path "$HOME/.emacs.d/bin"

# Initialize OPAM if its init file exists
if test -r "$HOME/.opam/opam-init/init.fish"
    source "$HOME/.opam/opam-init/init.fish" > /dev/null 2> /dev/null
end

# Init phpenv to make sure it gets used
if test -r "$HOME/.phpenv/bin/phpenv"
    eval "$(phpenv init -)"
end

# Added by `rbenv init` on Thu Aug 28 10:01:45 PM CEST 2025
status --is-interactive; and rbenv init - --no-rehash fish | source
