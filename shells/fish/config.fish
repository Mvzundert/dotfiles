# ~/.config/fish/config.fish

# Enable starship prompt if available
if type -q starship
    starship init fish | source
end

# make the DOTFILES variable available to all fish scripts
# Resolve the physical path of the dotfiles repo via the config file's location
set -l config_real_path (realpath (status filename))
set -l git_root (git -C (dirname $config_real_path) rev-parse --show-toplevel 2>/dev/null)

if test -n "$git_root"
    set -gx DOTFILES $git_root
else
    # Fallback to your known path just in case
    set -gx DOTFILES $HOME/code/dotfiles
end

# Set platform variable for conditional configs
set -gx HOST_OS (uname)

if status is-login
    if test $HOST_OS = "Darwin"
        # macOS specific environment sharing
        launchctl setenv HOST_OS $HOST_OS
    else if test $HOST_OS = "Linux"
        # Only run systemctl on the actual host, never inside a distrobox container
        if not test -d /run/host
            if type -q systemctl
                systemctl --user import-environment HOST_OS
            end
        end
    end
end

# Only run the font size script if the terminal is Ghostty
if test "$TERM_PROGRAM" = "ghostty" -o "$TERM" = "xterm-ghostty"
    if test -f $DOTFILES/tools/tui/ghostty/scripts/set_font_size.sh
        sh $DOTFILES/tools/tui/ghostty/scripts/set_font_size.sh
    end
end

# Disable welcome message
set -g fish_greeting ""

# Load custom functions
for file in ~/.config/fish/functions/*.fish
    source $file
end

# =============================================================================
# HARD RESET: Sanitize and filter out the bad path inherited from the host environment
set -gx PATH (string match -v "/run/host/usr/bin" $PATH)

# Set environment variables
set -gx EDITOR nvim

# Set the primary language to English UTF-8
set -gx LANG en_US.UTF-8

# IMPORTANT: We do NOT set LC_ALL here because it overrides LC_TIME.
set -e LC_ALL

# Set specific formatting to Dutch (nl_NL) for 24h time and European dates
if string match -q -- "nl_NL.UTF-8" (locale -a 2>/dev/null | string join \n)
    set -gx LC_TIME nl_NL.UTF-8
    set -gx LC_NUMERIC nl_NL.UTF-8
    set -gx LC_MONETARY nl_NL.UTF-8
    set -gx LC_PAPER nl_NL.UTF-8
    set -gx LC_MEASUREMENT nl_NL.UTF-8
end

set -Ux COMPOSER_MEMORY_LIMIT -1 # Remove composer memory limit
set -Ux HOMEBREW_NO_ENV_HINTS 1

# use fnm to switch node versions - Only if fnm is installed
if type -q fnm
    fnm env --use-on-cd | source
end

# Start ssh-agent if not already running
if not set -q SSH_AUTH_SOCK
    ssh-agent -c | source > /dev/null
end

# Start keychain for your specific SSH key
if status is-interactive
    set -l os_type (uname)

    if test "$os_type" = "Darwin"
        if not set -q SSH_AUTH_SOCK
            set -gx SSH_AUTH_SOCK (launchctl getenv SSH_AUTH_SOCK)
        end
        test -f ~/.ssh/id_ed25519 && ssh-add --apple-use-keychain ~/.ssh/id_ed25519 >/dev/null 2>&1

    else if test "$os_type" = "Linux"
        if type -q keychain
            and test -f ~/.ssh/id_ed25519
            keychain --eval --quiet id_ed25519 | source
        end
    end
end

# Function to add a directory to PATH securely
function add_to_path
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH $PATH $argv[1]
        end
    end
end

# Function to safely get the current major.minor PHP version
function get_active_php_version
    if type -q php
        php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;' 2>/dev/null
    end
end

# Set the global cache variable when the shell loads if PHP exists
if type -q php
    set -g __fish_current_php_version (get_active_php_version)
end

# Add common bin directories to PATH safely (Appends to back, preserves priorities)
add_to_path "$HOME/bin"
add_to_path "/usr/bin"
add_to_path "/usr/local/bin"
add_to_path "$HOME/.local/bin"
add_to_path "/usr/local/sbin"
add_to_path "/usr/sbin"

# Add dotfiles scripts to PATH
add_to_path "$DOTFILES/tools/scripts"

# Init zoxide for directory jumping
if type -q zoxide
    zoxide init fish | source
end

# Initialize OPAM if its init file exists
if test -r "$HOME/.opam/opam-init/init.fish"
    source "$HOME/.opam/opam-init/init.fish" > /dev/null 2> /dev/null
end

# Init Composer to make sure it gets used
if test -d "$HOME/.composer/vendor/bin"
    add_to_path "$HOME/.composer/vendor/bin"
end

if test -d "$HOME/.config/composer/vendor/bin"
    add_to_path "$HOME/.config/composer/vendor/bin"
end

# Init Mysql-client to make sure it gets used
if test -d "/usr/local/opt/mysql-client/bin"
    add_to_path "/usr/local/opt/mysql-client/bin"
end

# Init Python3 to make sure it gets used
if test -d "/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin"
    add_to_path "/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin"
end

# Init Cargo to make sure it gets used
if test -d "$HOME/.cargo/bin"
    add_to_path "$HOME/.cargo/bin"
end

# Init Go to make sure it gets used
if test -d "/usr/local/go/bin"
    add_to_path "/usr/local/go/bin"
end

if test -d "$HOME/go/bin"
    add_to_path "$HOME/go/bin"
end

# Init rbenv to make sure it gets used
if type -q rbenv
    status --is-interactive; and rbenv init - --no-rehash fish | source
end

# Init phpenv to make sure it gets used
if test -d "$HOME/.phpenv/bin"
    add_to_path "$HOME/.phpenv/bin"
    if type -q phpenv
        eval "$(phpenv init -)"
    end
end
