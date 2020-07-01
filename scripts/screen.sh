#!/bin/bash

BRG=""

while getopts 'l:s:' OPTION; do
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
                xrandr --output DP1   $BRG --left-of HDMI1 \
                       --output HDMI1 $BRG --left-of HDMI2 \
                       --output HDMI2 $BRG
            fi ;;
        l)
            BRG="--brightness $OPTARG" ;;
        ?)
            echo "script usage: $(basename $0) -s 1|2" >&2
            exit 1 ;;
    esac
done
