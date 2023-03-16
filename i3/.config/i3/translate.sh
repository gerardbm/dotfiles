#!/usr/bin/env bash

printf "1. Spanish to English\n2. English to Spanish\n0. Quit\n\n"

while read -r -p "Input an option: " answer; do
	printf "\n"
	if [[ "$answer" == 1 ]] 2>/dev/null; then
		read -e -r -p "Words: " spa2eng
		printf "> \033[36m"
		trans es:en -brief "$spa2eng"
		printf "\033[0m\n"
	elif [[ "$answer" == 2 ]] 2>/dev/null; then
		read -e -r -p "Words: " eng2spa
		printf "> \033[36m"
		trans en:es -brief "$eng2spa"
		printf "\033[0m\n"
	elif [[ "$answer" == 0 ]] 2>/dev/null; then
		exit 1
	fi
done
