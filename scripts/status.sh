#!/bin/sh

while getopts 'bgmt' opt; do
    case "$opt" in
        b)
            acpi | cut -d "," -f 2 | sed 's/ //' ;;
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
