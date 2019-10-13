#!/usr/bin/env bash
set -e

echo "===> Start!"

echo "Create links ... "

ln -sfn ${PWD}/.ideavimrc ~/
ln -sfn ${PWD}/.tmux.conf ~/
ln -sfn ${PWD}/.gitconfig ~/
ln -sfn ${PWD}/.gitignore_global ~/
ln -sfn ${PWD}/.bash_aliases ~/
ln -sfn ${PWD}/.bash_env.sh ~/
ln -sfn ${PWD}/.bash_func.sh ~/

echo "Set correct timezone ... "
# Set correct timezone
timedatectl set-timezone Asia/Shanghai

echo "Install vim ..."
./install-vim.sh

# echo "update bashrc ..."
./update-bashrc.sh

echo "===> Done!"
