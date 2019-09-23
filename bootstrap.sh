#!/usr/bin/env bash

vim_plug_file="$HOME/.vim/autoload/plug.vim"
if [ ! -f "${VIM_PLUG_FILE}" ] then
  echo " ===> Installing vim plugins"
  curl -fLo ${VIM_PLUG_FILE} --created-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # mkdir -p ~/.vim/autoload
  # curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # vimrc
  # mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
  # ln -sf ~/.dotfiles/.vimrc ~/.vimrc

  # nvim
  # mkdir -p ~/.config/nvim/autoload
  # ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
  # ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/

  # vim +PlugInstall +qall

  mkdir -p "${HOME}/.vim/plugged"
  pushd "${HOME}/.vim/plugged"
  git clone "https://github.com/fatih/molokai"
  git clone "https://github.com/scrooloose/nerdtree"
  git clone "https://github.com/scrooloose/nerdcommenter"
  git clone "https://github.com/mbbill/undotree"
  git clone "https://github.com/mhinz/vim-startify"
  git clone "https://github.com/tpope/vim-surround"
  git clone "https://github.com/junegunn/fzf.vim"
  git clone "https://github.com/jiangmiao/auto-pairs"
  git clone "https://github.com/ervandew/supertab"
  git clone "https://github.com/brooth/far.vim"
  git clone "https://github.com/majutsushi/tagbar"
  git clone "https://github.com/ntpeters/vim-better-whitespace"
  git clone "https://github.com/tpope/vim-abolish"
  git clone "https://github.com/junegunn/vim-easy-align"
  git clone "https://github.com/fatih/vim-go"
  git clone "https://github.com/Chiel92/vim-autoformat"
  git clone "https://github.com/tpope/vim-fugitive"
  git clone "https://github.com/tpope/vim-repeat"
  git clone "https://github.com/airblade/vim-gitgutter"
  git clone "https://github.com/Yggdroot/indentLine"
  git clone "https://github.com/easymotion/vim-easymotion"
  git clone "https://github.com/kien/rainbow_parentheses.vim"
  git clone "https://github.com/mattn/emmet-vim"
  popd
fi

if [ ! -d "${HOME}/.fzf" ]; then
  echo " ==> Installing fzf"
  git clone https://github.com/junegunn/fzf "${HOME}/.fzf"
  pushd "${HOME}/.fzf"
  git remote set-url origin git@github.com:junegunn/fzf.git 
  ${HOME}/.fzf/install --bin --64 --no-bash --no-zsh --no-fish
  popd
fi

ln -sfn ${PWD}/.{vimrc,ideavimrc\
  tmux.conf,\
  gitconfig,gitignore_global,\
  bash_aliases,bash_env.sh,bash_func.sh,bashrc } "${HOME}/"

# Set correct timezone
timedatectl set-timezone Asia/Shanghai
echo ""
echo " ===> Done!"
