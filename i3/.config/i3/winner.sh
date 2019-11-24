#!/usr/bin/env bash

SCREENW=$(xrandr | grep '\Wconnected' | awk '{ print $4 }' | cut -d 'x' -f1)
SCREENH=$(xrandr | grep '\Wconnected' | awk '{ print $4 }' | cut -d 'x' -f2 | cut -d '+' -f1)
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
	WINDOWW=$(echo "$SCREENW-$GAP" | bc)
	WINDOWH=$(echo "$SCREENH-$GAP" | bc)
	XPOS=$(echo "($SCREENW-$WINDOWW)/2" | bc)
	YPOS=$(echo "($SCREENH-$WINDOWH)/2" | bc)
elif [ "$POSITION" = 1 ]; then
	POSITION=2
	WINDOWW=300
	WINDOWH=$(echo "$SCREENH-$GAP" | bc)
	XPOS=$(echo "$SCREENW-$WINDOWW-($BORDERS*2)-$RIGHT" | bc)
	YPOS=$(echo "($SCREENH-$WINDOWH)/2" | bc)
elif [ "$POSITION" = 2 ]; then
	POSITION=0
	WINDOWW=300
	WINDOWH=300
	XPOS=$(echo "$SCREENW-$WINDOWW-($BORDERS*2)-$RIGHT" | bc)
	YPOS=$(echo "($SCREENH-$GAP/2" | bc)
fi

echo "${POSITION}" > /tmp/screenpos.dat

i3-msg floating enable\; resize set "$WINDOWW" "$WINDOWH"\; move window to position "$XPOS" "$YPOS"
