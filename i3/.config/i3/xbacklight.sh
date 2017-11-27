#!/bin/bash
#
# Script to display the brightness level.
# It works through i3-gaps (or i3-wm) and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

notify-send -t 2 "Brightness: $(xbacklight -get | awk '{printf "%.0f\n", $1}')%"
