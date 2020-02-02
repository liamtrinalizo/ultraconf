#!/bin/sh

while getopts 'bgmt' opt; do
    case "$opt" in
        b)
            acpitool | head -1 | cut -d ',' -f 2 | sed -z 's/\n//' ;;
        g)
            if [ -f /tmp/gpg_needs_key ]; then
                echo -n " G"
            fi ;;
        m) 
            FILECOUNT=$(ls -l ~/.local/share/mail/work/INBOX/new/ | wc -l)
            if [ "$FILECOUNT" -gt 1 ]; then
                echo -n " M" 
            fi ;;
    esac
done
