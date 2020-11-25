#!/bin/sh

gpg_status_file=/tmp/gpg_needs_key

source ~/.zprofile

if mbsync -c ~/.config/isync/mbsyncrc -a 2> /tmp/mbsyncrc.log; \
	then rm -f $gpg_status_file; 
	else touch $gpg_status_file;
fi
