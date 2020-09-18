#!/usr/bin/env bash

SCREEN_W=$(xrandr | grep '\Wprimary' | awk '{ print $4 }' | cut -d 'x' -f1)
SCREEN_H=$(xrandr | grep '\Wprimary' | awk '{ print $4 }' | cut -d 'x' -f2 | cut -d '+' -f1)
GAP=25

WIN_PID=$(xdotool getactivewindow getwindowpid)

if [ ! -f /tmp/"$WIN_PID".dat ] ; then
	POSITION=0
else
	POSITION=$(cat /tmp/"$WIN_PID".dat)
fi

if [ "$POSITION" = 0 ]; then
	POSITION=1
	WIN_W=$(echo "($SCREEN_W)/2" | bc)
	WIN_H=$(echo "$SCREEN_H/4" | bc)
	XPOS=$(echo "($SCREEN_W)/4" | bc)
	YPOS=$(echo "$GAP" | bc)
elif [ "$POSITION" = 1 ]; then
	POSITION=0
	WIN_W=$(echo "($SCREEN_W)/2" | bc)
	WIN_H=$(echo "$SCREEN_H/4" | bc)
	XPOS=$(echo "($SCREEN_W)/4" | bc)
	YPOS=$(echo "$SCREEN_H-$WIN_H-$GAP" | bc)
fi

echo "${POSITION}" > /tmp/"$WIN_PID".dat

i3-msg floating enable\; resize set "$WIN_W" "$WIN_H"\; move window to position "$XPOS" "$YPOS"
