#!/bin/bash
set -e

cd ~/.dotfiles

echo 'set runtimepath+=~/.dotfiles

source ~/.dotfiles/vimrcs/basic.vim
source ~/.dotfiles/vimrcs/plugins.vim

try
source ~/.dotfiles/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    # install vim-plug
    echo "intall vim-plug ..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    #vimrc
    # echo "bak old vimrc file ..."
    # mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
    # ln -sf ${PWD}/.vimrc ~/.vimrc

    #nvim
    mkdir -p ~/.config/nvim/autoload
    ln -sf $PWD/.vimrc ~/.config/nvim/init.vim
    ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload
fi
# install plug
vim +PlugInstall +qall
