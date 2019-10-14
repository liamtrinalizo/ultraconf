export LANG=en_US.UTF-8

#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle ':completion:*' matcher-list ''
#zstyle ':completion:*' max-errors 5
#zstyle ':completion::complete:*' use-cache 1

autoload -U compinit promptinit
compinit
promptinit; prompt adam2 

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory  

export EDITOR=vim
setopt autocd notify
bindkey -M vicmd '/' history-search-backward
bindkey -e

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

xrdb /cygdrive/c/users/mj093/.Xresources > /dev/null 2>&1
#PATH=$PATH:~/diff-so-fancy-1.2.6

# Perso ---------------------------------------

alias df='df -h'
alias du='du -h'

alias less='less -r'
alias whence='type -a'
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -hF --color=tty'
alias ll='ls -la --group-directories-first'

alias work='cd /cygdrive/d/WORK/'
alias jeanb='cd /cygdrive/d/WORK/100539_Jean_Bracq/jeanbracq_qt_app'
alias windows='cd /cygdrive/d/WORK/SVN/Windows/Addidata_Device_Drivers/Current'

alias st='git --no-pager status'
alias add='git --no-pager add'
alias br='git --no-pager branch'
alias ci='git --no-pager commit'
alias cim='git --no-pager commit -m'
alias co='git --no-pager checkout'
alias pull='git --no-pager pull'
alias push='git --no-pager push'
alias log1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias log2="git log --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias cmd='/cygdrive/c/Windows/system32/cmd.exe'
alias tftpd='/cygdrive/c/Program\ Files\ \(x86\)/TFTPserver/RunStandAloneMT.bat'
alias tshark='/cygdrive/c/Program\ Files/Wireshark/tshark.exe'
alias qmake='/cygdrive/c/Qt/5.11.1/msvc2017_64/bin/qmake.exe'
alias cl='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/bin/Hostx64/x64/cl.exe'
alias mongo='/cygdrive/c/Users/MJ093/.3T/third-party/2019.2.1/mongo.exe'

alias uptime='net stats srv | sed -n 4p | cut -d " " -f 3-4'

alias serge='ssh serge@172.16.7.21'

alias msg='/cygdrive/c/Program\ Files\ \(x86\)/NetPhone\ Client/IMClient.exe'
alias call=''
