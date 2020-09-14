#!/bin/sh

fzy < ~/scripts/emoji_list | cut -d ' ' -f 1 | xclip -r
