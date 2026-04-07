#!/usr/bin/env bash
#
# Script to select the monitor automatically on Debian 13.
# This script is called via ~/.xsessionrc to ensure monitor
# configuration is set BEFORE i3wm starts.
#
# Explanation:
# - If an external monitor (VGA-1) is connected via dockstation,
#   it sets it as primary and turns off the internal LCD (LVDS-1).
# - This prevents i3wm from creating ghost workspaces or 
#   miscalculating wallpaper scaling across multiple outputs.
# - If no external monitor is found, it reverts to the laptop screen.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

outputs=$(xrandr | grep " connected" | awk '{ print $1 }')

internal=""
external=""

for output in $outputs; do
    if [[ $output == eDP* ]] || [[ $output == LVDS* ]]; then
        internal=$output
    else
        external=$output
    fi
done

if [[ -n "$external" ]] && [[ -n "$internal" ]]; then
    xrandr --output "$internal" --off --output "$external" --primary --auto
elif [[ -n "$internal" ]]; then
    xrandr --output "$internal" --primary --auto
fi

sleep 1
feh --bg-fill ~/.wallpaper/space-wallpaper-1920x1080-minimalist-universe-26331.jpg
