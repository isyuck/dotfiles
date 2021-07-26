#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR="eDP1" polybar --reload bar0 &
MONITOR="HDMI1" polybar --reload bar1 &
