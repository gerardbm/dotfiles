#!/usr/bin/env bash
#
# Script to display the cmus status (playing/stopped).
# It works through i3wm, notify-osd and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

if ! pgrep -x "cmus" > /dev/null
then
	DISPLAY="Cmus is not running"
else
	cmus-remote -u
fi

STATUS="$(cmus-remote -Q 2>/dev/null | grep -i status)"

if [ "$STATUS" = "status playing" ]; then
	DISPLAY="Cmus: play"
elif [ "$STATUS" = "status stopped" ]; then
	DISPLAY="Cmus: stop"
elif [ "$STATUS" = "status paused" ]; then
	DISPLAY="Cmus: pause"
fi

notify-send -t 2000 "$DISPLAY"
