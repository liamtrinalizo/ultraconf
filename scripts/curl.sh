#!/bin/sh

while getopts 'bc:fmn:q:z' OPTION; do 
    case "$OPTION" in
        b)
            curl -s rate.sx ;;
        c)
            curl -s cheat.sh/$OPTARG ;;
        f)
            curl -sL https://www.commandlinefu.com/commands/random/json | \
                sed -r -e 's/"id":"[0-9]+",//' \
                       -e 's/"votes":"(-|)[0-9]+",//' \
                       -e 's/,"url":".+"//' \
                       -e 's/\[\{//' \
                       -e 's/\}\]//' \
                       -e 's/,/\n/'
            ;;
        m)
            curl -s wttr.in ;;
        n)
            curl -s getnews.tech/$OPTARG ;;
        q)
            curl -s qrenco.de/$OPTARG ;;
        z)
            curl -Ls commandlinefu.com/commands/random | \
            grep "command code" ;;
        ?)
            echo "script usage:$(basename) [-c CHEAT] [-m] [-q QRCODE]" ;;
    esac
done
