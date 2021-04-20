#!/bin/sh

printUsage() {
    echo 'Usage ./pathConv.sh w|l'
    echo 'w: window'
    echo 'l: linux'
    exit
}

[ $# -lt 1 ] && printUsage
[ $1 = l ] && sed /dev/stdin -e 's/\\/\//g' -e 's/P:/\/mnt\/p/g'
[ $1 = w ] && sed /dev/stdin -e 's/\//\\/g' \
                             -e 's/\\mnt\\h/H:/g' \
                             -e 's/\\mnt\\l/L:/g' \
                             -e 's/\\mnt\\n/N:/g' \
                             -e 's/\\mnt\\m/M:/g' \
                             -e 's/\\mnt\\o/O:/g' \
                             -e 's/\\mnt\\p/P:/g' \
                             -e 's/\\mnt\\r/R:/g' \
                             -e 's/\\mnt\\t/T:/g' \
                             -e 's/\\mnt\\w/W:/g' \
                             -e 's/\\mnt\\z/Z:/g'
