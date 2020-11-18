#!/bin/sh

ULTRACONF_DOTFILES=$XDG_CONFIG_HOME/ultraconf/dotfiles

installFile() {
    [ ! -d $XDG_CONFIG_HOME/$1 ] && mkdir $XDG_CONFIG_HOME/$1
    [ ! -d $ULTRACONF_DOTFILES/$1 ] && ln -sf $ULTRACONF_DOTFILES/$1    $XDG_CONFIG_HOME/$1/$2 \
                                    || ln -sf $ULTRACONF_DOTFILES/$1/$2 $XDG_CONFIG_HOME/$1/$2
}

installFile bc              bcrc
installFile bspwm           bspwmrc
installFile gdb             init
installFile git             config
installFile gnuplot         config
installFile sxhkd           sxhkdrc
installFile tmux            tmux.conf
installFile translate-shell init.trans
installFile vim             vimrc
mkdir $XDG_CONFIG_HOME/{} $XDG_DATA_HOME/{vim,vim/undo,vim/swap,vim/backup,vim/view}
installFile zsh             .zshrc

installFile mutt            style.muttrc
installFile mutt            mailcap
installFile w3m             config
installFile w3m             keymap
installFile x11             xinitrc
installFile x11             xresources
