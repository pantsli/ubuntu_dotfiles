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
./init-vim.sh

<<<<<<< HEAD:init.sh
# echo "update bashrc ..."
./update-bashrc.sh

=======
>>>>>>> 3dee9df5c9a4214b7ad0954b40c3b7efd65a56d8:tmpfiles/bootstrap.sh
echo " ===> Done!"
