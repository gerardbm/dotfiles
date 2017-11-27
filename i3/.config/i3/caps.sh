#!/bin/bash
#
# Script to display the Caps Lock status.
# It works through i3-gaps (or i3-wm) and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

STATUS="$(xset -q | grep 'Caps Lock: *off')"

if [ -z "$STATUS" ]; then
	notify-send -t 2 "Caps On"
else
	notify-send -t 2 "Caps Off"
fi
