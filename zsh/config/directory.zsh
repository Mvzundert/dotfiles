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

alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lah ${colorflag}"
alias rmf="rm -rf"

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
