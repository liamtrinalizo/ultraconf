export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"

# Default programs:
export SHELL="zsh"
export EDITOR="vi"
export TERMINAL="st"
export READER="zathura"
export BROWSER="brave-bin"
export CLIBROWSER="elinks"

# Misc
export HISTFILESIZE=10000
export HISTSIZE=10000
export LS_COLORS="or=40;31;01"
export PATH="$PATH:$XDG_BIN_HOME"

# Dotfiles
#export XAUTHORITY="$XDG_CONFIG_HOME/X11/.Xauthority"
export BC_ENV_ARGS="$XDG_CONFIG_HOME/bc/bcrc"
export DISTCC_DIR="/var/tmp/portage/.distcc/"
export DOTREMINDERS="$XDG_DATA_HOME/remind/reminders"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export PYTHONPATH="PYTHONPATH:$XDG_CONFIG_HOME/python:/usr/lib/python3.7/site-packages:~/.local/lib/python3.7/site-packages"
export TERM="xterm-256color"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export XAPPLRESDIR="$HOME/config"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
