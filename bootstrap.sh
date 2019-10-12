#!/usr/bin/env bash

echo "===> Start!"

echo "Create links ... "

ln -sf ${PWD}/.ideavimrc ~/
ln -sf ${PWD}/.tmux.conf ~/
ln -sf ${PWD}/.gitconfig ~/
ln -sf ${PWD}/.gitignore_global ~/
ln -sf ${PWD}/.bash_aliases ~/
ln -sf ${PWD}/.bash_env.sh ~/
ln -sf ${PWD}/.bash_func.sh ~/

echo "Set correct timezone ... "
# Set correct timezone
timedatectl set-timezone Asia/Shanghai

echo "Install vim ..."
sh install-vim.sh

# echo "update bashrc ..."
sh update-bashrc.sh

source ~/.bashrc

echo "===> Done!"
