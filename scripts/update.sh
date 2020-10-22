#/bin/sh


gitUpdate()
{
   pkg=$(echo $1 | cut -d / -f 5-6)
   echo -e "\e[32mUpdating $pkg \e[m"
   cd $1 
   git pull
}

#################################

echo -e "\e[36m--Syncing portage--\e[m"
eix-sync -qa $1
echo -e "\e[36m--Emerging world--\e[m"
emerge -aqvuDN --keep-going=y --with-bdeps=y @world || exit 1
echo -e "\e[36m--Cleaning useless dependencies--\e[m"
emerge --depclean --quiet
echo -e "\e[36m--Cleaning obsolete distfiles--\e[m"
eclean-dist

#echo -e "\e[32mUpdating Git repos\e[m"
#gitUpdate /home/gok/pkg/suckless/dwm/      
#gitUpdate /home/gok/pkg/suckless/st/       
#gitUpdate /home/gok/pkg/suckless/surf/     
