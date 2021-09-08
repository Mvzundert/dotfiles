# Add precmd hook
add-zsh-hook precmd update_prompt

PROMPT_SYMBOL='💀'

# Update PROMPT and RPROMPT
function update_prompt() {
    # Custom prompt with timestamp and git branch name
    export PROMPT=$'%F{003}┌──[%B%F{003}%(6~.%-1~/…/%4~.%5~)%b%F{003}]-%(#.$PROMPT_SYMBOL.$PROMPT_SYMBOL)-%F{005}%*$(git_prompt_info)$(node_prompt)%B%F{003}%b%F{003}\n└─%B%(#.%F{003}#.%F{003}$)%b%F{003} '
    export RPROMPT=''

    zle && zle reset-prompt
}