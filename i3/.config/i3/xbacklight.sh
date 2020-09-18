#!/usr/bin/env bash
#
# Script to display the brightness level.
# It works through i3wm, notify-osd and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

GETVAL=$(xbacklight -get | awk '{printf "%.0f\n", $1}')

notify-send -t 2000 "Brightness information: $GETVAL%"
