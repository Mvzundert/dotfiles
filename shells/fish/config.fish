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

# =============================================================================
# Set environment variables
set -gx EDITOR nvim

# Set the primary language to English UTF-8
set -gx LANG en_US.UTF-8

# IMPORTANT: We do NOT set LC_ALL here because it overrides LC_TIME.
# If it was set previously, we unexport it.
set -e LC_ALL

# Set specific formatting to Dutch (nl_NL) for 24h time and European dates
set -gx LC_TIME nl_NL.UTF-8
set -gx LC_NUMERIC nl_NL.UTF-8
set -gx LC_MONETARY nl_NL.UTF-8
set -gx LC_PAPER nl_NL.UTF-8
set -gx LC_MEASUREMENT nl_NL.UTF-8

set -Ux COMPOSER_MEMORY_LIMIT -1 # Remove composer memory limit
set -Ux HOMEBREW_NO_ENV_HINTS 1

# use fnm to switch node versions
fnm env --use-on-cd | source

# Start ssh-agent if not already running
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end

# Start keychain for your specific SSH key
if status is-interactive
    # Identify the Operating System
    set -l os_type (uname)

    if test "$os_type" = "Darwin"
        # --- macOS Native Setup ---
        if not set -q SSH_AUTH_SOCK
            set -gx SSH_AUTH_SOCK (launchctl getenv SSH_AUTH_SOCK)
        end
        # Silently add key to Apple Keychain
        ssh-add --apple-use-keychain ~/.ssh/id_ed25519 >/dev/null 2>&1

    else if test "$os_type" = "Linux"
        # --- Linux Setup (using keychain) ---
        # --quiet: hides the version/status splash
        # --eval: makes it source-able
        if type -q keychain
            keychain --eval --quiet id_ed25519 | source
        end
    end
end

# =============================================================================
# Function to add a directory to PATH if it exists and isn't already in PATH
function add_to_path
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH $argv[1] $PATH
        end
    end
end

# Function to safely get the current major.minor PHP version
function get_active_php_version
    # Runs the php command only once when the shell starts
    php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;' 2>/dev/null
end

# Set the global cache variable when the shell loads
# This sets the initial value to the currently active PHP version.
set -g __fish_current_php_version (get_active_php_version)

# Add common bin directories to PATH
add_to_path "$HOME/bin"
add_to_path "/usr/bin"
add_to_path "/usr/local/bin"
add_to_path "$HOME/.local/bin"
add_to_path "/usr/local/sbin"
add_to_path "/usr/sbin"

# Initialize OPAM if its init file exists
if test -r "$HOME/.opam/opam-init/init.fish"
    source "$HOME/.opam/opam-init/init.fish" > /dev/null 2> /dev/null
end

# Init Composer to make sure it gets used
if test -r "$HOME/.composer/vendor/bin"
    add_to_path "$HOME/.composer/vendor/bin"
end

if test -r "$HOME/.config/composer/vendor/bin"
    add_to_path "$HOME/.config/composer/vendor/bin"
end

# Init Mysql-client to make sure it gets used
if test -r "/usr/local/opt/mysql-client/bin"
    add_to_path "/usr/local/opt/mysql-client/bin"
end

# Init Python3 to make sure it gets used
if test -r "/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin"
    add_to_path "/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin"
end

# Init Cargo to make sure it gets used
if test -r "$HOME/.cargo/bin"
    add_to_path "$HOME/.cargo/bin"
end

# Init Go to make sure it gets used
if test -r "/usr/local/go/bin"
    add_to_path "/usr/local/go/bin"
end

# Initialize OPAM if its init file exists
if test -r "$HOME/go/bin"
    add_to_path "$HOME/go/bin"
end

# Init phpenv to make sure it gets used
if test -r "$HOME/.rbenv/bin/"
    add_to_path "$HOME/.rbenv/bin"
    # Added by `rbenv init` on Thu Aug 28 10:01:45 PM CEST 2025
    status --is-interactive; and rbenv init - --no-rehash fish | source
end

# Init rbenv to make sure it gets used
if test -r "$HOME/.phpenv/bin/phpenv"
    add_to_path "$HOME/.phpenv/bin"
    eval "$(phpenv init -)"
end

#  Rust Manpage Logic
if command -q rustup
    # 1. Get the absolute toolchain path
    set -l rust_bin (dirname (rustup which rustc))
    set -l rust_man (realpath "$rust_bin/../share/man")

    # 2. Your custom local man page for rustup
    set -l local_man "$HOME/.local/share/man"

    # 3. Apply to MANPATH
    # We include $MANPATH to keep any existing variables
    # We include "" at the end to trigger the system defaults without the warning
    set -gx MANPATH $local_man $rust_man $MANPATH ""
end

# =============================================================================
# Initialize zoxide
if type -q zoxide
    zoxide init fish | source
end

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions --query __zoxide_cd_internal
    string replace --regex -- '^function cd\s' 'function __zoxide_cd_internal ' <$__fish_data_dir/functions/cd.fish | source
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    if set -q __zoxide_loop
        builtin echo "zoxide: infinite loop detected"
        builtin echo "Avoid aliasing `cd` to `z` directly, use `zoxide init --cmd=cd fish` instead"
        return 1
    end
    __zoxide_loop=1 __zoxide_cd_internal $argv
    # @TODO: Figure out if this is hacky or not, for now it works.
   _zoxide_chpwd_hook 
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z
    set -l argc (builtin count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else if test $argc -eq 2 -a $argv[1] = --
        __zoxide_cd -- $argv[2]
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions.
function __zoxide_z_complete
    set -l tokens (builtin commandline --current-process --tokenize)
    set -l curr_tokens (builtin commandline --cut-at-cursor --current-process --tokenize)

    if test (builtin count $tokens) -le 2 -a (builtin count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        complete --do-complete "'' "(builtin commandline --cut-at-cursor --current-token) | string match --regex -- '.*/$'
    else if test (builtin count $tokens) -eq (builtin count $curr_tokens)
        # If the last argument is empty, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (command zoxide query --exclude (__zoxide_pwd) --interactive -- $query)
        and __zoxide_cd $result
        and builtin commandline --function cancel-commandline repaint
    end
end

complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query --interactive -- $argv)
    and __zoxide_cd $result
end
