# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

## if $STY is not set...
if [ -z "$STY" ]; then
    screen  -d -RR
fi

# Put your fun stuff here.
alias ll="ls -Nlhav --group-directories-first"
alias  l="ls -1Na   --group-directories-first --color=auto"

alias li="xbacklight -set"

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[38;5;11m\] \w \$ \[\033[38;5;0m\]\[\033[48;5;1m\]$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[$(tput sgr0)\]\[\033[38;5;15m\]'
#export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[38;5;11m\] \w \[\033[38;5;0m\]\[\033[48;5;1m\]$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[$(tput sgr0)\]\[\033[38;5;15m\]'

case "$TERM" in
    screen*) PROMPT_COMMAND='echo -ne "\033k\033\0134"'
esac

