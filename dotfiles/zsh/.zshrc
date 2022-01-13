fpath=($fpath $XDG_CONFIG_HOME/zsh/completion)
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory sharehistory incappendhistory HIST_SAVE_NO_DUPS

autoload -U compinit promptinit edit-command-line
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_option+=(globdots)
compdef -d svn

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
setopt PROMPT_SUBST
[ "$(whoami)" = "root" ] && promptcolor=red || promptcolor=yellow
PROMPT="%F{$promptcolor}%! %n@%m:%9c%F{green}$(parse_git_branch)%F{none} $ "

export GPG_TTY=$(tty)

bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
zle -N edit-command-line
bindkey '^x^e' edit-command-line

export KEYTIMEOUT=1

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

alias abook="abook --config $XDG_CONFIG_HOME/abook/abookrc --datafile $XDG_DATA_HOME/abook/addressbook"
alias al="alsamixer"
alias cal="cal -m"
alias curl="curl --silent"
alias ffmpeg="ffmpeg -y  -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias gdb="gdb -nh -x $XDG_CONFIG_HOME/gdb/init"
alias gnuplot="HOME=$XDG_CONFIG_HOME/gnuplot/ gnuplot"
alias grep="grep --color -I --exclude tags --exclude-dir .svn"
alias ip="ip --color"
alias l="ls -1Na --group-directories-first --color=auto"
alias li="xbacklight -set"
alias ll="ls -Nlhav --group-directories-first --color=auto"
alias lo="loffice --norestore"
alias ls="ls -hF --color=tty"
alias magickdoc="elinks 'https://legacy.imagemagick.org/script/command-line-options.php'"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc"
alias mutt="neomutt"
alias rdp="xfreerdp /log-level:ERROR /compression-level:2 /f /dynamic-resolution /cert:ignore -wallpaper +clipboard -grab-keyboard"
alias rem1="rem -m -b1 -q -g"
alias remcal="rem -m -b1 -q -cuc12 -w$(($(tput cols)+1)) | sed -e 's/\f//g' | less"
alias startx="exec startx $XDG_CONFIG_HOME/X11/xinitrc"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias wdump="w3m -dump -T text/html"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias xclip2="xclip -selection clipboard"

tex2pdf()    { pdflatex -halt-on-error -output-directory /tmp $1 && mv /tmp/$(basename $1 .tex).pdf . }
color()      { magick convert -size 100x100 canvas:#$1 png:- | display }
dxiv()       { sxiv =( magick convert -background black -alpha remove -alpha off +negate $1 png:- )}
greptar()    { tar ft $2 | awk '/.*[^/]$/' | while read -r file; do if tar xf $2 $file -O | grep -w $1 && echo -e "\e[36m$file\e[m"; done }
dic()        { elinks "$1.wiktionary.org/wiki/$2" }
prettyname() { for i in $@; do new=${i// /_}; new=${new//\\/}; echo "$i -> ${new:l}";  mv "$i" "${new:l}"; done }

[ -e /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
