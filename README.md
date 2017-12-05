# ~/dotfiles for Debian 9 and WMs

This repository uses **stow** hierarchy: clone it into `$HOME` and use `stow <package>` to create the symlinks automatically for each package (1). For more information about stow read its documentation (`man stow`).

Color schemes and neovim files are not into this repository. Find them into:

- Color schemes: [atomic](https://github.com/gerardbm/atomic)
- Neovim: [vimrc](https://github.com/gerardbm/vimrc)

Configuration files:

```
- Distro      : Debian
- WM          : i3-wm
- Menu        : rofi
- Shell       : zsh
- Terminal    : urxvt
- Multiplexer : tmux
- Font        : DejaVu Sans Mono for Powerline
- CVS         : git
- Editor      : neovim
- Files       : ranger
- IRC         : irssi
- Email       : mutt
- Music       : cmus
- Video       : mpv
- Images      : feh
- Reader      : apvlv
- Browser     : w3m
- Interface   : surfraw
```

## Setup

### Debian

Enable 'unstable' (sid) reposoitories and give them low preference:

`sudo nano /etc/apt/sources.list`

Add this two lines at the end:

```
deb http://ftp.es.debian.org/debian/ sid main contrib non-free
deb-src http://ftp.es.debian.org/debian/ sid main contrib non-free
```

Now change the preferences:

`sudo nano /etc/apt/preferences`

Add these lines:

```
Package: *
Pin: release a=stable
Pin-Priority: 900

Package: *
Pin: release a=unstable
Pin-Priority: 300
```

Finally, update:

`sudo apt-get update`

### i3-wm

Make sure you have installed the following libraries, which are a requirement to run my setup properly:

- pulseaudio-utils: to run pulse audio controls from the keyboard.
- xbacklight: make Fn keys work.
- feh: image viewer which can be used as background setter.
- lxappearance: customize look and feel (lxde-native).
- rofi: a window switcher, run dialog and dmenu replacement.
- compton: compositor based on xcompmgr with some improvements.
- volumeicon-alsa: volume icon for the system tray.
- dunst: a customizable and lightweight notification-daemon.
- libnotify-bin: a program to send desktop notifications.
- trash-cli: command-line tool to move files to the trash.
- lxpolkit: authorization manager for the desktop.
- FontAwesome.io: font to display icons in the i3bar.
- simplescreenrecorder: tool to record the desktop.
- translate-shell: tool to translate between languages.
- surfraw: a fast unix command line interface for WWW services.
- apvlv: PDF reader customizable with vim-like navigation.
- uuid: Universally Unique Identifier command line tool.
- mediainfo: command-line tool to display info about audio/video.
- udiskie: automounter for removable media (flash drives).
- transmission-cli: a bittorrent client from the command-line.
- wicd: Wired and wireless network connection manager.

Optional:
- arandr: can be useful to generate xrandr \*.sh scripts.
- redshift: adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less or reduce the risk for delayed sleep phase syndrome if you are working in front of the screen at night.
- libfm-pref-apps and exo-preferred-applications: the name is self-descriptive.

### Zsh

Install it from the repositories:

`sudo apt-get install zsh`

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) following the instructions from its page.

Via curl:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Via wget:

`sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`

Atomic theme must be downloaded from [Atomic repository](https://github.com/gerardbm/atomic).

Enable zsh-syntax-highlighting:

`git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.syntax`

Symlink the zsh settings:

`cd $HOME/dotfiles && stow zsh`

Change the current shell:

`$ chsh -s /usr/bin/zsh`

Log out and log in to see the new shell as default.

### URxvt

Install it from the repositories:

`sudo apt-get install rxvt-unicode-256color`

Symlink the rxvt-unicode settings:

`cd $HOME/dotfiles && stow X`

Atomic color scheme is already included.

Install the scripts `url-select` and `resize-font`:

`cd $HOME/dotfiles && stow urxvt`

To check for newer versions on Github:

The script `resize-font`: https://github.com/simmel/urxvt-resize-font
The script `url-select`: https://github.com/johntyree/urxvt-perls

Note: there is a script called `resize-font` into `johntyree/urxvt-perls` as well, but it's not updated.

### Tmux

Install it from the repositories:

`sudo apt-get -t sid install tmux`

Install the package `urlview`:

`sudo apt-get install urlview`

Symlink the tmux settings:

`cd $HOME/dotfiles && stow tmux`

### Git

Install it from the repositories:

`sudo apt-get install git`

Symlink the git settings:

`cd $HOME/dotfiles && stow git`

### Powerline

Clone the [Powerline fonts repository](https://github.com/powerline/fonts):

`git clone https://github.com/powerline/fonts`

And install it:

`cd fonts && ./install.sh`.

### Neovim

Install it from the repositories:

`sudo apt-get -t sid install neovim`

Make sure to have python3 enabled into Neovim:

`:CheckHealth`

Install the plugins manager [vim-plug](https://github.com/junegunn/vim-plug) following the instructions from its repository.

My neovim config files are into [vimrc](https://github.com/gerardbm/vimrc).

Install the plugins with the command:

`:PlugInstall`.

### Pylint

Install pip3 from the repositories:

`sudo apt-get install python3-pip`

Install pylint from pip3:

`sudo pip3 install pylint`

### Ranger

Install it from the repositories:

`sudo apt-get install ranger`

Create the folder first and then symlink the ranger settings:

`mkdir $HOME/.config/ranger && cd $HOME/dotfiles && stow ranger`

### Mutt

Install it from the repositories:

`sudo apt-get install mutt`

Copy the mutt settings (no symlink):

`cp $HOME/dotfiles/mutt/.muttrc $HOME/`

Install the atomic theme for mutt:

```sh
mkdir $HOME/.mutt
git clone https://github.com/gerardbm/atomic
cp atomic/mutt/atomic.muttrc $HOME/.mutt
```

### Cmus

Install it from the repositories:

`sudo apt-get install cmus`

Create the folder first and then symlink the cmus settings:

`mkdir $HOME/.config/cmus && cd $HOME/dotfiles && stow cmus`

Install the atomic theme for cmus:

```sh
git clone https://github.com/gerardbm/atomic
cp atomic/cmus/atomic.theme $HOME/.config/cmus
```

From cmus command line:

Set the colorscheme: `:colorscheme atomic`
Add the playlist: `:add $HOME/.config/cmus/playlist.pl`

### Irssi

Install it from the repositories:

`sudo apt-get install irssi`

Create the folder first and then copy (no symlink) the irssi settings:

`mkdir $HOME/.irssi && cp $HOME/dotfiles/irssi/.irssi/config $HOME/.irssi/`

Copy the script to install the plugins for the first time:

`cp $HOME/dotfiles/irssi/.irssi/config $HOME/.irssi/`

Run it:

`. ./iip.sh`

---

1. The command `stow <package>` will create a new directory if it's needed, and if the root directory doesn't exist, it also will add the new files to the dotfiles repository. Sometimes we don't want it (i.e. irssi logs, cmus search-command, or any temporary file auto generated). The solution for this is to create the destination directory before of using the stow command, for example: `mkdir ~/.irssi`, then `stow $HOME/dotfiles/irssi`.
