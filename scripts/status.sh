#!/bin/sh

while getopts 'bgmt' opt; do
    case "$opt" in
        b)
            BAT=$(acpitool | head -1 | cut -d ',' -f 2 | sed -z 's/\(\n\|\...\|%\)//g')
            echo $BAT
            if [ $BAT -lt 30 ]; then
                export BAT_LOW
            fi ;;
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
