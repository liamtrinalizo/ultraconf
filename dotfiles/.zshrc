HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory  

autoload -U compinit promptinit edit-command-line
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_option+=(globdots)

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%m:%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '

bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

export KEYTIMEOUT=1
export EDITOR=vim
export LANG=en_US.UTF-8

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

alias al="alsamixer"
alias cal="cal -m"
alias grep="grep --color"
alias l="ls -1Na --group-directories-first --color=auto"
alias li="xbacklight -set"
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias ls="ls -hF --color=tty"
alias xclip2="xclip -selection clipboard"
alias rem1="rem -m -b1 -q -g"
alias remcal="rem -m -b1 -q -cuc12 -w$(($(tput cols)+1)) | sed -e 's/\f//g' | less"
alias startx="exec startx $XDG_CONFIG_HOME/X11/xinitrc"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc"

[ -d /cygdrive ] && source ~/.config/zsh/zshrc-windows

n()
{
    [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ] && echo "nnn is already running" && return
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"
    [ -f "$NNN_TMPFILE" ] && . "$NNN_TMPFILE"; rm -f "$NNN_TMPFILE" > /dev/null
}
