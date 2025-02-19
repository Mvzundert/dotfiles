# Set GIT info
git_prompt_prefix=" ("
git_prompt_suffix=")"
git_prompt_dirty="✗"
git_prompt_clean="✔"

# Outputs current branch info in prompt format
function git_prompt_info() {
    # Check if the current directory contains a Git repository
    if ! [[ $(command git rev-parse --git-dir 2>/dev/null) ]]; then
        return 0
    fi

    dotfiles::print '004' "$git_prompt_prefix$(git_repository_has_changes) $(git_current_branch_short) $(git_last_commit_hash)$git_prompt_suffix"
}

# Checks if working tree is dirty
function git_repository_has_changes() {
    git_status=$(command git status --porcelain 2>/dev/null | tail -n1)

    if [[ -n $git_status ]]; then
        dotfiles::print '004' "$git_prompt_dirty"
    else
        dotfiles::print '004' "$git_prompt_clean"
    fi
}

# Get current git repository branch checked out
function git_current_branch_short() {
    local ref

    ref=$(command git symbolic-ref --quiet HEAD 2>/dev/null)

    local ret=$?

    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return

        ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
    fi

    branch_name=${ref#refs/heads/}

    dotfiles::print '004' "${branch_name%%-*}"
}

# Get current git repository branch checked out
function git_current_branch() {
    local ref

    ref=$(command git symbolic-ref --quiet HEAD 2>/dev/null)

    local ret=$?

    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return

        ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
    fi

    dotfiles::print '004' "${ref#refs/heads/}"
}

# Get the latest commit has from git log
function git_last_commit_hash() {
    local hash

    hash=$(command git log -1 --pretty=oneline | cut -c -7)

    dotfiles::print '004' "$hash"
}
