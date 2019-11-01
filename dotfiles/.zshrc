HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

autoload -U compinit
compinit
autoload -U promptinit
promptinit
prompt adam1
zstyle ':completion:*' menu select
zmodload zsh/complist


export LANG=en_US.UTF-8
export EDITOR=vim
export KEYTIMEOUT=1
export LESSHIST="-"

bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# alias ---------------------------------------
#export ALTERAPATH="/home/gok/intelFPGA_lite/18.1"
#export ALTERAOCLSDKROOT="${ALTERAPATH}/hld"
#export QUARTUS_ROOTDIR=${ALTERAPATH}/quartus
#export QUARTUS_ROOTDIR_OVERRIDE="$QUARTUS_ROOTDIR"
#export PATH=$PATH:${ALTERAPATH}/quartus/bin
#export PATH=$PATH:${ALTERAPATH}/nios2eds/bin
#export PATH=$PATH:${QSYS_ROOTDIR}

alias df='df -h'
alias du='du -h'

alias less='less -r'
#alias grep='grep --color -rn'
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -hF --color=tty'
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias  l="ls -1Na   --group-directories-first --color=auto"

alias li="xbacklight -set"
alias al="alsamixer"

alias chrome="google-chrome-stable"
alias w3m="w3m "
alias www="w3m duckduckgo.com"
alias search="/home/gok/scripts/search.sh"
alias surf="surf duckduckgo.com"
alias yt="mpsyt"

alias battery="/home/gok/scripts/battery.sh"
alias sc="sc-im"
alias fm="/home/gok/scripts/vifm.sh"
alias mutt="neomutt"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
