############################
# ZSH alias stuff
############################
alias rlzsh='source ~/.zshrc'
alias zshconfig="vim ~/dotfiles/zsh/.zshrc"
alias light='base16_github'
alias dark='base16_dracula'

############################
# Random stuff that's usefull
############################
alias ytmp3="youtube-dl -x --audio-format mp3 $1"
alias myip='wget http://ipinfo.io/ip -qO -'
alias python="python3"
alias size='du -sh * | sort -r -n | grep "[0-9][G|M]"'

############################
# Custom OS alias
############################
if [[ $OSTYPE == "linux-gnu" ]]; then
    # Custom Linux Aliases
elif [[ $OSTYPE == "darwin"* ]]; then
    # Custom MAC OSX Aliases
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/F$'
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Fi$'
fi
