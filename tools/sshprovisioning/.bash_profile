# Get the aliases and functions.
if [ -f ~/.bashrc ]; then
    . ~/.bashrc¬
fi

if [ -f ~/.minimal_bashrc ]; then
    . ~/.minimal_bashrc¬
fi

if [ -f ~/.minimal_vim ]; then
    ln -s ~/.minimal_vim ~/.vimrc¬
fi

