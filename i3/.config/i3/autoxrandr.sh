#!/usr/bin/env bash
#
# Script to select the monitor automatically.
# It works through i3wm and xrandr.
#
# Explanation:
# - If external monitor is plugged on, it will turn the LCD screen off.
# - To change the settings during an Xsession I use the tool lxrandr.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
	if [[ $output =~ ^LVDS.*$ ]]; then
		lvds=$output
	fi
done

for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
	if [[ ! $output =~ ^LVDS.*$ ]]; then
		xrandr --output $lvds --off --output $output --primary --auto
		feh --bg-fill ~/.wallpaper/distant-nebula-wallpaper-hd.jpg
	else
		xrandr --output $lvds --auto
		feh --bg-fill ~/.wallpaper/distant-nebula-wallpaper-hd.jpg
	fi
done
