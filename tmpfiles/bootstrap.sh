#!/usr/bin/env bash

echo " create links ... "
ln -sf ${PWD}/.vimrc ~/
ln -sf ${PWD}/.ideavimrc ~/
ln -sf ${PWD}/.tmux.conf ~/
ln -sf ${PWD}/.gitconfig ~/
ln -sf ${PWD}/.gitignore_global ~/
ln -sf ${PWD}/.bash_aliases ~/
ln -sf ${PWD}/.bash_env.sh ~/
ln -sf ${PWD}/.bash_func.sh ~/
ln -sf ${PWD}/.bashrc ~/

echo " Set correct timezone ... "
# Set correct timezone
timedatectl set-timezone Asia/Shanghai
echo "install vim ..."
./install-vim.sh

echo " ===> Done!"
