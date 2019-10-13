# Set correct lang
export LC_ALL=en_US.UTF-8
# Set correct timezone
# timedatectl set-timezone Asia/Shanghai

# nodejs环境变量
# export NODE_HOME=$HOME/develop/node
# export PATH=$PATH:$NODE_HOME/bin
# export NODE_PATH=$NODE_HOME/lib/node_modules

# 设置cnpm的配置
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# go 环境变量
# export GOROOT=$HOME/go/go1.12.7
# export GOPATH=$HOME/go
# export PATH=$GOROOT/bin:$PATH

export ROBOT_DATA_PREFIX=$HOME

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH

export TERM=screen-256color

export WORKPATH=$HOME/code
