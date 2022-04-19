#!/bin/zsh

printUsage() {
    echo 'Usage pathConv.sh w|l|c w|l|c'
    echo 'Converts stdin path from param 1 to param 2'
    echo 'w: window'
    echo 'l: linux'
    echo 'c: cygwin'
    exit
}

[ "$#" -lt 2 ] && printUsage
[ $1 = $2 ] && (echo "Error: Input and output can't be the same" && exit)
d=$(< /dev/stdin)

[ $1 = w -a $2 = l ] && echo "/mnt/${d:0:1:l}/${${d:3}//\\//}"
[ $1 = w -a $2 = c ] && echo "/cygdrive/${d:0:1:l}/${${d:3}//\\//}"
[ $1 = c -a $2 = l ] && echo "/mnt/${d:10:1:l}/${d:12}"
[ $1 = c -a $2 = w ] && echo "${d:10:1:u}:${${d:11}//\//\\\\}"
[ $1 = l -a $2 = c ] && echo "/cygdrive/${d:5:1:l}/${d:7}"
[ $1 = l -a $2 = w ] && echo "${d:5:1:u}:${${d:6}//\//\\\\}"
exit 0
