# ~/dotfiles

This repository uses **stow** hierarchy: clone it into `$HOME` and use `stow <package>` to create the symlinks automatically for each package (1). For more information about stow read its documentation (`man stow`).

Color schemes and vim/neovim files are not into this repository. Find them into:

- Color schemes: [atomic](https://github.com/gerardbm/atomic)
- Vim and Neovim: [vimrc](https://github.com/gerardbm/vimrc)

Configuration files:

```
- WM          : i3-gaps
- Menu        : rofi
- Shell       : zsh
- Terminal    : urxvt
- Multiplexer : tmux
- Font        : powerline
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

### i3-gaps

Install i3-gaps instead of i3-wm. Make sure you have installed the following libraries, which are a requirement to run my setup properly:

- pactl: to run pulse audio controls from the keyboard.
- xbacklight: make Fn keys work.
- feh: image viewer which can be used as background setter.
- lxappearance: customize look and feel (lxde-native).
- rofi: a window switcher, run dialog and dmenu replacement.
- transset-df: transparency for windows.
- compton: compositor based on xcompmgr with some improvements.
- network-manager-applet: network icon for the system tray.
- volumeicon: volume icon for the system tray.
- morc_menu: categorized desktop application menu.
- dunst: a customizable and lightweight notification-daemon.
- trash-cli: command-line tool to move files to the trash.
- polkit-gnome: authorization manager for the desktop.
- FontAwesome.io: font to display icons in the i3bar.
- simplescreenrecorder: tool to record the desktop.
- translate-shell: tool to translate between languages.
- surfraw: a fast unix command line interface for WWW services.
- apvlv: PDF reader customizable with vim-like navigation.
- uuid: Universally Unique Identifier command line tool.

Optional:
- arandr: can be useful to generate xrandr \*.sh scripts.
- redshift: adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less or reduce the risk for delayed sleep phase syndrome if you are working in front of the screen at night.
- libfm-pref-apps and exo-preferred-applications: the name is self-descriptive.

### Zsh

First, install it from the repositories; then you need to change your current shell (bash is the default, normally):

`$ chsh -s /usr/bin/zsh`

Now log out and log in to see the new shell as default. Copy the file `.zshrc` to your `$HOME` directory. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) following the instructions from its page.

Via curl:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Via wget:

`sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`

Atomic theme must be downloaded from [Atomic repository](https://github.com/gerardbm/atomic).

Enable zsh-syntax-highlighting:

`git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.syntax`

It's already sourced at the end of the file `.zshrc`:

`source $HOME/.syntax/zsh-syntax-highlighting.zsh`

In fact, it can be installed through yaourt (Arch-based) and from the official repositories on Debian 9. However, for each case the plugin is installed in different paths, so I prefer to download the last version to my `$HOME` directory to keep the portability.

### URxvt

Install the package `rxvt-unicode-256color` from the repositories and copy the file `.Xresources` to `$HOME` directory. It already includes the Atomic color scheme with ten key bindings (from <C-1> to <C-0>) to switch between modes.

To install the scripts `url-select` and `resize-font` copy them to the folder `$HOME/.urxvt/ext/` or check for newer versions on Github.

The script `resize-font`: https://github.com/simmel/urxvt-resize-font
The script `url-select`: https://github.com/johntyree/urxvt-perls

Note: there is a script called `resize-font` into `johntyree/urxvt-perls` as well, but it's not updated.

### Tmux

Install it from the repositories and install the package `urlview`. No need for additional plugins, excepting it's configured to open w3m browser (install it or change it). Finally, copy the file `.tmux.conf` and paste to `$HOME` directory.

### Powerline

Clone or download the [Powerline fonts repository](https://github.com/powerline/fonts) and run the script `./install.sh`.

### Git

Install git from the repositories and copy the alias from the file `.gitconfig`.

### Vim and neovim

Install vim and neovim from the repositories.

On Debian 'stable' or 'testing', vim and neovim should be installed from 'unstable' (use apt pinning or aptitude).

For neovim, make sure to have python3 enabled into it (`:echo has('python3')`, if it returns 1 it's ok, or use `:CheckHealth`). If it returns 0, then run `sudo pip3 install --upgrade neovim`, it's a requirement for some plugins*. If it's not working, try `sudo pip3 install --upgrade --force-reinstall neovim`. (Installing it from Debian 'unstable' it already has python3 enabled).

Install the plugins manager [vim-plug](https://github.com/junegunn/vim-plug) following the instructions from its repository.

My vim config files are in my [vimrc](https://github.com/gerardbm/vimrc) repository. Copy the file `vimrc` to `$HOME/.vimrc`, the file `gvimrc` to `$HOME/.gvimrc` and the file `init.vim` to `$HOME/.config/nvim/init.vim`.

Open vim and neovim and run the command `:PlugInstall`.

Some plugins will need to install external tools: tern, pylint3, golang...

### Ranger

Install it from the repositories and copy the files `rc.conf` and `rifle.conf` to ranger directory: `$HOME/.config/ranger/`.

### Mutt

Install mutt from the repositories, copy the file `.muttrc` to `$HOME` directory and modify the settings for the desired email. It is configured to work with gmail accounts. Then copy the theme called `atomic.muttrc` from my [Atomic repository](https://github.com/gerardbm/atomic) to mutt folder: `$HOME/.mutt/atomic.muttrc`.

### Cmus

Install cmus from the repositories, copy the theme from my [Atomic repository](https://github.com/gerardbm/atomic) repository to cmus folder: `$HOME/.config/cmus/atomic.theme`.

Set the colorscheme: `:colorscheme atomic`
Add the playlist: `:add playlist.pl`

### Irssi

Install irssi from the repositories and run the script `irssi/iip.sh`: it will install the updated plugins and will create the symlinks automatically:

`. ./iip.sh`

Copy the file `irssi/config` to irssi folder: `$HOME/.irssi/config`, then change nicknames, passwords, servers, channels, etc.

---

1. The command `stow <package>` will create a new directory if it's needed, and if the root directory doesn't exist, it also will add the new files to the dotfiles repository. Sometimes we don't want it (i.e. irssi logs, cmus search-command, or any temporary file autogenerated). The solution for this is to create the destination directory before using the stow command, for example: `mkdir ~/.irssi`, then `stow $HOME/dotfiles/irssi`.
