# Add precmd hook
add-zsh-hook precmd update_prompt

PROMPT_SYMBOL='💀'

# Update PROMPT and RPROMPT
function update_prompt() {
    # Custom prompt with timestamp and git branch name
    export PROMPT="%F{009}%* %F{014}%~%F{005}$(git_prompt_info)%f: "
    export RPROMPT=''

    zle && zle reset-prompt
}

# Add update_prompt function to precmd function list
precmd_functions+=update_prompt
