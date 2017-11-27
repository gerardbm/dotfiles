#!/bin/bash
#
# Script to display the cmus volume.
# It works through i3-gaps (or i3-wm) and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

notify-send -t 2 "Cmus: volume = $(cmus-remote -Q | awk '/^set vol_left/ {print $3}')"
