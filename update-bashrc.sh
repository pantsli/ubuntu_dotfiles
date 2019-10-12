#!/usr/bin/env bash

# 用系统中存储的.bashrc备份文件恢复到~/目录下
[ ! -f  ~/.bashrc ] && cp  /etc/skel/.bashrc   ~/

cnt=$(grep -c 'source your own shrc file if exists' ~/.bashrc)

[ $cnt -gt 0 ] && exit 0 || echo "Add your own shrc file"

echo "Update bashrc ..."

echo '
# source your own shrc file if exists

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_env.sh ] && source ~/.bash_env.sh
[ -f ~/.bash_func.sh ] && source ~/.bash_func.sh

' >> ~/.bashrc

sync

echo "Update bashrc configuration successfully !"
