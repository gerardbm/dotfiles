#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
# Scheme switcher for terminal
#
# DESCRIPTION:
# This script alternates two color schemes in terminal depending on the hour of the day.
#
# README FIRST:
# You need Konsole terminal (KDE) or Yakuake (based on Konsole).
# Unfortunately, 'konsoleprofile' only works in one tab.
# Fortunately, we use tabs (windows) through tmux! \o/
#
# URL: https://github.com/gerardbm/dotfiles

if [[ "$COLORTERM" = '1' ]]; then

	color-scheme() {
		arg="${1:-colors=Atomic}"
		if [[ -z "$TMUX" ]];
		then
			konsoleprofile "$arg"
		else
			printf '\033Ptmux;\033\033]50;%s\007\033\\' "$arg"
		fi
	}

	function switch-to-default() {
		color-scheme "colors=Atomic"
	}

	function switch-to-night() {
		color-scheme "colors=Atomic Night"
	}

	function scheme-switcher() {
		if [[ ($(date +%H) -ge 8) && ($(date +%H) -lt 20) ]]
		then
			switch-to-default
		else
			switch-to-night
		fi
	}

	export KONSOLE_PROFILE_NAME='Atomic profile'

	autoload -Uz add-zsh-hook
	add-zsh-hook precmd scheme-switcher

fi
