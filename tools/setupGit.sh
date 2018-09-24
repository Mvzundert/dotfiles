#! /bin/bash

#=======================================
#========= OS dependencies =============
#=======================================
if [ "$(uname)" == "linux-gnu" ]; then
    echo "\n\nRunning on Linux"
    echo "\n\nCannot setup git (yet)"
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "\n\nRunning on OSX"

    if test ! $(which brew); then
        echo "Installing homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"gs should pass through the the `brew list check`
    fi

    echo "\n\nInstalling homebrew packages..."
    echo "=============================="

    formulas=(
        git
        phplint
        php-code-sniffer
        phpmd
    )

    for formula in "${formulas[@]}"; do
        if brew list "$formula" > /dev/null 2>&1; then
            echo "$formula already installed... skipping."
        else
            brew install $formula
        fi
    done

fi

#=======================================
#========= githooks ====================
#=======================================
DIR="$HOME/.git-templates"


if [ -L $DIR ]
then
    # echo "$DIR directory exists!"
    echo "git-templates are installed...skipping"
else
    #  echo "$DIR directory created"
    echo "git-templates have been installed"
    # Symlink git-templates  to .git-templates folder.
    ln -s $HOME/dotfiles/tools/git-templates $HOME/.git-templates
    # make sure git recognizes the template dir.
    git config --global init.templatedir '~/.git-templates'
    # make sure the script is executable.
    chmod a+x ~/.git-templates/hooks/*
fi
