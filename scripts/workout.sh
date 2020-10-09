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
	$(speaker-test -t sine -f 1000)& PID=$! ; sleep 0.2s ; kill -9 $PID
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
	echo -e "Workout \e[32m$TYPE\e[m set \e[31m$I\e[m"
	echo Write the number of reps done and press ENTER
	read SET_REPS
	REPS+=" $SET_REPS"
	for J in $(seq $REST -1 0); do
		echo -n "$J "
		#[ $J -lt 3 ] && beep 
		sleep 1
	done
	beep
done

echo $REPS >> $FOLDER/$TYPE
