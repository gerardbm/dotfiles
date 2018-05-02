#!/bin/bash
# Script to install irssi plugins (subjective selection)
# --------------------------------------------------------------------------------
# Execute the script: ". ./iip.sh"

INITIAL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_SCRIPTS="$HOME/.irssi/scripts/"
DIR_AUTORUN="$HOME/.irssi/scripts/autorun/"

# Create the directories
mkdir -p "$DIR_AUTORUN"

cd "$DIR_SCRIPTS" || return

# Download the scripts
wget -c -q -nc http://scripts.irssi.org/scripts/adv_windowlist.pl
wget -c -q -nc http://scripts.irssi.org/scripts/buffer.pl
wget -c -q -nc http://scripts.irssi.org/scripts/cleanpublic.pl
wget -c -q -nc http://scripts.irssi.org/scripts/clones_scanner.pl
wget -c -q -nc http://scripts.irssi.org/scripts/go2.pl
wget -c -q -nc http://scripts.irssi.org/scripts/idletime.pl
wget -c -q -nc http://scripts.irssi.org/scripts/scriptassist.pl
wget -c -q -nc http://scripts.irssi.org/scripts/tmux-nicklist-portable.pl
wget -c -q -nc http://scripts.irssi.org/scripts/trackbar.pl
wget -c -q -nc http://scripts.irssi.org/scripts/usercount.pl
wget -c -q -nc https://scripts.irssi.org/scripts/sb_position.pl
wget -c -q -nc https://scripts.irssi.org/scripts/mouse.pl
wget -c -q -nc https://raw.githubusercontent.com/radiosilence/irssi-dunst/master/notify.pl
wget -c -q -nc https://raw.githubusercontent.com/shabble/irssi-scripts/master/vim-mode/vim_mode.pl

# Create the symlinks
for file in "$DIR_SCRIPTS"*.pl; do
	ln -sf "$file" "$DIR_AUTORUN"
done

cd "$INITIAL_DIR" || return
