#/bin/sh


gitUpdate()
{
   pkg=$(echo $1 | cut -d / -f 5-6)
   echo -e "\e[32mUpdating $pkg \e[m"
   cd $1 
   git pull
}

#################################

PERSO_REPO=/var/db/repos/perso
echo -e "\e[36m--Check for brave-broser update--\e[m"
REMOTE=$(curl -s https://github.com/brave/brave-browser/releases/latest | grep -Po '(?<=v)[0-9]+\.[0-9]+\.[0-9]+')
LOCAL=$(INSTFORMAT='<version>' eix --pure-packages --format '<installedversions:INSTFORMAT>()\n' brave)
[ -n $(curl -Ls https://github.com/brave/brave-browser/releases/latest | grep -Po '(?<=v)[0-9]+\.[0-9]+\.[0-9]+' | grep nightly) ] && NIGHTLY=-nightly

[ "$REMOTE" != "$LOCAL" ] && echo "$LOCAL -> $REMOTE" && cp $PERSO_REPO/www-client/brave-bin/brave-bin-{$LOCAL,$REMOTE}.ebuild && \
                            sed -i "s@/brave-browser-\$@/brave-browser$NIGHTLY-\$@" $PERSO_REPO/www-client/brave-bin/brave-bin-$REMOTE.ebuild && \
                            ebuild $PERSO_REPO/www-client/brave-bin/brave-bin-$REMOTE.ebuild digest

echo -e "\e[36m--Syncing portage--\e[m"
eix-sync -qa $1
echo -e "\e[36m--Emerging world--\e[m"
emerge -aqvuDN --keep-going=y --with-bdeps=y @world || exit 1
echo -e "\e[36m--Cleaning useless dependencies--\e[m"
emerge --depclean --quiet
echo -e "\e[36m--Cleaning obsolete distfiles--\e[m"
eclean-dist
