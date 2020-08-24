#!/bin/sh

fzf < ~/scripts/emoji_list | cut -d ' ' -f 1 | xclip
