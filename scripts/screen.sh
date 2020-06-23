#!/bin/bash

brg="--brightness 1"

while getopts 's:' OPTION; do
    case "$OPTION" in
        s)
            if [ $OPTARG == "1" ]; then
                echo "Single screen mode"
                xrandr --output LVDS1 --auto --rotate normal --pos 0x0  \
                       --output DP1   --off
            elif [ $OPTARG == "2" ]; then
                echo "Double screen mode"
                xrandr --output DP1 --right-of LVDS1
            elif [ $OPTARG == "3" ]; then
                echo "Triple screen mode"
                xrandr --output DP1   $brg --left-of HDMI1 \
                       --output HDMI1 $brg --left-of HDMI2 \
                       --output HDMI2 $brg
            fi
            ;;
        ?)
            echo "script usage: $(basename $0) -s 1|2" >&2
            exit 1
            ;;
    esac
done
