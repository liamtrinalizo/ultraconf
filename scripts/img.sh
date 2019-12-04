#!/bin/bash

source "`ueberzug library`"
ImageLayer 0< <(
    ImageLayer::add [identifier]="image"  \
                    [path]="$1" \
                    [x]="0" \
                    [y]="0" \
                    [height]="30" \
                    [scaler]="contain" 
    sleep 20
) &
