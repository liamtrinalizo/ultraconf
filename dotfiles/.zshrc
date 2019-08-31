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

export LANG=en_US.UTF-8
export EDITOR=vim
export QSYS_ROOTDIR="/home/gok/intelFPGA_lite/18.1/quartus/sopc_builder/bin"

bindkey -e

autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

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
alias search="/home/gok/scripts/search.sh"
alias yt="mpsyt"

alias battery="/home/gok/scripts/battery.sh"
alias scim="sc-im"

