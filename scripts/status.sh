#!/bin/sh

while getopts 'bgmr' opt; do
    case "$opt" in
        b)
            which acpitool &> /dev/null || break
            acpitool | grep Full        > /dev/null && echo -n " ▌"
            acpitool | grep Charging    > /dev/null && echo -n " ↑"
            acpitool | grep Discharging > /dev/null && echo -n " ↓"

            charge=$(acpitool | awk -F'[ \.]' '/Battery/ {print $11}')
            echo -n "$charge"
            [ $charge -lt 30 ] && tmux set-environment bat_low 1 || tmux set-environment bat_low 0
            ;;
        g)
            [ -f /tmp/gpg_needs_key ] && echo -n " K" ;;
        m)
            new=$(($(ls -l ~/.local/share/mail/work/INBOX/new/ | wc -l) - 1))
            [ "$new" -gt 0 ] && echo -n " ${new}M" ;;
        r)
            < /tmp/remind head -1 ;;
    esac
done
