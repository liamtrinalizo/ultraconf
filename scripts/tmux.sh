#!/bin/sh

attach() {
    [ -n "${TMUX:-}" ] &&
        tmux switch-client -t $1 ||
        tmux attach-session -t $1
}

while getopts 'hw' OPTION; do
    case "$OPTION" in
        h)
            tmux new-session -d -s home
            tmux new-window -dt '=home' -n portage
            tmux send-keys  -t '=home:portage' 'su root && ~/scripts/update.sh'
            tmux new-window -dt '=home' -n mutt
            tmux send-keys  -t '=home:mutt' 'neomutt' Enter
            tmux new-window -dt '=home' -n music
            tmux split-window -h -t '=home:music'
            tmux send-keys -t '=home:music.0' 'alsamixer' Enter
            tmux send-keys -t '=home:music.1' 'mpsyt' Enter '..programming music' Enter '1' Enter '1- -a' Enter
            attach 'home';;
        w)
            tmux new-session -d -s work
            attach 'work';;
    esac
done
