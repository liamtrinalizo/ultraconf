/home/gok/scripts/xmodmap.sh
/home/gok/scripts/screen.sh -s 2
xautolock -time 10 -locker slock &
xrdb ~/.config/X11/Xresources
st -e sh -c '[ -z $TMUX ] && tmux new-session -s home' &
exec dwm
