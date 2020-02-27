#!/bin/sh

TMUX='tmux -f /home/jean/.tmux.conf'

attach() {
    [ -n "${TMUX:-}" ] &&
        $TMUX switch-client -t $1 ||
        $TMUX attach-session -t $1
}

while getopts 'hw' OPTION; do
    case "$OPTION" in
        h)
            $TMUX new-session -d -s home
            $TMUX rename-window -t '=home:1' portage
            $TMUX send-keys  -t '=home:portage' 'sudo ~/scripts/update.sh -w'
            $TMUX new-window -dt '=home' -n mutt
            $TMUX send-keys  -t '=home:mutt' 'neomutt' Enter
            $TMUX new-window -dt '=home' -n music
            $TMUX split-window -h -t '=home:music'
            $TMUX send-keys -t '=home:music.0' 'alsamixer' Enter
            $TMUX send-keys -t '=home:music.1' '~/pkg/mps-youtube/mpsyt' Enter 
            attach 'home';;
        w)
            $TMUX new-session -d -s work
            attach 'work';;
    esac
done
