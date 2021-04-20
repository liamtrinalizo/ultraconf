#!/bin/sh

gpg_status_file=/tmp/gpg_needs_key
source ~/.zprofile

mbsync -c ~/.config/isync/mbsyncrc -a 2> /tmp/mbsyncrc.log && rm -f $gpg_status_file || touch $gpg_status_file
