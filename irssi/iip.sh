#!/bin/bash
# Install irssi plugins
# Execute the script: `. ./iip.sh`

INITIALDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIRECTORY1="$HOME/.irssi/"
DIRECTORY2="$HOME/.irssi/scripts/"
DIRECTORY3="$HOME/.irssi/scripts/autorun/"

# Create the directories
if [ ! -d "$DIRECTORY1" ]; then
	mkdir "$DIRECTORY1"
	if [ ! -d "$DIRECTORY2" ]; then
		mkdir "$DIRECTORY2"
		if [ ! -d "$DIRECTORY3" ]; then
			mkdir "$DIRECTORY3"
		fi
	fi
fi

cd "$DIRECTORY2"

# Download the scripts
wget http://scripts.irssi.org/scripts/adv_windowlist.pl
wget http://scripts.irssi.org/scripts/autoaway.pl
wget http://scripts.irssi.org/scripts/buffer.pl
wget http://scripts.irssi.org/scripts/calc.pl
wget http://scripts.irssi.org/scripts/cleanpublic.pl
wget http://scripts.irssi.org/scripts/go2.pl
wget http://scripts.irssi.org/scripts/idletime.pl
wget http://scripts.irssi.org/scripts/openurl.pl
wget http://scripts.irssi.org/scripts/scriptassist.pl
wget http://scripts.irssi.org/scripts/sysinfo_dg.pl
wget http://scripts.irssi.org/scripts/tmux-nicklist-portable.pl
wget http://scripts.irssi.org/scripts/trackbar22.pl
wget http://scripts.irssi.org/scripts/usercount.pl
wget http://scripts.irssi.org/scripts/desktop-notify.pl

# Create the symlinks
for file in "$DIRECTORY2"*.pl; do
	ln -s "$file" "$DIRECTORY3"
done

cd "$INITIALDIR"
