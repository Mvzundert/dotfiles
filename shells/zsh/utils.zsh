# Checks if command exists
dotfiles::exists() {
    command -v "$1" > /dev/null 2>&1
}

# Checks if current dir is a git dir
dotfiles::is_git() {
    [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

# Checks if value is true
dotfiles::check() {
    [[ -n "$1" ]]
}

# Prints in bold
dotfiles::bold() {
    echo -n "%B$1%b"
}

# Prints value
dotfiles::print() {
    local color content bold
    [[ -n "$1" ]] && color="%F{$1}" || color="%f"
    [[ -n "$2" ]] && content="$2" || content=""

    [[ -z "$2" ]] && content="$1"

    echo -n "$color"
    echo -n "$content"
    echo -n "%{%b%f%}"
}