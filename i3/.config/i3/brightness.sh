#!/usr/bin/env bash
#
# Script to display the brightness level.
# It works through i3wm, notify-osd and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

CUR=$(brightnessctl get)
MAX=$(brightnessctl max)

notify-send -t 2000 "Brightness: level ${CUR}/${MAX}"
