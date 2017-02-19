#!/bin/bash
#
# Script to control the cmus status notification.
# It works through i3-gaps (or i3-wm) and dunst.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

STATUS="$(cmus-remote -Q 2>/dev/null | grep status)"

if [[ "$STATUS" == "status playing" ]]; then
	DISPLAY="Cmus: play"
elif [[ "$STATUS" == "status stopped" ]]; then
	DISPLAY="Cmus: stop"
fi

notify-send -t 2 "$DISPLAY"
