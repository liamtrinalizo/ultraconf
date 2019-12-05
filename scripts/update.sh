#/bin/sh


gitUpdate()
{
   pkg=$(echo $1 | cut -d / -f 5-6)
   echo -e "\e[32mUpdating $pkg \e[m"
   cd $1 
   git pull
}

#################################

echo -e "\e[32mUpdating portage\e[m"
eix-sync -q
emerge -aqvuDN --keep-going=y @world

echo -e "\e[32mUpdating Git repos\e[m"
gitUpdate /home/gok/pkg/sc-im/             
gitUpdate /home/gok/pkg/suckless/dmenu/    
gitUpdate /home/gok/pkg/suckless/dwm/      
gitUpdate /home/gok/pkg/suckless/slock/    
gitUpdate /home/gok/pkg/suckless/st/       
gitUpdate /home/gok/pkg/suckless/surf/     
