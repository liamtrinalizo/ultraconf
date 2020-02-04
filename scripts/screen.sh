#!/bin/bash

while getopts 's:' OPTION; do
    case "$OPTION" in
        s)
            if [ $OPTARG == "1" ]; then
                echo "Single screen mode"
                xrandr --output LVDS1 --auto --rotate normal --pos 0x0  \
                       --output DP1   --off
            else if [ $OPTARG == "2" ]; then
                echo "Double screen mode"
                xrandr --output LVDS1 --auto --rotate   normal --pos 0x0 \
                       --output DP1   --auto --right-of LVDS1
                fi
            fi
            ;;
        ?)
            echo "script usage: $(basename $0) -s 1|2" >&2
            exit 1
            ;;
    esac
done
