export ZSH="/home/gok/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export ALTERAPATH="/home/gok/intelFPGA_lite/18.1"
export ALTERAOCLSDKROOT="${ALTERAPATH}/hld"
export QUARTUS_ROOTDIR=${ALTERAPATH}/quartus
export QUARTUS_ROOTDIR_OVERRIDE="$QUARTUS_ROOTDIR"
#export PATH=$PATH:${ALTERAPATH}/quartus/bin
#export PATH=$PATH:${ALTERAPATH}/nios2eds/bin
#export PATH=$PATH:${QSYS_ROOTDIR}

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000

export LANG=en_US.UTF-8
export EDITOR=vim
bindkey -v

# alias ---------------------------------------

alias df='df -h'
alias du='du -h'

alias less='less -r'
alias grep='grep --color -rn'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -hF --color=tty'
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias  l="ls -1Na   --group-directories-first --color=auto"

alias li="xbacklight -set"
alias al="alsamixer"

alias chrome="google-chrome-stable"
alias w3m="w3m -no-mouse"
alias www="w3m -no-mouse duckduckgo.com"
alias search="/home/gok/scripts/search.sh"
alias surf="surf duckduckgo.com"
alias yt="mpsyt"

alias battery="/home/gok/scripts/battery.sh"
alias sc="sc-im"
alias fm="/home/gok/scripts/vifm.sh"
alias mutt="neomutt"

