# Add precmd hook
add-zsh-hook precmd update_prompt

PROMPT_SYMBOL='💀'

# Update PROMPT and RPROMPT
function update_prompt() {
    # Custom prompt with timestamp and git branch name
    export PROMPT=$'%F{05d}┌──[%B%F{076}%(6~.%-1~/…/%4~.%5~)%b%F{05d}]-%(#.$PROMPT_SYMBOL.$PROMPT_SYMBOL)$(node_prompt)%B%F{05d}%b%F{05d}\n└─%B%(#.%F{05d}#.%F{05d}$)%b%F{05d} '
    export RPROMPT='%(1V.(%1v).)'

    zle && zle reset-prompt
}

# Add update_prompt function to precmd function list
precmd_functions+=update_prompt
