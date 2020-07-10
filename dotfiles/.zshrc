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

[ -d /cygdrive ] && alias cl='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/bin/Hostx64/x64/cl.exe'
[ -d /cygdrive ] && alias cmd='/cygdrive/c/Windows/system32/cmd.exe'
[ -d /cygdrive ] && alias gvim='/cygdrive/c/Program\ Files\ \(x86\)/Vim/vim81/gvim.exe'
[ -d /cygdrive ] && alias jeanb='cd /cygdrive/d/WORK/jeanbracq/jeanbracq_qt_app'
[ -d /cygdrive ] && alias mongo='/cygdrive/c/Users/MJ093/.3T/third-party/2019.2.1/mongo.exe'
[ -d /cygdrive ] && alias msg='/cygdrive/c/Program\ Files\ \(x86\)/NetPhone\ Client/IMClient.exe'
[ -d /cygdrive ] && alias qmake='/cygdrive/c/Qt/Qt5.12.8/5.12.8/msvc2017/bin/qmake.exe'
[ -d /cygdrive ] && alias jom='/cygdrive/c/Qt/5.12.5/Tools/QtCreator/bin/jom.exe'
[ -d /cygdrive ] && alias quartus_prg='/cygdrive/c/intelFPGA_lite/18.1/quartus/bin64/quartus_pgm.exe'
[ -d /cygdrive ] && alias tshark='/cygdrive/c/Program\ Files/Wireshark/tshark.exe'
[ -d /cygdrive ] && alias uptime='net stats srv | sed -n 4p | cut -d " " -f 3-4'
[ -d /cygdrive ] && alias windows='cd /cygdrive/d/WORK/SVN/Windows/Addidata_Device_Drivers/Current'
[ -d /cygdrive ] && alias work='cd /cygdrive/d/WORK/'
[ -d /cygdrive ] && alias dcc='/cygdrive/c/Program\ Files\ \(x86\)/Embarcadero/Studio/20.0/bin/dcc64.exe'

n()
{
    [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ] && echo "nnn is already running" && return
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"
    [ -f "$NNN_TMPFILE" ] && . "$NNN_TMPFILE"; rm -f "$NNN_TMPFILE" > /dev/null
}
