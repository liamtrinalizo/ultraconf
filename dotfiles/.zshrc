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

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000


# ALIASES
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias  l="ls -1Na   --group-directories-first --color=auto"

alias li="xbacklight -set"
alias al="alsamixer"

alias grep="grep -n --color"

alias chrome="google-chrome-stable"
alias w3m="w3m -no-mouse"
alias search="/home/gok/scripts/search.sh"

alias battery="/home/gok/scripts/battery.sh"

alias lock="xscreensaver-command -lock"

export EDITOR=vim
export QSYS_ROOTDIR="/home/gok/intelFPGA_lite/18.1/quartus/sopc_builder/bin"

bindkey -e

export TERM=xterm-256color
