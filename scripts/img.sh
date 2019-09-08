#!/bin/bash

source "`ueberzug library`"
ImageLayer 0< <(
    ImageLayer::add    [identifier]="image" [x]="$2" [y]="$3" [path]="$1"
    read
    ImageLayer::remove [identifier]="image"
)
