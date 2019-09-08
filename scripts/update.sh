#/bin/sh

echo Updating portage
eix-sync -q
emerge -aqvuDN @world

echo Updating git repo
git --git-dir=/home/gok/work/sc-im/.git    pull

git --git-dir=/home/gok/work/suckless/dmenu/.git    pull
git --git-dir=/home/gok/work/suckless/dwm/.git      pull
git --git-dir=/home/gok/work/suckless/slstatus/.git pull
git --git-dir=/home/gok/work/suckless/st/.git       pull
git --git-dir=/home/gok/work/suckless/surf/.git     pull
