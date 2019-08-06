export LANG=en_US.UTF-8

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' max-errors 5
zstyle ':completion::complete:*' use-cache 1

autoload -U compinit promptinit
compinit
promptinit; prompt walters

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000

setopt autocd notify
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

case $TERM in (*xterm*|rxvt|(dt|k|E)term)
  precmd () { print -Pn "\e]0;%n@%m: %~\a" }
  preexec () { print -Pn "\e]0;%n@%m: $1\a" }
  ;;
esac

# Perso ---------------------------------------

 alias df='df -h'
 alias du='du -h'

 alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
 alias grep='grep --color -rn'                 # show differences in colour
 alias egrep='egrep --color=auto'              # show differences in colour
 alias fgrep='fgrep --color=auto'              # show differences in colour

 alias ls='ls -hF --color=tty'                 # classify files in colour
 alias ll='ls -la --group-directories-first'

 alias work='cd /cygdrive/d/WORK/'
 alias jeanb='cd /cygdrive/d/WORK/100539_Jean_Bracq/'
 alias windows='cd /cygdrive/d/WORK/SVN/Windows/Addidata_Device_Drivers/Current'
 
 alias tgitci='/cygdrive/c/Program\ Files/TortoiseGit/bin/TortoiseGitProc.exe /path:. /command:commit'
 alias tgitlog='/cygdrive/c/Program\ Files/TortoiseGit/bin/TortoiseGitProc.exe /path:. /command:log'
 alias tftpd='c/Program\ Files\ \(x86\)/TFTPserver/RunStandAloneMT.bat'

 alias serge='ssh serge@172.16.7.21'

 alias msg='/cygdrive/c/Program\ Files\ \(x86\)/NetPhone\ Client/IMClient.exe'
 alias call=''


 autoload -U compinit promptinit
 compinit
 promptinit; prompt gentoo

# SCREEN
if [ -z "$STY" ]; then
    #screen  -d -RR
fi
case "$TERM" in
#    screen*) PROMPT_COMMAND='echo -ne "\033k\033\0134"'
esac


# ALIASES
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias  l="ls -1Na   --group-directories-first --color=auto"

alias li="xbacklight -set"
alias al="alsamixer"

alias chrome="google-chrome-stable"
alias search="/home/gok/scripts/search.sh"

alias battery="/home/gok/scripts/battery.sh"

alias lock="xscreensaver-command -lock"

export EDITOR=vim
export QSYS_ROOTDIR="/home/gok/intelFPGA_lite/18.1/quartus/sopc_builder/bin"

bindkey -e
