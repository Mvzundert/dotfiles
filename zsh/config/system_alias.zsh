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

# -------------------------------------------------------------------
# Theme
# -------------------------------------------------------------------
alias light='base16_classic-light'
alias dark='base16_classic-dark'
alias darcula='base16_dracula'
alias monokai='base16_monokai'
alias outrun='base16_outrun-dark'
alias synth='base16_synth-midnight-dark'

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
