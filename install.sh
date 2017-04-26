#! /bin/bash
echo " "
echo "+++++++++++++++++++++++++++++++++++++++"
echo "++++++++++ Starting installer.... +++++"
echo "+++++++++++++++++++++++++++++++++++++++"
echo " "

echo " "
echo "======================================="
echo "========= oh-my-zsh   ================="
echo "======================================="
echo " "
DIR="$HOME/.oh-my-zsh"

if [ -d $DIR ]
then
	echo "$DIR directory exists!"
else
   echo "$DIR directory created"
	# Get oh-my-zsh framework
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

echo " "
echo "======================================="
echo "========= Syntax Highlight zsh  ======="
echo "======================================="
echo " "
DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

if [ -d $DIR ]
then
	echo "$DIR directory exists!"
else
   echo "$DIR directory created"
    # Get Syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

echo " "
echo "======================================="
echo "========= ZSH config =================="
echo "======================================="
echo " "
DIR="$HOME/.zsh_config"

if [ -L $DIR ]
then
	echo "$DIR directory exists!"
else
   echo "$DIR directory created"
   # Symlink the zsh_config folder that hosts most stuff
   ln -s $HOME/dotfiles/zsh/.zsh_config $HOME
fi

echo " "
echo "======================================="
echo "========= ZSHRC ======================="
echo "======================================="
echo " "
FILE="$HOME/.zshrc"

if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "$FILE File created"
   # Symlink the .zshrc file that makes sure the config works
   ln -s $HOME/dotfiles/zsh/.zshrc $HOME
fi

echo " "
echo "======================================="
echo "========= oh-my-vim ==================="
echo "======================================="
echo " "
DIR="$HOME/.oh-my-vim"

if [ -d $DIR ]
then
	echo "$DIR directory exists!"
else
    echo "$DIR directory created"
    # Get oh-my-vim framework
    git clone git@github.com:Mvzundert/oh-my-vim.git $HOME/.oh-my-vim
fi

echo " "
echo "======================================="
echo "========= VIM config =================="
echo "======================================="
echo " "
DIR="$HOME/.vim"

if [ -L $DIR ]
then
	echo "$DIR directory exists!"
else
   echo "$DIR directory created"
   # Symlink .oh-my-vim framework to .vim folder. 
   ln -s $HOME/.oh-my-vim/ $HOME/.vim
fi

echo " "
echo "======================================="
echo "========= VIMRC ======================="
echo "======================================="
echo " "
FILE="$HOME/.vimrc"

if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "$FILE File created"
   # Symlink the .vimrc file that makes sure the config works
   ln -s $HOME/.oh-my-vim/.vimrc $HOME
fi

echo " "
echo "======================================="
echo "========= Vim Vundle =================="
echo "======================================="
echo " "
DIR="$HOME/.vim/bundle/Vundle.vim"

# Check if the Vundle dir is emtpy (it should be)
if [ "$(ls -A $DIR)" ]; then
        # We install all plugins that are specified in
        # .oh-my-vim/config/plugins.vim just to make sure.       
        echo "$DIR directory not empty"
        # Make sure we install all plugins
        vim +PluginInstall +qall
 else
        # If the dir is empty (as it should be)
        # Get Vundle.
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        # We install all plugins that are specified in
        # .oh-my-vim/config/plugins.vim
        vim +PluginInstall +qall
fi

echo " "
echo "+++++++++++++++++++++++++++++++++++++++"
echo "++++++++++ Finished +++++++++++++++++++"
echo "+++++++++++++++++++++++++++++++++++++++"
echo " "
