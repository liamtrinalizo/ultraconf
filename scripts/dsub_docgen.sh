#!/bin/zsh

# Generate png image of D-Sub connector pining to stdout

print_usage() {
    echo -e "Usage: dsub_docgen.sh pins [docs] [-f] file
    pins: list of comma separated count of pins per line
    docs: list of comma separeted documentation for each pin
    -f:   create female connector (male is default)
    file: can be the filename of imagemagick stdout format (e.g. png:-)
    example, to create a male DE-9:
        dsub_docgen.sh 5,4 'TxD,RxD,DTR,DCD,DSR,RI,RTS,CTS,G''"
    exit
}

[ $# -lt 1 ] && print_usage

#TODO validate pins
pins=( $(tr ',' ' ' <<< $1) )
lines=$(sed 's/,/\n/g' <<< $1 | wc -l)
max=$(  sed 's/,/\n/g' <<< $1 | sort -r | head -n1)

shift
while getopts 'f' opt; do
    case "$opt" in
        f) female=1 ;;
    esac
done

docBorder=200
conBorder=20
conEdge=15
dot=16
[ "$female" = 1 ] && dotFill=gray || dotFill=black

dotDrawing=""
numDrawing=""
docDrawing=""
i=0

for line in $(seq $(($lines))); do
    for pin in $(seq 0 $((${pins[$line]} - 1))); do
        i=$(($i+1))
        dotDrawing=($dotDrawing -fill $dotFill -stroke black -strokewidth 2 -draw "circle \
            $(($docBorder + $conBorder - $dot/4 + 1.5*$line*$dot)),$(($conBorder + $conEdge + $dot/2 + 2*$pin*$dot + (($line - 1)%2)*$dot)) \
            $(($docBorder + $conBorder - $dot/4 + 1.5*$line*$dot)),$(($conBorder + $conEdge + $dot/2 + 2*$pin*$dot + $dot/2))")
            [ $female = 1 ] && num=$i || num=$((${pins[$line]} - $i))
        numDrawing=($numDrawing -stroke white -font courier-new -pointsize 10 -draw "text \
            $(($docBorder + $conBorder - $dot/4 - $(wc -m <<< $num)*$dot/8 + 1.5*$line*$dot)),$(($conBorder + $conEdge + 7*$dot/10 + 2*$pin*$dot + (($line - 1)%2)*$dot)) \"$num\"")
    done
done

convert -size 500x500 canvas:white \
    -fill white -stroke black -draw "rectangle $docBorder,0 $(($docBorder + 2*$conBorder + $dot + 1.5*$lines*$dot)),$((2*$max*$dot + 2*$conBorder + $conEdge))" \
    -fill gray  -stroke black -draw "polygon $(($docBorder + $conBorder)),$conBorder \
                                    $(($docBorder + $conBorder + $dot + 1.5*$lines*$dot)),$(($conBorder + $conEdge)) \
                                    $(($docBorder + $conBorder + $dot + 1.5*$lines*$dot)),$(($conBorder + $dot/2 + 2*$max*$dot)) \
                                    $(($docBorder + $conBorder)),$(($conBorder + $conEdge + $dot/2 + 2*$max*$dot)) \
                                    $(($docBorder + $conBorder)),$conBorder" \
    $dotDrawing \
    $numDrawing \
    ${@: -1}
