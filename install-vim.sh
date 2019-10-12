#!/bin/bash
<<<<<<< HEAD
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

=======
>>>>>>> 64636023531b4628ff33a6477f40ac1ec6bf599f
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    # install vim-plug
    echo "intall vim-plug ..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

<<<<<<< HEAD
=======
    #vimrc
    echo "bak old vimrc file ..."
    mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
    ln -sf ${PWD}/.vimrc ~/.vimrc

>>>>>>> 64636023531b4628ff33a6477f40ac1ec6bf599f
    #nvim
    mkdir -p ~/.config/nvim/autoload
    ln -sf $PWD/.vimrc ~/.config/nvim/init.vim
    ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload
fi
# install plug
vim +PlugInstall +qall
