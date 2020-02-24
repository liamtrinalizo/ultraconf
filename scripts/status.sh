#!/bin/sh

while getopts 'bgmt' opt; do
    case "$opt" in
        b)
<<<<<<< Updated upstream
            BAT=$(acpitool | head -1 | cut -d ',' -f 2 | sed -z 's/\(\n\|\...\|%\)//g')
            echo $BAT
            if [ $BAT -lt 30 ]; then
                export BAT_LOW
            fi ;;
        g)
            if [ -f /tmp/gpg_needs_key ]; then
                echo -n " G"
            fi ;;
||||||| constructed merge base
            acpi | cut -d "," -f 2 | sed 's/ //' ;;
=======
            acpitool | sed -n '1p' | cut -d "," -f 2 | sed 's/ //' ;;
>>>>>>> Stashed changes
        m) 
            FILECOUNT=$(ls -l ~/.local/share/mail/work/INBOX/new/ | wc -l)
            if [ "$FILECOUNT" -gt 1 ]; then
                echo -n " M" 
            fi ;;
    esac
done
