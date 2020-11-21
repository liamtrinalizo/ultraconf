#!/bin/sh

ULTRACONF_DOTFILES=$XDG_CONFIG_HOME/ultraconf/dotfiles

installFile() {
    [ ! -d $XDG_CONFIG_HOME/$1 ] && mkdir -p $XDG_CONFIG_HOME/$1
    [ ! -d $ULTRACONF_DOTFILES/$1 ] && ln -sf $ULTRACONF_DOTFILES/$1    $XDG_CONFIG_HOME/$1/$2 \
                                    || ln -sf $ULTRACONF_DOTFILES/$1/$2 $XDG_CONFIG_HOME/$1/$2
}

[ ! -d $XDG_CONFIG_HOME ]      && mkdir $XDG_CONFIG_HOME
[ ! -d $XDG_DATA_HOME ]        && mkdir -p $XDG_DATA_HOME
[ ! -d $XDG_DATA_HOME/../bin ] && mkdir -p $XDG_DATA_HOME/../bin

# Install users dotfiles
cp $ULTRACONF_DOTFILES/zprofile ~
installFile bc              bcrc
installFile bspwm           bspwmrc
installFile gdb             init
installFile git             config
installFile gnuplot         config
installFile sxhkd           sxhkdrc
installFile tmux            tmux.conf
installFile translate-shell init.trans
installFile zprofile        .zprofile
mkdir $XDG_CONFIG_HOME/vim/{spell,syntax} $XDG_DATA_HOME/{vim,vim/undo,vim/swap,vim/backup,vim/view} 2> /dev/null
installFile vim             vimrc
installFile zathura         zathurarc
installFile mutt            style.muttrc
installFile mutt            mailcap
installFile w3m             config
installFile w3m             keymap
installFile X11             xinitrc
installFile X11             xresources
mkdir $XDG_CONFIG_HOME/zsh/completion 2> /dev/null
installFile zsh             .zshrc
installFile zsh/completion  _jira

# Install users scripts
ln -sf $ULTRACONF_DOTFILES/../scripts $XDG_DATA_HOME/../bin/

# Install Portage conf root files
sudo rmdir /etc/portage/package.* 2> /dev/null
sudo cp $ULTRACONF_DOTFILES/../portage/{make.conf,package.*} /etc/portage/
sudo cp $ULTRACONF_DOTFILES/../portage/world /var/lib/portage/

# Install overlay
sudo cp -r $ULTRACONF_DOTFILES/../overlay /var/db/repos/perso
