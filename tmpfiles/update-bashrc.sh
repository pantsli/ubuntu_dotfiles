#!/usr/bin/env bash

res=$(grep -c 'source your own shrc file if exists' ~/.bashrc)

[ $res -gt 0 ] && exit 0 || echo "Add your own shrc file"

echo "Update bashrc ..."

echo '
# source your own shrc file if exists

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_env.sh ] && source ~/.bash_env.sh
[ -f ~/.bash_func.sh ] && source ~/.bash_func.sh

' >> ~/.bashrc

echo "Update bashrc configuration successfully !"
