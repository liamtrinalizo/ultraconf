#!/bin/bash

outdir=~/downloads
clipboard=$(xclip -o -selection clipboard | grep ^magnet)

output=$(aria2c -d "$outdir" --input-file <( echo "$clipboard" ) \
                    --bt-save-metadata=true \
                    --bt-metadata-only=true \
                    --disable-ipv6=true)

# Rename to verbose name
echo $(echo "$output" | grep -o '[a-z0-9/]\+.torrent') '->' $outdir/$(echo "$output" | grep -m1 -oP '(?<=METADATA]).+' | tr 'A-Z' 'a-z' | tr ' ' '_').torrent
mv   $(echo "$output" | grep -o '[a-z0-9/]\+.torrent')      $outdir/$(echo "$output" | grep -m1 -oP '(?<=METADATA]).+' | tr 'A-Z' 'a-z' | tr ' ' '_').torrent
