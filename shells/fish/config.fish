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

# Verification (optional, you can remove this after testing)
# echo "Dotfiles root set to: $DOTFILES"

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
# Set environment variables
set -gx EDITOR nvim

# Set the primary language to English UTF-8
set -gx LANG en_US.UTF-8

# IMPORTANT: We do NOT set LC_ALL here because it overrides LC_TIME.
set -e LC_ALL

# Set specific formatting to Dutch (nl_NL) for 24h time and European dates
set -gx LC_TIME nl_NL.UTF-8
set -gx LC_NUMERIC nl_NL.UTF-8
set -gx LC_MONETARY nl_NL.UTF-8
set -gx LC_PAPER nl_NL.UTF-8
set -gx LC_MEASUREMENT nl_NL.UTF-8

set -Ux COMPOSER_MEMORY_LIMIT -1 # Remove composer memory limit
set -Ux HOMEBREW_NO_ENV_HINTS 1

# use fnm to switch node versions - Only if fnm is installed
if type -q fnm
    fnm env --use-on-cd | source
end

# Start ssh-agent if not already running
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end

# Start keychain for your specific SSH key
if status is-interactive
    set -l os_type (uname)

    if test "$os_type" = "Darwin"
        if not set -q SSH_AUTH_SOCK
            set -gx SSH_AUTH_SOCK (launchctl getenv SSH_AUTH_SOCK)
        end
        ssh-add --apple-use-keychain ~/.ssh/id_ed25519 >/dev/null 2>&1

    else if test "$os_type" = "Linux"
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
    if type -q php
        php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;' 2>/dev/null
    end
end

# Set the global cache variable when the shell loads if PHP exists
if type -q php
    set -g __fish_current_php_version (get_active_php_version)
end

# Add common bin directories to PATH
add_to_path "$HOME/bin"
add_to_path "/usr/bin"
add_to_path "/usr/local/bin"
add_to_path "$HOME/.local/bin"
add_to_path "/usr/local/sbin"
add_to_path "/usr/sbin"
add_to_path "/.local/bin"

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

# Rust Manpage Logic
if type -q rustup
    set -l rust_bin (dirname (rustup which rustc))
    set -l rust_man (realpath "$rust_bin/../share/man")
    set -l local_man "$HOME/.local/share/man"
    set -gx MANPATH $local_man $rust_man $MANPATH ""
end

# =============================================================================
# Initialize zoxide
if type -q zoxide
    zoxide init fish | source
end

# =============================================================================
# Utility functions for zoxide
function __zoxide_pwd
    builtin pwd -L
end

if ! builtin functions --query __zoxide_cd_internal
    string replace --regex -- '^function cd\s' 'function __zoxide_cd_internal ' <$__fish_data_dir/functions/cd.fish | source
end

function __zoxide_cd
    if set -q __zoxide_loop
        builtin echo "zoxide: infinite loop detected"
        return 1
    end
    __zoxide_loop=1 __zoxide_cd_internal $argv
    _zoxide_chpwd_hook 
end

function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and type -q zoxide
    and command zoxide add -- (__zoxide_pwd)
end

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

function __zoxide_z_complete
    set -l tokens (builtin commandline --current-process --tokenize)
    set -l curr_tokens (builtin commandline --cut-at-cursor --current-process --tokenize)

    if test (builtin count $tokens) -le 2 -a (builtin count $curr_tokens) -eq 1
        complete --do-complete "'' "(builtin commandline --cut-at-cursor --current-token) | string match --regex -- '.*/$'
    else if test (builtin count $tokens) -eq (builtin count $curr_tokens)
        set -l query $tokens[2..-1]
        set -l result (command zoxide query --exclude (__zoxide_pwd) --interactive -- $query)
        and __zoxide_cd $result
        and builtin commandline --function cancel-commandline repaint
    end
end

complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'

function __zoxide_zi
    set -l result (command zoxide query --interactive -- $argv)
    and __zoxide_cd $result
end
