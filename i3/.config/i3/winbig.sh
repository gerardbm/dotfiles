#!/usr/bin/env bash

SCREEN_W=$(xrandr | grep '\Wprimary' | awk '{ print $4 }' | cut -d 'x' -f1)
SCREEN_H=$(xrandr | grep '\Wprimary' | awk '{ print $4 }' | cut -d 'x' -f2 | cut -d '+' -f1)
BORDERS=2
RIGHT=5
GAP=100

WIN_W=$(echo "$SCREEN_W-$GAP" | bc)
WIN_H=$(echo "$SCREEN_H-$GAP" | bc)
XPOS=$(echo "($GAP)/2" | bc)
YPOS=$(echo "($GAP)/2" | bc)

i3-msg floating enable\; resize set "$WIN_W" "$WIN_H"\; move window to position "$XPOS" "$YPOS"
