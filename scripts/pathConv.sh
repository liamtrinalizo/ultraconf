#!/bin/zsh

printUsage() {
    echo 'Usage pathConv.sh w|l|c'
    echo 'w: window'
    echo 'l: linux'
    echo 'c: cygwin'
    exit
}

[ "$#" -lt 1 ] && printUsage
[ $1 = l ] && (d=$(< /dev/stdin tr '\\' /); echo "/mnt/${d:0:1:l}/${d:2}")
[ $1 = w ] && (d=$(< /dev/stdin); echo "${d:5:1:u}:${${d:6}//\//\\\\}")
[ $1 = c ] && (d=$(< /dev/stdin tr '\\' /); echo "/cygdrive/${d:0:1:l}/${d:2}")
exit 0
