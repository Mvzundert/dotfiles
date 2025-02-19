# Add update_prompt function to precmd function list
precmd_functions+=update_prompt

node_prompt_prefix=" ("
node_prompt_suffix=") "

function node_prompt() {
    [[ -f package.json || -d node_modules ]] || return

    local version=''
    local node_icon='\ue718' Not used

    if dotfiles::exists node; then
        version=$(node -v 2>/dev/null)
    fi

    # shellcheck disable=SC2157
    [[ -n version ]] || return

    dotfiles::print '004' "$node_prompt_prefix$(echo " ${version}" | cut -c2-4 | tr -d .)$node_prompt_suffix"
}
