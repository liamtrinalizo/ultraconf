#!/bin/sh

sed -e 's/ISODate(//g' \
	-e 's/ObjectId(//g' \
	-e 's/)//g'

