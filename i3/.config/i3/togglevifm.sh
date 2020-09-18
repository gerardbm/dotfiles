#!/usr/bin/env bash

ISVIFM=$(vifm --server-list | grep "floating" 2>/dev/null)

if ! [ "$ISVIFM" ]; then
	i3-msg exec "urxvt -name 'vifm-float' -e sh -c 'vifm --server-name floating'"
else
	vifm --remote -c ":q"
fi
