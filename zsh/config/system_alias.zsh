# -------------------------------------------------------------------
# ZSH
# -------------------------------------------------------------------
alias reload='source ~/.zshrc'

# -------------------------------------------------------------------
# Config
# -------------------------------------------------------------------
alias dotc="vim ~/.dotfiles/"
alias sshc="vim ~/.ssh/config"
alias emacs='emacsclient --tty'
alias buuc='brew update && brew upgrade && brew cleanup'

# -------------------------------------------------------------------
# System
# -------------------------------------------------------------------
alias myip='wget http://ipinfo.io/ip -qO -'
alias size='du -sh * | sort -r -n | ack "[0-9][G|M]"'
alias ifa="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias ifi="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: inactive'"
alias ifip="ifconfig | ack 'inet.*broadcast'"

# -------------------------------------------------------------------
# Misc alias
# -------------------------------------------------------------------
alias ytmp3="youtube-dl -x --audio-format mp3 $1"

# -------------------------------------------------------------------
# Custom OS alias
# -------------------------------------------------------------------
if [[ $OSTYPE == "linux-gnu" ]]; then
    # Custom Linux Aliases
elif [[ $OSTYPE == "darwin"* ]]; then
    # Custom MAC OSX Aliases
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/F$'
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Fi$'
fi
