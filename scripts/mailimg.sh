#!/bin/sh

print_usage() { echo "./mailimg.sh IMG RECIPIENT [SUBJECT]"; }

[ $# -lt 2 ] && print_usage && exit
[ -z "$3" ] && subject=lol || subject=$3

neomutt -e "set content_type=text/html" -s $subject -a $1 -- $2  <<< "<img src="cid:$1" />"
