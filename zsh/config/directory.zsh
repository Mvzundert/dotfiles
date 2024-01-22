setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt autocd

############################
# Directory alias
############################
# Detect which `ls` flavor is in use
if ls --color >/dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

alias rmf="rmrf_prompt"

alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="eza -a1 --group-directories-first --icons"
alias ls="eza -a --group-directories-first --icons"
alias ll="eza -alh --group-directories-first --icons --git"
alias llt="eza -a1T --level=2 --group-directories-first --icons --git"

############################
# Bat alias
############################
alias cat="bat"
alias tlog="tail -f $1 | bat --paging=never -l log"
alias bathelp='bat --plain --language=help'

# Bat function replacing help with highlighting
help() {
    "$@" --help 2>&1 | bathelp
}

if [[ $OSTYPE == "linux-gnu" ]]; then
    alias bat="/usr/local/bat/bat"
fi

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
