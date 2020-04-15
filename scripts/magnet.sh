#!/bin/bash

output=~/downloads
clipboard=$(xclip -o -selection clipboard | grep ^magnet)

aria2c -d "$output" --input-file <( echo "$clipboard" ) \
                    --bt-save-metadata=true \
                    --bt-metadata-only=true \
                    --disable-ipv6=true
