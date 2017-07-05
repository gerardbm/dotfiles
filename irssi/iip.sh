#!/bin/bash
# Script to install irssi plugins (subjective selection)
# --------------------------------------------------------------------------------
# Execute the script: ". ./iip.sh"

INITIALDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIRECTORY1="$HOME/.irssi/"
DIRECTORY2="$HOME/.irssi/scripts/"
DIRECTORY3="$HOME/.irssi/scripts/autorun/"

# Create the directories
if [ ! -d "$DIRECTORY1" ]; then mkdir "$DIRECTORY1"; fi
if [ ! -d "$DIRECTORY2" ]; then mkdir "$DIRECTORY2"; fi
if [ ! -d "$DIRECTORY3" ]; then mkdir "$DIRECTORY3"; fi

cd "$DIRECTORY2" || return

# Download the scripts
wget -c -q -nc http://scripts.irssi.org/scripts/adv_windowlist.pl
wget -c -q -nc http://scripts.irssi.org/scripts/buffer.pl
wget -c -q -nc http://scripts.irssi.org/scripts/cleanpublic.pl
wget -c -q -nc http://scripts.irssi.org/scripts/clones_scanner.pl
wget -c -q -nc http://scripts.irssi.org/scripts/go2.pl
wget -c -q -nc http://scripts.irssi.org/scripts/idletime.pl
wget -c -q -nc http://scripts.irssi.org/scripts/scriptassist.pl
wget -c -q -nc http://scripts.irssi.org/scripts/tmux-nicklist-portable.pl
wget -c -q -nc http://scripts.irssi.org/scripts/trackbar22.pl
wget -c -q -nc http://scripts.irssi.org/scripts/usercount.pl
wget -c -q -nc https://scripts.irssi.org/scripts/sb_position.pl
wget -c -q -nc https://raw.githubusercontent.com/radiosilence/irssi-dunst/master/notify.pl
wget -c -q -nc https://raw.githubusercontent.com/shabble/irssi-scripts/master/vim-mode/vim_mode.pl

# Create the symlinks
for file in "$DIRECTORY2"*.pl; do
	ln -sf "$file" "$DIRECTORY3"
done

cd "$INITIALDIR" || return
