#!/bin/sh

printUsage() {
    echo 'Usage ./pathConv.sh w|l'
    echo 'w: window'
    echo 'l: linux'
    exit
}

[ $# -lt 1 ] && printUsage
[ $1 = l ] && sed /dev/stdin -e 's/\\/\//g' -e 's/P:/\/mnt\/p/g'
[ $1 = w ] && sed /dev/stdin -e 's/\//\\/g' -e 's/\\mnt\\p/P:/g'
