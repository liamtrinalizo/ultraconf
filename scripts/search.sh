#!/bin/sh

address1='duckduckgo.com/lite/?q='
address2='&t=h_&ia=web'

search="$(echo $@ | sed 's/ /+/g')"

surf $address1$search$address2
