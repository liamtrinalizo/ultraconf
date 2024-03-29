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
alias ls="ls -h --color=tty"
alias magickdoc="$CLIBROWSER 'https://legacy.imagemagick.org/script/command-line-options.php'"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc"
alias mpv="mpv --osd-font-size=40"
alias mutt="which neomutt >/dev/null && neomutt || mutt"
alias offlineimap="offlineimap -c $XDG_CONFIG_HOME/offlineimap/config"
alias rdp="xfreerdp /log-level:ERROR /compression-level:2 /f /dynamic-resolution /cert:ignore -wallpaper +clipboard -grab-keyboard"
alias rem1="rem -m -b1 -q -g"
alias remcal="rem -m -b1 -q -cuc12 -w$(($(tput cols)+1)) | sed -e 's/\f//g' | less"
alias sqlformat="sqlformat -rs -k lower -i upper"
alias startx="exec startx $XDG_CONFIG_HOME/X11/xinitrc"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias xclip2="xclip -selection clipboard"
alias elinksd="elinks -dump -dump-width $COLUMNS -dump-color-mode 0"


color()      { convert -size 100x100 canvas:#$1 png:- | display }
dic()        { $CLIBROWSER "$1.wiktionary.org/wiki/$2" }
qtdoc()      { $BROWSER "https://doc.qt.io/qt-5/$1.html" }
greptar()    { tar ft $2 | awk '/.*[^/]$/' | while read -r file; do if tar xf $2 $file -O | grep -w $1 && echo -e "\e[36m$file\e[m"; done }
keep()       { drive pull -no-prompt -ignore-conflict $1 && vi $1 && drive push -no-prompt -ignore-conflict $1 }
hiit()       { r=0; while true; do for i in $(seq 1 $1); do clear; convert -size 175x100 canvas:black -fill white -pointsize 80 -draw "text 0,75 \"$r, $i\"" /tmp/counter.png;
               img2txt -futf8 /tmp/counter.png; sleep 1; done; speaker-test > /dev/null 2>&1 & (sleep 1 && killall speaker-test); r=$(($r + 1)); done }
music()      { mpv "$($FUZZYFIND < $1 | awk '{print $2}')" --no-video }
prettyname() { for i in $@; do new=${i// /_}; new=${new//\\/}; echo "$i -> ${new:l}";  mv "$i" "${new:l}" 2> /dev/null; done }
tex2pdf()    { pdflatex -halt-on-error -output-directory /tmp $1 && mv /tmp/$(basename $1 .tex).pdf . }
timer()      { sleep $1 && speaker-test > /dev/null 2>&1 & (sleep 1 && killall speaker-test > /dev/null 2>&1) }
youtube()    { mpv "$(fzy < $1 | awk '{print $2}')" --no-video }

[ -e ~/.config/zsh/zshrc-windows -a $(uname -o) = Cygwin ] && source ~/.config/zsh/zshrc-windows
