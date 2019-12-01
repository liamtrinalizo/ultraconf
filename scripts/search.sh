#!/bin/sh

address1='duckduckgo.com/lite/?q='
address2='&t=h_&ia=web'
search="$(echo $@ | sed 's/ /+/g')"
w3m $address1$search$address2
