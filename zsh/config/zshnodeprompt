node_prompt() {
    [[ -f package.json || -d node_modules ]] || return

    local version=''

    if dotfiles::exists node; then
        version=$(node -v 2>/dev/null)
    fi

    [[ -n version ]] || return

    dotfiles::print '029' "Node:$version"
}
