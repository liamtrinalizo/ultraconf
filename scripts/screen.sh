#!/bin/sh

while getopts 'l:s:' OPTION; do
    case "$OPTION" in
        s)
            if [ $OPTARG == "1" ]; then
                echo "Single screen mode"
                xrandr --output LVDS1 --auto --rotate normal --pos 0x0  \
                       --output DP1   --off

                bspc monitor LVDS1   -d 1 2 3 4 5 6 7 8 9
                bspc rule -a Brave-browser desktop='^2'
            elif [ $OPTARG == "2" ]; then
                echo "Double screen mode"
                xrandr --output DP1 --right-of LVDS1

                bspc monitor DP1   -d 1 2 3 4 5
                bspc monitor LVDS1 -d 6 7 8 9 0
                bspc rule -a Brave-browser desktop='^6'
            elif [ $OPTARG == "3" ]; then
                echo "Triple screen mode"
                xrandr --output DP1    --left-of HDMI1 \
                       --output HDMI1  --left-of HDMI2 \
                       --output HDMI2

                bspc monitor DP1   -d 1 2 3
                bspc monitor HDMI1 -d 4 5 6
                bspc monitor HDMI2 -d 7 8 9
                bspc rule -a Brave-browser desktop='^5'
            fi

            for desktop in $(bspc query -D); do bspc desktop $desktop -l tiled; done
            ;;
        l)
            BRG="--brightness $OPTARG" ;;
        ?)
            echo "script usage: $(basename $0) -s 1|2" >&2
            exit 1 ;;
    esac
done
