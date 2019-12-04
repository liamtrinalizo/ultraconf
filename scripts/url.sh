#!/bin/bash

REGEX='(((http|https|ftp|gopher)|mailto):(//)?[^ <>\"\t]*|(www|ftp)[0-9]?\\.[-a-z0-9.]+)[^ .,;\t\n\r<\">\\):]?[^, <>\"\t]*[^ .,;\t\n\r<\">\\):]'

grep -oP "$REGEX" <&0 | fzf
