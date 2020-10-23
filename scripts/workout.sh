#!/bin/bash

TYPE="pull-ups"
SETS=5
REST=90
REPS="$(date +%Y-%m-%d)"
FOLDER=~/gdrive/perso/activities/sport/home_workout

print_usage()
{
	echo workout.sh -t type [-s sets] [-d rest_duration]
	exit
}

beep()
{
	mpv ~/medias/do-it.webm &> /dev/null
}

[ $# -lt 2 ] && print_usage

while getopts 't:s:d:' OPT; do
	case "$OPT" in
		t) TYPE=$OPTARG ;;
		s) SETS=$OPTARG ;;
		d) REST=$OPTARG ;;
	esac
done

for I in $(seq $SETS); do
	echo 
	echo -e "Workout \e[32m$TYPE\e[m set \e[31m$I/$SETS\e[m"
	echo -n "Write the number of reps done and press ENTER: "
	read SET_REPS
	REPS+=" $SET_REPS"

	# do no pause if last set
	[ $I -eq $SETS ] && break

	# pause count print
	for J in $(seq $REST -1 0); do
		echo -ne "Rest time $J\r"
		#[ $J -lt 3 ] && beep 
		sleep 1
	done
	beep
done

echo $REPS >> $FOLDER/$TYPE
drive push -no-prompt $FOLDER
