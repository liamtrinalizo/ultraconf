/home/gok/scripts/xmodmap.sh
/home/gok/scripts/screen.sh -s 2
slstatus &
xautolock -time 10 -locker slock &
exec dwm
