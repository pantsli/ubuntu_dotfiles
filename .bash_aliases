# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ${WORKPATH}"
alias g="git"

# URL-encode strings
alias urlencode='python -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]));"'
alias urldecode='python -c "import sys, urllib.parse as ul; print (ul.unquote_plus(sys.argv[1]));"'

alias path='echo -e ${PATH//:/\\n}'
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'
# IP addresses
alias ipa="ip a"
alias ipdns="dig +short myip.opendns.com @resolver1.opendns.com"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# grep python process
alias psp='ps aux | grep python'
alias psp3='ps aux |grep python3 | grep -vE "(grep|/usr/bin/python3)" | grep python3'
alias psp2='ps aux |grep python2 | grep -vE "(grep|/usr/bin/python2)" | grep python2'

alias kpy3="psp3 | awk '{print \"kill -9 \"\$2}' | sh"

alias awkpid="awk '{print \"kill -9 \"\$2}'"

# 自定义alias别名
# alias pip=/usr/bin/pip3
# alias python=/usr/bin/python3.6


alias tf='tail -f '
alias prettyjson='python -m json.tool'
# tmux alias
alias t='tmux '
alias tl='tmux ls'
alias td='tmux detach'
alias ta='tmux at -t'
alias tmv='tmux rename -t'
alias tnew='tmux new -s '
alias tpl='tmuxp load '
alias rmc='rm *.pyc; rm .cache; rm __pycache__'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias runl='python manage.py runserver'
alias run='python manage.py runserver 0.0.0.0:8000'
alias runs='python manage.py shell'
alias nvi="nvim "
alias nv="nvim "
alias exi='exit'
alias ctags='/usr/local/bin/ctags'
alias q='exit'
alias quit='exit'


# show timezone
alias dater='date -R'
alias datectl='timedatectl'
alias sys2hc='hwclock --systohc'
alias hc2sys='hwclock --hctosys'
