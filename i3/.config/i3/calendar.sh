#!/usr/bin/env bash
#
# Script to display a calendar.
# It works through ncal.
#
# Full configuration is available in this repository:
# URL: https://github.com/gerardbm/dotfiles

urxvt -name 'cal' \
	-b 30 \
	-e bash -c 'ncal -Mb3 | less'
