#!/bin/zsh

printUsage() {
    echo 'Usage pathConv.sh w|l'
    echo 'w: window'
    echo 'l: linux'
    exit
}

[ "$#" -lt 1 ] && printUsage
[ $1 = l ] && (d=$(< /dev/stdin tr '\\' /); echo "/mnt/${d:0:1:l}/${d:2}")
[ $1 = w ] && (d=$(< /dev/stdin); echo "${d:5:1:u}:${${d:6}//\//\\\\}")
exit 0
