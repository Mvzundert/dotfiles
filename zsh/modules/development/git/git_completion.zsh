
# this is specific to the location of the current version of git, installed by homebrew
completion=/usr/local/opt/git/etc/bash_completion.d/git-completion.zsh

if test -f $completion; then
    source $completion
fi
