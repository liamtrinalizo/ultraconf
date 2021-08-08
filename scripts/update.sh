#!/usr/bin/env bash
#
# Update Gentoo official and self generated (brave-bin) pkg, then clean up dependencies, distfiles, show obsolete pkg

#set -Eeuo pipefail

updateBrave()
{
    persoRepo=/var/db/repos/perso/www-client/brave-bin
    braveRepo=https://github.com/brave/brave-browser/releases/latest
    remoteVer=$(curl -s $braveRepo | grep -Po '(?<=v)[0-9]+\.[0-9]+\.[0-9]+')
    localVer=$(INSTFORMAT='<version>' eix --pure-packages --format '<installedversions:INSTFORMAT>()\n' brave)
    archivName=$(curl -sL $braveRepo | grep 'href' | grep -oP "brave-browser-[a-z-]*(?=$remoteVer-linux-amd64.zip)")
    [ "$remoteVer" != "$localVer" ] && [ "$(printf '%s\n%s' "$remoteVer" "$localVer" | sort -V | head -n1)" = "$localVer" ] && echo "$localVer -> $remoteVer" && \
                                cp -f $persoRepo/brave-bin-{"$localVer","$remoteVer"}.ebuild && \
                                sed -i "s/brave-browser-[a-z-]*/$archivName/" $persoRepo/brave-bin-"$remoteVer".ebuild && \
                                ebuild $persoRepo/brave-bin-"$remoteVer".ebuild digest
}

#################################


echo -e "\e[36m--Check for brave-browser update--\e[m"
updateBrave
echo -e "\e[36m--Syncing portage--\e[m"
eix-sync -qa "$1"
echo -e "\e[36m--Emerging world--\e[m"
emerge -aqvuDN --keep-going=y --with-bdeps=y @world || exit 1
echo -e "\e[36m--Cleaning useless dependencies--\e[m"
emerge --depclean --quiet
echo -e "\e[36m--Cleaning obsolete distfiles--\e[m"
eclean-dist
echo -e "\e[36m--Testing for obsolete pkg--\e[m"
eix-test-obsolete

[ -f /tmp/halt_after_update ] && halt
