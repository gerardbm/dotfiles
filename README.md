# Dotfiles

- WM: i3-gaps
- Shell: zsh
- Terminal: URxvt, XTerm
- Multiplexer: tmux
- Font: Powerline
- Control version: git
- Editor: vim, neovim
- Files: vimf, ranger
- Email: mutt
- Music: cmus
- IRC: irssi

Themes and color schemes:
**Atomic** for zsh, URxvt, tmux, vim, irssi, cmus.

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

Optional:
- arandr: can be useful to generate xrandr \*.sh scripts.
- redshift: adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less or reduce the risk for delayed sleep phase syndrome if you are working in front of the screen at night.
- libfm-pref-apps and exo-preferred-applications: the name is self-descriptive.

### Zsh

First, install it from the repositories; then you need to change your current shell (bash is the default, normally). To list all installed shells, run:

`$ chsh -l`

And set one as default for your user:

`$ chsh -s /usr/bin/zsh`

Now log out and log in to see the new shell as default. Copy the file `.zshrc` to your `$HOME` directory. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) following the instructions from its page. Atomic theme must be downloaded from [Atomic repository](https://github.com/gerardbm/atomic).

### URxvt

Install it from the repositories and copy the file `.Xresources` to your `$HOME` directory. It already includes the Atomic color scheme.

### Tmux

Install it from the repositories and install the package `urlview`. No need for additional plugins. Finally, copy the file `.tmux.conf` and paste to your `$HOME` directory.

### Powerline

Clone or download the [Powerline fonts repository](https://github.com/powerline/fonts) and run the script `./install.sh`.

### Git

Install git from the repositories, configure your account and copy the alias from the file `.gitconfig`.

### Vim and neovim

Install vim, gvim and neovim from the repositories.

For neovim, make sure you have python3 installed, then run `sudo pip3 install --upgrade neovim`, it's a requirement for some plugins, as *deoplete*. If it's not working, try `sudo pip3 install --upgrade --force-reinstall neovim`.

Install the plugins manager [vim-plug](https://github.com/junegunn/vim-plug) following the instructions from its repository.

My vim config files are in my [vimrc](https://github.com/gerardbm/vimrc) repository. Copy the file `vimrc` to `$HOME/.vimrc`, the file `gvimrc` to `$HOME/.gvimrc` and the file `init.vim` to `$HOME/.config/nvim/init.vim`.

One of the plugins requires to have php installed. Install it from the repositories.

Open vim and neovim and run the command `:PlugInstall`.

From my [Atomic repository](https://github.com/gerardbm/atomic), copy the file `vim/atomic.vim` to your vim/neovim folder: `../colors/atomic.vim`, and the file `vim-airline/atomic.vim` to your vim-airline-themes folder: `../plugged/vim-airline-themes/autoload/airline/themes/atomic.vim`.

### Vimf

Install it from the repositories.

### Ranger

Install it from the repositories. After startup, ranger creates the directory `~/.config/ranger`. To copy the default configuration to this directory run the following command:

`
ranger --copy-config=all
`

### Mutt

Install mutt from the repositories, copy the file `.muttrc` to your `$HOME` directory and modify the settings for your email. It is configured to work with gmail accounts. Then copy the theme called `atomic.muttrc` from my [Atomic repository](https://github.com/gerardbm/atomic) to your mutt folder: `$HOME/.mutt/atomic.muttrc`.

### Cmus

Install cmus from the repositories, copy the theme from my [Atomic repository](https://github.com/gerardbm/atomic) to your cmus folder: `$HOME/.cmus/atomic.theme`, also copy the file `playlist.pl` to the same folder.

### Irssi

Install irssi from the repositories and install the following dependencies (some plugins require them):

```
perl-libwww
perl-lwp-protocol-https
perl-text-charwidth
perl-glib-object-introspection
```

The package `perl-glib-object-introspection` is required for the plugin `desktop-notify` and on Arch Linux is available on AUR. Then, it will use dunst to display de notifications.

Run the script `irssi/iip.sh`: it will install the updated plugins and will create the symlinks automatically:

`. ./iip.sh`

Copy the file `irssi/config` to your irssi folder: `$HOME/.irssi/config`, then change nicknames, passwords, servers, channels, etc., for yours.

### Screenfetch

```bash
 ██████████████████  ████████     gerard@Pegasus
 ██████████████████  ████████     OS: Manjaro 16.10.3 Fringilla
 ██████████████████  ████████     Kernel: x86_64 Linux 4.4.48-1-MANJARO
 ██████████████████  ████████     Uptime: 10h 52m
 ████████            ████████     Packages: 1383
 ████████  ████████  ████████     Shell: zsh 5.3.1
 ████████  ████████  ████████     Resolution: 1366x768
 ████████  ████████  ████████     WM: i3
 ████████  ████████  ████████     GTK Theme: E17gtk [GTK2/3]
 ████████  ████████  ████████     Icon Theme: breeze-dark
 ████████  ████████  ████████     Font: Noto Sans 10
 ████████  ████████  ████████     CPU: Intel Core i5-3320M @ 4x 3.3GHz [47.0°C]
 ████████  ████████  ████████     GPU: Mesa DRI Intel(R) Ivybridge Mobile
 ████████  ████████  ████████     RAM: 2197MiB / 3657MiB

```
