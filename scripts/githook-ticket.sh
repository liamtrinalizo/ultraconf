#!/bin/bash
FILE=$1
MESSAGE=$(cat $FILE)
[[ $TICKET == "[]" || "$MESSAGE" == "$TICKET"* ]] && exit 0;

echo "$TICKET $MESSAGE" > $FILE
