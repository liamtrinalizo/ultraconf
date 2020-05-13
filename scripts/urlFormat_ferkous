#!/bin/sh
while true; do
  echo -e "\n\nEnter a URL"
  read -r URL_I
  URL_I=$(echo -E "${URL_I}" | sed -e 's/\"//g')
  echo -E "${URL_F}"
  URL_F=$(echo -E "${URL_I}" | sed -e 's/[A-Z a-z]\:\\//g')
  echo -E "${URL_F}"
  URL_F=$(echo -E "${URL_F}" | sed 's/\\/\\\\/g')
  echo -E "$URL_F"
  URL_F=$(echo -E "[${URL_I}|file:///\\\\DCFILE01\\\\EW_Projekte\$\\\\${URL_F}]")  

  echo -E "$URL_F"
  echo -nE "$URL_F" > /dev/clipboard


done
