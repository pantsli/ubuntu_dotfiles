#!/bin/bash
set -e

VIM_PLUG_FILE="${HOME}/.vim/autoload/plug.vim"
VIM_PLUGGED="${HOME}/.vim/plugged"

# install plug
if [ ! -f $VIM_PLUG_FILE ]; then
    echo " ==> Installing vim plugins"
    curl -fLo ${VIM_PLUG_FILE} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    #nvim
    mkdir -p ~/.config/nvim/autoload
    ln -sf $PWD/.vimrc ~/.config/nvim/init.vim
    ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload
fi

# install plugins
if [ ! -d "$VIM_PLUGGED" ]; then
    mkdir -p "${VIM_PLUGGED}"
    pushd "${VIM_PLUGGED}"
    git clone "https://github.com/fatih/molokai"
    # git clone "https://github.com/scrooloose/nerdtree"
    # git clone "https://github.com/scrooloose/nerdcommenter"
    # git clone "https://github.com/ervandew/supertab"
    # git clone "https://github.com/brooth/far.vim"
    popd
fi

cd $HOME/.dotfiles
echo 'set runtimepath+=~/.dotfiles

source ~/.dotfiles/vimrcs/basic.vim
source ~/.dotfiles/vimrcs/plugins.vim

try
source ~/.dotfiles/my_configs.vim
catch
endtry' > ~/.vimrc

sync

vim +PlugInstall +qall

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"

