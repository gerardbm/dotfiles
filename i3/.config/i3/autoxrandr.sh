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

internal="LVDS-1"
external="VGA-1"

if xrandr | grep -q "$external connected"; then
    xrandr --output "$external" --primary --mode 1920x1080 \
      --pos 0x0 --rotate normal --output "$internal" --off
else
    xrandr --output "$internal" --primary --mode 1366x768 \
      --pos 0x0 --rotate normal --output "$external" --off
fi

feh --bg-fill \
  ~/.wallpaper/space-wallpaper-1920x1080-minimalist-universe-26331.jpg
