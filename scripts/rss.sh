#!/bin/sh

#curl --silent --user-agent $(date) https://www.reddit.com/r/worldnews/.rss | \
#    xmllint --xpath "//*[local-name()='title']" - | \
#        sed 's/<[^>]*>//g' | sed 's/$/\n/' | iconv -c -f utf8 -t latin1

curl --silent 


