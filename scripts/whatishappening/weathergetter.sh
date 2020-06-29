#!/bin/sh

exec > $1
echo "$(curl -s 'wttr.in/Plymouth?format=%t_%C_%w_%S_%s' | iconv -c -f utf-8 -t ascii | sed 's/_/\\n/g')"
