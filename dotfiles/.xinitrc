#/home/gok/scripts/xmodmap.sh
~/scripts/screen.sh -s 3
xautolock -time 10 -locker slock &
xrdb ~/.config/X11/.Xresources
redshift &
numlockx
#st -e sh -c '[ -z $TMUX ] && tmux new-session -s home' &
exec dwm
