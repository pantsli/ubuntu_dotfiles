#!/usr/bin/env bash

<<<<<<< HEAD
echo "===> Start!"

echo "Create links ... "

=======
echo " create links ... "
ln -sf ${PWD}/.vimrc ~/
>>>>>>> 64636023531b4628ff33a6477f40ac1ec6bf599f
ln -sf ${PWD}/.ideavimrc ~/
ln -sf ${PWD}/.tmux.conf ~/
ln -sf ${PWD}/.gitconfig ~/
ln -sf ${PWD}/.gitignore_global ~/
ln -sf ${PWD}/.bash_aliases ~/
ln -sf ${PWD}/.bash_env.sh ~/
ln -sf ${PWD}/.bash_func.sh ~/
<<<<<<< HEAD

echo "Set correct timezone ... "
# Set correct timezone
timedatectl set-timezone Asia/Shanghai

echo "Install vim ..."
sh install-vim.sh

# echo "update bashrc ..."
sh update-bashrc.sh

source ~/.bashrc

echo "===> Done!"
=======
ln -sf ${PWD}/.bashrc ~/

echo " Set correct timezone ... "
# Set correct timezone
timedatectl set-timezone Asia/Shanghai
echo "install vim ..."
./install-vim.sh

echo " ===> Done!"
>>>>>>> 64636023531b4628ff33a6477f40ac1ec6bf599f
