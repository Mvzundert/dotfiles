autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats ' %b'

add-zsh-hook precmd vcs_info
add-zsh-hook precmd async_trigger

PROMPT_SYMBOL='💀'

ASYNC_PROC=0
function async() {
    printf "%s" "$(git_status) $(node_prompt) $(suspended_jobs)" > "/tmp/zsh_prompt_$$"

    kill -s USR1 $$

    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi
}

function async_trigger() {
    ASYNC_PROC=$!
    async &!
}

function TRAPUSR1() {
    vcs_info
    RPROMPT='$(cat /tmp/zsh_prompt_$$)'
    ASYNC_PROC=0

    zle && zle reset-prompt
}

# export PROMPT='%(?.%F{003}.%F{009})%~ $PROMPT_SYMBOL%f '
export PROMPT=$'%F{%(#.red.red)}┌──${debian_chroot:+($debian_chroot)──}(%B%F{%(#.red.red)}%n%(#.$PROMPT_SYMBOL.$PROMPT_SYMBOL)%b%F{%(#.red.red})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.red.red)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
export RPROMPT=''
