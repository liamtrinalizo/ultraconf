#!/bin/sh
#
# Prompt for digraph search through dmenu

dmenu -i -l 10 < "$XDG_DATA_HOME"/digraph_list | cut -d ' ' -f 1 | xclip -r
