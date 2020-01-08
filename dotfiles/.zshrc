HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory  
export LESSHIST="-"

autoload -U compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_option+=(globdots)

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
promptinit; prompt adam1 
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

export KEYTIMEOUT=1
export EDITOR=vim
export LANG=en_US.UTF-8

alias al="alsamixer"
alias cal='cal -m'
alias grep='grep --color'
alias l="ls -1Na --group-directories-first --color=auto"
alias li="xbacklight -set"
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias ls='ls -hF --color=tty'
alias mutt="neomutt"
alias vi="vi -X"
alias www='~/scripts/search.sh'
alias yt="mpsyt"
[ -d /cygdrive ] && alias cl='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/bin/Hostx64/x64/cl.exe'
[ -d /cygdrive ] && alias cmd='/cygdrive/c/Windows/system32/cmd.exe'
[ -d /cygdrive ] && alias gvim='/cygdrive/c/Program\ Files\ \(x86\)/Vim/vim81/gvim.exe'
[ -d /cygdrive ] && alias jeanb='cd /cygdrive/d/WORK/100539_Jean_Bracq/jeanbracq_qt_app'
[ -d /cygdrive ] && alias mongo='/cygdrive/c/Users/MJ093/.3T/third-party/2019.2.1/mongo.exe'
[ -d /cygdrive ] && alias msg='/cygdrive/c/Program\ Files\ \(x86\)/NetPhone\ Client/IMClient.exe'
[ -d /cygdrive ] && alias qmake='/cygdrive/c/Qt/5.11.1/msvc2017_64/bin/qmake.exe'
[ -d /cygdrive ] && alias quartus_prg='/cygdrive/c/intelFPGA_lite/18.1/quartus/bin64/quartus_pgm.exe'
[ -d /cygdrive ] && alias tshark='/cygdrive/c/Program\ Files/Wireshark/tshark.exe'
[ -d /cygdrive ] && alias uptime='net stats srv | sed -n 4p | cut -d " " -f 3-4'
[ -d /cygdrive ] && alias windows='cd /cygdrive/d/WORK/SVN/Windows/Addidata_Device_Drivers/Current'
[ -d /cygdrive ] && alias work='cd /cygdrive/d/WORK/'

MODE_CURSOR_VICMD="block"
MODE_CURSOR_VIINS="blinking bar"
MODE_CURSOR_SEARCH="steady underline"
[ -f ~/.Xresources ] && xrdb ~/.Xresources > /dev/null 2>&1
[ -f ~/.addi.gpg ] && gpg --quiet --for-your-eyes-only --no-tty --decrypt ~/.addi.gpg > /dev/null
[ -d ~/pkg/zsh ] && source ~/pkg/zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh
[ -d ~/pkg/zsh ] && source ~/pkg/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
