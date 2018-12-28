#! /bin/bash
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
    ln -s $HOME/.dotfiles/tools/git-templates $HOME/.git-templates
    # make sure git recognizes the template dir.
    git config --global init.templatedir '~/.git-templates'
    # make sure the script is executable.
    chmod a+x ~/.git-templates/hooks/*
fi
