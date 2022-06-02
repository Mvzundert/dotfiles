# Add precmd hook
add-zsh-hook precmd update_prompt

PROMPT_SYMBOL='💀'

# Update PROMPT and RPROMPT
function update_prompt() {
    # Custom prompt with timestamp and git branch name
    export PROMPT=$'%F{001}┌──[%B%F{004}%(6~.%-1~/…/%4~.%5~)%b%F{001}]-%(#.$PROMPT_SYMBOL.$PROMPT_SYMBOL)-%F{005}%*$(git_prompt_info)$(node_prompt)%B%F{001}%b%F{001}\n└─%B%(#.%F{001}#.%F{001}$)%b%F{001} '
    export RPROMPT=''

    zle && zle reset-prompt
}

# Add update_prompt function to precmd function list
precmd_functions+=update_prompt
