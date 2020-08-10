#!/usr/bin/env bash
#
# Script to rotate the screen.
# It works through i3wm and xrandr.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

OUTPUT=$(xrandr | grep '\Wconnected' | awk '{ print $1 }')
xrandr --output "$OUTPUT" --rotate "$1"
notify-send -t 2000 "$OUTPUT → Screen rotation: $1"
