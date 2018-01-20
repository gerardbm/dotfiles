#!/usr/bin/env bash
#
# Script to toggle monitor modes.
# It works through i3wm and xrandr.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
	if [[ $output =~ ^LVDS.*$ ]]; then
		LVDS=$output
	fi
	if [[ $output =~ ^VGA.*$ ]]; then
		VGA=$output
	fi
done

if [ ! -f "/tmp/monitor_mode.dat" ] ; then
	monitor_mode="ALL"
else
	monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "ALL" ]; then
	monitor_mode="VGA"
	xrandr --output $LVDS --off --output $VGA --primary --auto
elif [ $monitor_mode = "VGA" ]; then
	monitor_mode="LVDS"
	xrandr --output $LVDS --primary --auto --output $VGA --off
elif [ $monitor_mode = "LVDS" ]; then
	monitor_mode="CLONES"
	xrandr --output $LVDS --primary --auto --output $VGA \
		--primary --auto --same-as $LVDS
else
	monitor_mode="ALL"
	xrandr --output $LVDS --primary --auto --output $VGA \
		--primary --auto --right-of $LVDS
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
