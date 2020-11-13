#!/bin/sh

NOTIF_FILE=~/.local/share/gitNotif/last_notif
git show $(< $NOTIF_FILE)..master --no-color | neomutt -s 'Update notification 😁' $@
git log --format=%T -1 HEAD > $NOTIF_FILE
