#!/bin/bash

killall dunst
dunst &

#notify-send -u critical "example critical"
notify-send -t 2000 -u low "reloaded dunst"
