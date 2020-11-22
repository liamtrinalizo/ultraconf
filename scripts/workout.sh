#!/bin/sh

sets=5
rest=90
reps="$(date +%Y-%m-%d)"
alarm=~/medias/do-it.webm

print_usage()
{
    echo workout.sh -t file [-s sets] [-d rest_duration] [-a alarm]
    exit
}

beep()
{
    mpv $alarm &> /dev/null &
}

[ $# -lt 2 ] && print_usage
[ ! -f $alarm ] && echo "you're missing do-it file, for the default run:
    youtube-dl --format 251 --output /tmp/do-it_long.webm 'https://www.youtube.com/watch?v=ZXsQAXx_ao0' && \\
    mkdir ~/medias ; ffmpeg -i /tmp/do-it_long.webm -ss 00:00:02 -t 00:00:03 -acodec copy ~/medias/do-it.webm" && exit

while getopts 'a:d:s:t:' OPT; do
    case "$OPT" in
        a) alarm=$OPTARG ;;
        d) rest=$OPTARG ;;
        s) sets=$OPTARG ;;
        t) file=$OPTARG ;;
    esac
done

TYPE=$(basename $file)

for I in $(seq $sets); do
    echo 
    echo -e "Workout \e[32m$TYPE\e[m set \e[31m$I/$sets\e[m"
    echo -n "Write the number of reps done and press ENTER: "
    read set_reps
    reps+=" $set_reps"

    # do no pause if last set
    [ $I -eq $sets ] && break

    # pause count print
    for J in $(seq $rest -1 0); do
        echo -ne "              \r"
        echo -ne "Rest time $J\r"
        #[ $J -lt 3 ] && beep 
        sleep 1
    done
    beep
done

echo $reps >> $file
drive push -no-prompt $file
