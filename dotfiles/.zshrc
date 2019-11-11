HISTFILE=~/.cache/zsh/histfile
HISTFILE=~/.histfile
HISTSIZE=10000
HISTSIZE=10000
SAVEHIST=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory  
export LESSHIST="-"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit promptinit
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v
compinit
promptinit; prompt adam2 
zmodload zsh/complist

export EDITOR=vim
export KEYTIMEOUT=1
export LANG=en_US.UTF-8

[ -f /cygdrive/c/users/mj093/.Xresources ] && xrdb /cygdrive/c/users/mj093/.Xresources > /dev/null 2>&1

# Perso ---------------------------------------
#export ALTERAPATH="/home/gok/intelFPGA_lite/18.1"
#export ALTERAOCLSDKROOT="${ALTERAPATH}/hld"
#export QUARTUS_ROOTDIR=${ALTERAPATH}/quartus
#export QUARTUS_ROOTDIR_OVERRIDE="$QUARTUS_ROOTDIR"
#export PATH=$PATH:${ALTERAPATH}/quartus/bin
#export PATH=$PATH:${ALTERAPATH}/nios2eds/bin
#export PATH=$PATH:${QSYS_ROOTDIR}

alias l="ls -1Na   --group-directories-first --color=auto"
alias al="alsamixer"
alias battery="/home/gok/scripts/battery.sh"
alias call=''
alias cl='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/bin/Hostx64/x64/cl.exe'
alias cmd='/cygdrive/c/Windows/system32/cmd.exe'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color'
alias grep='grep --color'
alias gvim='/cygdrive/c/Program\ Files\ \(x86\)/Vim/vim81/gvim.exe'
alias jeanb='cd /cygdrive/d/WORK/100539_Jean_Bracq/jeanbracq_qt_app'
alias li="xbacklight -set"
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias ls='ls -hF --color=tty'
alias mongo='/cygdrive/c/Users/MJ093/.3T/third-party/2019.2.1/mongo.exe'
alias msg='/cygdrive/c/Program\ Files\ \(x86\)/NetPhone\ Client/IMClient.exe'
alias mutt="neomutt"
alias qmake='/cygdrive/c/Qt/5.11.1/msvc2017_64/bin/qmake.exe'
alias sc="sc-im"
alias serge='ssh serge@172.16.7.21'
alias tftpd='/cygdrive/c/Program\ Files\ \(x86\)/TFTPserver/RunStandAloneMT.bat'
alias tshark='/cygdrive/c/Program\ Files/Wireshark/tshark.exe'
alias uptime='net stats srv | sed -n 4p | cut -d " " -f 3-4'
alias w3m="w3m "
alias windows='cd /cygdrive/d/WORK/SVN/Windows/Addidata_Device_Drivers/Current'
alias work='cd /cygdrive/d/WORK/'
alias www="w3m duckduckgo.com"
alias yt="mpsyt"
