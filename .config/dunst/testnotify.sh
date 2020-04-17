#!/bin/bash

killall dunst
dunst &

# notify-send -u critical "example critical"
notify-send -u normal "example normal"
