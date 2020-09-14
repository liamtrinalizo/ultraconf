~/scripts/screen.sh -s $(xrandr | grep -w connected | wc -l)
xautolock -time 10 -locker slock &
xrdb ~/.config/X11/.Xresources
xmodmap ~/.config/X11/xmodmap
redshift &
numlockx
xset r rate 280 40
st -e sh -c '[ -z $TMUX ] && tmux new-session -s home' &
[ -x $(command -v synclient) ] && synclient TouchpadOff=1
exec dwm
