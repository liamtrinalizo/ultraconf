#!/bin/sh

while getopts 'bgmr' opt; do
    case "$opt" in
        b)
            BAT=$(acpitool | head -1 | cut -d ',' -f 2 | sed -z 's/\(\n\|\...\|%\)//g')
            echo $BAT
            if [ $BAT -lt 30 ]; then
                tmux set-environment bat_low 1
            else
                tmux set-environment bat_low 0
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
        r)
            remind ~/.reminders | head -1 | sed 's/No reminders.//' ;;
    esac
done
