#/home/gok/scripts/xmodmap.sh
~/scripts/screen.sh -s 3
xautolock -time 10 -locker slock &
xrdb ~/.config/X/.Xresources
#st -e sh -c '[ -z $TMUX ] && tmux new-session -s home' &
exec dwm
