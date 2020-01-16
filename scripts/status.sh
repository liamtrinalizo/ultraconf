#!/bin/sh

while getopts 'bmt' opt; do
    case "$opt" in
        b)
            acpi | cut -d "," -f 2 | sed 's/ //' ;;
        m) 
            FILECOUNT=$(ls -l ~/.local/share/mail/work/INBOX/new/ | wc -l)
            if [ "$FILECOUNT" -gt 1 ]; then
                echo " M" 
            fi ;;
        t)
            #torrent
            echo "100%" ;;
    esac
done
