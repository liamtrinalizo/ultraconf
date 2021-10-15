#!/bin/sh
#
# Create a horizontal scroll gif from image

IMAGE=$1

SIZEX=$(identify $IMAGE | awk '{ split($3,a,"x"); print a[1] }')
SIZEY=$(identify $IMAGE | awk '{ split($3,a,"x"); print a[2] }')
OFFX=$( identify $IMAGE | awk '{ split($4,a,"+"); print a[2] }')
OFFY=$( identify $IMAGE | awk '{ split($4,a,"+"); print a[3] }')

INC=6
SLICE=0

SLICECOUNT=$(( $SIZEX/$INC ))
for i in $(seq -w $SLICECOUNT ); do
    SLICE=$(($SLICE + INC))
    echo -en "$i/$SLICECOUNT  \r"
    magick convert \( $IMAGE -crop ${SIZEX}x${SIZEY}+$(($OFFX + $SLICE))+${OFFY} +repage \) \
                   \( $IMAGE -crop ${SLICE}x${SIZEY}+${OFFX}+${OFFY}             +repage \) \
                   +append frame$i.png
done

convert -delay 10 -loop 0 -dispose previous frame* frame.gif
rm frame*.png
mpv frame.gif --loop
