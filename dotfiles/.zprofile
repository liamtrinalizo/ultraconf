export PATH=$PATH:~/.cargo/bin

# Default programs:
export EDITOR="vim"
export TERMINAL="st"
export READER="zathura"
export FILE="nnn"
export GPG_TTY="$(tty)"

export GPG_TTY=$(tty)
# ~/ Clean-up:
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

export DOTREMINDERS="$XDG_CONFIG_HOME/remind/reminders"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="$XDG_CACHE_HOME/less"
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export PYTHONPATH="$XDG_CONFIG_HOME/python"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export XAPPLRESDIR="$XDG_CONFIG_HOME/gnuplot/config"
export XAUTHORITY="$XDG_CONFIG_HOME/X11/.Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export BC_ENV_ARGS="$XDG_CONFIG_HOME/bc/bcrc"
