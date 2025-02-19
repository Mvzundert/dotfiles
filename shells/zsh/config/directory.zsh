setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt autocd

############################
# Directory alias
############################
alias rmf="rmrf_prompt"

alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="eza -a1 --group-directories-first --icons"
alias ls="eza -a --group-directories-first --icons"
alias ll="eza -alhg --group-directories-first --icons --git"
alias tree="eza -a1T --level=2 --group-directories-first --icons --git"

############################
# Bat alias
############################
alias cat="bat"
alias tlog="tail -f $1 | bat --paging=never -l log"
alias bathelp='bat --plain --language=help'

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
