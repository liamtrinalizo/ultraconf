#!/bin/sh

gpg_status_file=/tmp/gpg_needs_key
imaptool=$(which mbsync 2>/dev/null && echo mbsync || echo offlineimap)

# mbsync needs the -a parameter
toolparam=$(which mbsync 2>/dev/null && echo -a)
source ~/.zprofile

$imaptool -c $XDG_CONFIG_HOME/$imaptool/config $toolparam 2> /tmp/mailsync.log && rm -f $gpg_status_file || touch $gpg_status_file
