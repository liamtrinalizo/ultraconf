#!/bin/sh

sed -E 's/ObjectId\(([0-9a-f"]+)\)/\1/g'
