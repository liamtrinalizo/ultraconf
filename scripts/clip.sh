#!/bin/bash

print_usage()
{
	echo "Usage clip.sh p | c [-o] [-i] [-s]"
}
print_help()
{
	print_usage
	echo "p primary"
	echo "s secondary"
	echo "-o output"
	echo "-i images"
	echo "-s screenshot select"
}

[ $# -lt 1 ] && print_usage

while getopts 'cpois' opt; do
	case "$opt" in
		p) PARAMS+=" -selection primary" ;;
		c) PARAMS+=" -selection clipboard" ;;
		o) PARAMS+=" -out" ;;
		i) PARAMS+=" -target image/png" ;;
		s)
			import png:- | xclip -selection clipboard -target image/png
			exit ;;
	esac
done

$SCREEN xclip $PARAMS
