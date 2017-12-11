# ~/dotfiles for Debian 9 and WMs

This repository uses **stow** hierarchy: clone it into `$HOME` and use `stow --no-folding <package>` to create the symlinks automatically for each package. For more information about stow read its documentation (`man stow`).

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
- Font        : Terminess Powerline
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

**Add the user to the sudoers file**

1. Enter to the root mode: `su -` (then, root password)

2. Edit the file `/etc/sudoers`:

`sudo visudo -f /etc/sudoers`

3. Add this line after `ROOT ALL (ALL:ALL) ALL`:

`<user> ALL (ALL:ALL) ALL`

**Disable autologin on LXDE**:

1. Edit the following file:

`sudo nano /etc/lightdm/lightdm.conf`

2. Find the line `#autologin-user=`.

3. Uncomment the line and add the user:

`autologin-user=<user>`

**Enable 'unstable' (sid) repositories**

1. Edit the file `/etc/apt/sources.list`

`sudo nano /etc/apt/sources.list`

2. Add this two lines at the end:

```
deb http://ftp.es.debian.org/debian/ sid main contrib non-free
deb-src http://ftp.es.debian.org/debian/ sid main contrib non-free
```

3. Change the preferences. Create the following file:

`sudo nano /etc/apt/preferences`

4. Add these lines:

```
Package: *
Pin: release a=stable
Pin-Priority: 900

Package: *
Pin: release a=unstable
Pin-Priority: 300
```

5. Finally, update:

`sudo apt-get update`

### i3-wm

Make sure you have installed the following libraries, which are a requirement to run my setup properly:

- apvlv: PDF reader customizable with vim-like navigation.
- compton: compositor based on xcompmgr with some improvements.
- dunst: a customizable and lightweight notification-daemon.
- feh: image viewer which can be used as background setter.
- FontAwesome.io: font to display icons in the i3bar.
- libnotify-bin: a program to send desktop notifications.
- lxappearance: customize look and feel (lxde-native).
- lxpolkit: authorization manager for the desktop.
- mediainfo: command-line tool to display info about audio/video.
- pulseaudio-utils: to run pulse audio controls from the keyboard.
- rofi: a window switcher, run dialog and dmenu replacement.
- simplescreenrecorder: tool to record the desktop.
- surfraw: a fast unix command line interface for WWW services.
- translate-shell: tool to translate between languages.
- transmission-cli: a bittorrent client from the command-line.
- trash-cli: command-line tool to move files to the trash.
- udiskie: automounter for removable media (flash drives).
- uuid: Universally Unique Identifier command line tool.
- volumeicon-alsa: volume icon for the system tray.
- wicd: Wired and wireless network connection manager.
- xbacklight: adjust backlight brightness using RandR extension.
- xsel: command-line tool to manipulate the X selection.

Optional:
- arandr: can be useful to generate xrandr \*.sh scripts.
- libfm-pref-apps and exo-preferred-applications: the name is self-descriptive.
- redshift: adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less or reduce the risk for delayed sleep phase syndrome if you are working in front of the screen at night.

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

`cd $HOME/dotfiles && stow --no-folding zsh`

Change the current shell:

`$ chsh -s /usr/bin/zsh`

Log out and log in to see the new shell as default.

### URxvt

Install it from the repositories:

`sudo apt-get install rxvt-unicode-256color`

Symlink the rxvt-unicode settings:

`cd $HOME/dotfiles && stow --no-folding X`

Atomic color scheme is already included.

Install the scripts: `url-select`, `resize-font` and `unichr`:

`cd $HOME/dotfiles && stow --no-folding urxvt`

To check for newer versions on Github:

- The script `resize-font`: https://github.com/simmel/urxvt-resize-font
- The script `url-select`: https://github.com/johntyree/urxvt-perls
- The script `unichr`: https://emergent.unpythonic.net/

Note: there is a script called `resize-font` into `johntyree/urxvt-perls` as well, but it's not updated.

### Tmux

Install it from the repositories:

`sudo apt-get -t sid install tmux`

Install the package `urlview`:

`sudo apt-get install urlview`

Symlink the tmux settings:

`cd $HOME/dotfiles && stow --no-folding tmux`

### Git

Install it from the repositories:

`sudo apt-get install git`

Symlink the git settings:

`cd $HOME/dotfiles && stow --no-folding git`

### Powerline

Clone the [Powerline fonts repository](https://github.com/powerline/fonts):

`git clone https://github.com/powerline/fonts`

And install it:

`cd fonts && ./install.sh`.

**Fontconfig**

«In some distributions (e.g. Debian), Terminess Powerline is ignored by default and must be explicitly allowed. A fontconfig file is provided which enables it. Copy this file from the fontconfig directory to your home folder under ~/.config/fontconfig/conf.d (create it if it doesn't exist) and re-run `fc-cache -vf`». Paragraph extracted from [Powerline](https://github.com/powerline/fonts).

### Neovim

Install it from the repositories:

`sudo apt-get -t sid install neovim`

Make sure to have python3 enabled into Neovim:

`:CheckHealth`

Install the plugins manager [vim-plug](https://github.com/junegunn/vim-plug) following the instructions from its repository.

My neovim config files are into [vimrc](https://github.com/gerardbm/vimrc).

Install the plugins with the command:

`:PlugInstall`.

### Vint

Install pip3 from the repositories:

`sudo apt-get install python3-pip`

Install pylint from pip3:

`sudo pip3 install vint`

### Pylint

Install pip3 from the repositories:

`sudo apt-get install python3-pip`

Install pylint from pip3:

`sudo pip3 install pylint`

### Nodejs, tern, jshint and csshint

Install them from the repositories:

`sudo apt-get install nodejs nodejs-legacy npm`

Install tern from npm:

```sh
sudo npm install -g tern
sudo npm install -g jshint
sudo npm install -g csshint
```

### W3m

Install it from the repositories:

`sudo apt-get install w3m`

Symlink the w3m settings:

`cd $HOME/dotfiles && stow --no-folding w3m`

### Ranger

Install it from the repositories:

`sudo apt-get install ranger`

Symlink the ranger settings:

`cd $HOME/dotfiles && stow --no-folding ranger`

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

Symlink the cmus settings:

`cd $HOME/dotfiles && stow --no-folding cmus`

Install the atomic theme for cmus:

```sh
git clone https://github.com/gerardbm/atomic
cp atomic/cmus/atomic.theme $HOME/.config/cmus
```

From cmus command line:

- Set the colorscheme: `:colorscheme atomic`
- Add the playlist: `:add $HOME/.config/cmus/playlist.pl`

### Irssi

Install it from the repositories:

`sudo apt-get install irssi`

Create the folder first and then copy (no symlink) the irssi settings:

`mkdir $HOME/.irssi && cp $HOME/dotfiles/irssi/.irssi/config $HOME/.irssi/`

Copy the script to install the plugins for the first time:

`cp $HOME/dotfiles/irssi/.irssi/config $HOME/.irssi/`

Run it:

`. ./iip.sh`

## Navigation

All shortcuts are vim-style (H, J, K, L + U, D) and they are configured to work without conflicts coherently between i3wm, tmux, (neo)vim et al. Explanation:

Horizontal navigation between WM workspaces, tmux windows and vim buffers only has two directions: left and right. In this case, a modifier in combination with H and L is coherent with vim-style.

Four directions navigation (e.g. i3wm windows, tmux panes, vim windows) needs four keys: for left, right, top and bottom. In this case, a modifier in combination with H, J, K, L is coherent with vim-style.

Vertical navigation to scroll up/down tmux windows, vim buffers or man pages has two directions but as well two speeds. In this case, a modifier in combination with J, K, U and D is coherent with vim-style.

These are the guidelines:
- Vim-like navigation.
- Make it intuitive.
- Reduce the keystrokes.
- Improve the workflow.

That said, it is very logical to have different modifier keys for every application:
- <kbd>Super</kbd> to control the windows manager (i3wm in my case).
- <kbd>Alt</kbd> to control the terminal multiplexer (tmux in my case).
- <kbd>Control</kbd> to control a specific program (neovim, w3m, irssi).

Tmux and neovim share <kbd>Alt</kbd>+{hjkl} to navigate between tmux panes and neovim windows; thanks to the plugin [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator).

Tmux uses a prefix key to separate all the shortcuts from the system. This idea is very convenient to avoid conflicts between shortcuts, however it implies too much keystrokes. This prefix also has some disadvantages, because it uses the default <kbd>Control</kbd>+<kbd>b</kbd>: you lose a useful readline command (backward character). Some people remap it to <kbd>Control</kbd>+<kbd>a</kbd> because it's easier to press, so they lose a useful readline command (go to the start of the line). Also, it is used into vim to increase a numeric value.

My recommendation is to use the <kbd>Alt</kbd> key to remap some tmux bind-keys (using the `-n` flag), skipping the prefix for the most used actions (navigation, resize).

The result:

```
| ACTION        | I3WM          | TMUX         | NEOVIM       |
| $mod key      | Super         | Alt          | Control      |
| ------------- | ------------- | ------------ | ------------ |
|               | (workspaces)  | (windows)    | (buffers)    |
| Next          | Ctrl+Super+l  | Ctrl+Alt+l   | Ctrl+l       |
| Previous      | Ctrl+Super+h  | Ctrl+Alt+h   | Ctrl+h       |
| Last          | Ctrl+Super+p  | Ctrl+Alt+p   | Ctrl+p Enter |
| ------------- | ------------- | ------------ | ------------ |
|               |               | (windows)    | (buffers)    |
| Up: 1 line    |               | Alt+v k      | Ctrl+k       |
| Down: 1 line  |               | Alt+v j      | Ctrl+j       |
| Up: ½ page    |               | Alt+v u      | Ctrl+u       |
| Down: ½ page  |               | Alt+v d      | Ctrl+d       |
| ------------- | ------------- | ------------ | ------------ |
|               | (windows)     | (panes)      | (windows)    |
| Focus left    | Super+h       | Alt+h        | Alt+h        |
| Focus right   | Super+l       | Alt+l        | Alt+l        |
| Focus top     | Super+k       | Alt+k        | Alt+k        |
| Focus bottom  | Super+j       | Alt+j        | Alt+j        |
| Focus last    |               |              | Ctrl+w p     |
| Focus next    |               |              | Ctrl+w l     |
| Focus prev    |               |              | Ctrl+w h     |
| Only active   |               |              | Ctrl+w o     |
| Kill active   | Super+Enter   | Alt+Enter    | Ctrl+w Enter |
| New terminal  | Ctrl+Super+n  | Ctrl+Alt+n   | Ctrl+t       |
| ------------- | ------------- | ------------ | ------------ |
|               | (windows)     | (panes)      | (windows)    |
| Fullscreen    | Super+f       | Alt+f        | Ctrl+f       |
| Resize left   | Super+r h     | Alt+Ctrl+ h  | >            |
| Resize right  | Super+r l     | Alt+Ctrl+ l  | <            |
| Resize top    | Super+r k     | Alt+Ctrl+ k  | -            |
| Resize bottom | Super+r j     | Alt+Ctrl+ j  | +            |
| Split v       | Super+.       | Alt+.        | Ctrl+w .     |
| Split h       | Super+-       | Alt+-        | Ctrl+w -     |
| ------------- | ------------- | ------------ | ------------ |
| [Move to...]  | (windows)     | (panes)      | (windows)    |
| - left        | Super+H       |              | Ctrl+w H     |
| - right       | Super+L       |              | Ctrl+w L     |
| - top         | Super+K       | Alt+K        | Ctrl+w K     |
| - bottom      | Super+J       | Alt+J        | Ctrl+w J     |
| - last        | Super+Shift+p |              |              |
| - X workspace | Super+Shift+X |              |              |
```

Command line tools:

```
| ACTION        | irssi         | w3m          | man          |
| ------------- | ------------- | ------------ | ------------ |
|               | (windows) (1) | (tabs)       | (pages)      |
| Next          | Ctrl+j        | Ctrl+l       |              |
| Previous      | Ctrl+k        | Ctrl+h       |              |
| ------------- | ------------- | ------------ | ------------ |
|               | (buffers)     | (websites)   | (buffers)    |
| Up: 1 line    |               | k            | k            |
| Down: 1 line  |               | j            | j            |
| Up: ½ page    | Alt+u, Alt+p  | u            | u            |
| Down: ½ page  | Alt+d, Alt+n  | d            | d            |
|               |        (2)    |              |              |

---

| ACTION        | ranger        | cmus         | mutt         |
| ------------- | ------------- | ------------ | ------------ |
|               | (files, dirs) | (playlists)  | (emails)     |
| Up: 1 line    | k             | k            | k            |
| Down: 1 line  | j             | j            | j            |
| Custom left   | h, fold       | h, seek -5   |              |
| Custom right  | l, unfold     | l, seek +5   |              |

---
1. Irssi windows are displayed in a column (vertical) according to my custom setup.
2. Alt+p and Alt+n are configured by default.
```

Multimedia tools:

```
| ACTION        | apvlv         | mpv          | feh          |
| ------------- | ------------- | ------------ | ------------ |
|               | (pdfs)        | (videos)     | (images)     |
| Up            | k             | k            | k            |
| Down          | j             | j            | j            |
| Left          | h             | h            | h            |
| Right         | l             | l            | l            |
| Zoom in       | z             | z            | z            |
| Zoom out      | Z             | Z            | Z            |
| Up: ½ page    | u             |              |              |
| Down: ½ page  | d             |              |              |
```

Yes, a mouse would make the life easier. And boring ;-)
