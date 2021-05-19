#!/bin/sh
#
# Prompt for emoji fuzzy search through fzy

fzy < "$XDG_DATA_HOME"/emoji_list | cut -d ' ' -f 1 | xclip -sel c -r
