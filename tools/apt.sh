#!/bin/sh

echo -e "\n\nInstalling apt packages ..."
echo "=============================="

echo -e "\n\nInstalling ZSH..."
echo "=============================="
apt-get install zsh

chsh -s $(which zsh)

echo -e "\n\nInstalling GIT ..."
echo "=============================="
apt-get install git

echo -e "\n\nInstalling MYSQLl ..."
echo "=============================="
apt-get install mysql

echo -e "\n\nInstalling VIM ..."
echo "=============================="
apt-get install vim

