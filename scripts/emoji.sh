#!/bin/sh
#
# Prompt for emoji fuzzy search through fzy/fzf

$FUZZYFIND < "$XDG_DATA_HOME"/emoji_list | cut -d ' ' -f 1 | xclip -sel c -r
