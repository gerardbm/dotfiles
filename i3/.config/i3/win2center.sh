#!/usr/bin/env bash

SCREENW=$(xrandr | grep '\Wconnected' | awk '{ print $4 }' | cut -d 'x' -f1)
SCREENH=$(xrandr | grep '\Wconnected' | awk '{ print $4 }' | cut -d 'x' -f2 | cut -d '+' -f1)

WINDOWW=$(echo "$SCREENW-100" | bc)
WINDOWH=$(echo "$SCREENH-100" | bc)
XPOS=$(echo "($SCREENW-$WINDOWW)/2" | bc)
YPOS=$(echo "($SCREENH-$WINDOWH)/2" | bc)

i3-msg floating enable\; resize set "$WINDOWW" "$WINDOWH"\; move window to position "$XPOS" "$YPOS"
