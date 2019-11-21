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
gitUpdate ~/pkg/sc-im/             
gitUpdate ~/pkg/suckless/dmenu/    
gitUpdate ~/pkg/suckless/dwm/      
gitUpdate ~/pkg/suckless/slock/    
gitUpdate ~/pkg/suckless/slstatus/ 
gitUpdate ~/pkg/suckless/st/       
gitUpdate ~/pkg/suckless/surf/     
