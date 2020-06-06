#!/usr/bin/env bash

SCREEN_W=$(xrandr | grep '\Wprimary' | awk '{ print $4 }' | cut -d 'x' -f1)
SCREEN_H=$(xrandr | grep '\Wprimary' | awk '{ print $4 }' | cut -d 'x' -f2 | cut -d '+' -f1)
BORDERS=2
RIGHT=5
GAP=100

if [ ! -f "/tmp/screenpos.dat" ] ; then
	POSITION=0
else
	POSITION=$(cat /tmp/screenpos.dat)
fi

if [ "$POSITION" = 0 ]; then
	POSITION=1
	WIN_W=$(echo "$SCREEN_W-$GAP" | bc)
	WIN_H=$(echo "$SCREEN_H-$GAP" | bc)
	XPOS=$(echo "($GAP)/2" | bc)
	YPOS=$(echo "($GAP)/2" | bc)
elif [ "$POSITION" = 1 ]; then
	POSITION=2
	WIN_W=300
	WIN_H=$(echo "$SCREEN_H-$GAP" | bc)
	XPOS=$(echo "$SCREEN_W-$WIN_W-($BORDERS*2)-$RIGHT" | bc)
	YPOS=$(echo "($GAP)/2" | bc)
elif [ "$POSITION" = 2 ]; then
	POSITION=0
	WIN_W=300
	WIN_H=300
	XPOS=$(echo "$SCREEN_W-$WIN_W-($BORDERS*2)-$RIGHT" | bc)
	YPOS=$(echo "($GAP)/2" | bc)
fi

echo "${POSITION}" > /tmp/screenpos.dat

i3-msg floating enable\; resize set "$WIN_W" "$WIN_H"\; move window to position "$XPOS" "$YPOS"
