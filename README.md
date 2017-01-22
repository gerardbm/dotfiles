# Dotfiles

- DE: KDE
- WM: i3-gaps
- Shell: zsh
- Terminal: URxvt
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

### Configuration

##### Zsh

First, install it from the repositories; then you need to change your current shell (bash is the default, normally). To list all installed shells, run:

`$ chsh -l`

And set one as default for your user:

`$ chsh -s /usr/bin/zsh`

Now log out and log in to see the new shell as default. Copy the file `.zshrc` to your `$HOME` directory. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) following the instructions from its page. Atomic theme must be downloaded from [Atomic repository](https://github.com/gerardbm/atomic).

##### URxvt

Install it from the repositories and copy the file `.Xresources` to your `$HOME` directory. It already includes the Atomic color scheme.

##### Tmux

Install it from the repositories and install the package `urlview`. No need for additional plugins. Finally, copy the file `.tmux.conf` and paste to your `$HOME` directory.

##### Powerline

Clone or download the [Powerline fonts repository](https://github.com/powerline/fonts) and run the script `./install.sh`.

##### Git

Install git from the repositories, configure your account and copy the alias from the file `.gitconfig`.

##### Vim and neovim

Install vim, gvim and neovim from the repositories.

For neovim, make sure you have python3 installed, then run `sudo pip3 install --upgrade neovim`, it's a requirement for some plugins, as *deoplete*. If it's not working, try `sudo pip3 install --upgrade --force-reinstall neovim`.

Install the plugins manager [vim-plug](https://github.com/junegunn/vim-plug) following the instructions from its repository.

My vim config files are in my [vimrc](https://github.com/gerardbm/vimrc) repository. Copy the file `vimrc` to `$HOME/.vimrc`, the file `gvimrc` to `$HOME/.gvimrc` and the file `init.vim` to `$HOME/.config/nvim/init.vim`.

One of the plugins requires to have php installed. Install it from the repositories.

Open vim and neovim and run the command `:PlugInstall`.

From my [Atomic repository](https://github.com/gerardbm/atomic), copy the file `vim/atomic.vim` to your vim/neovim folder: `../colors/atomic.vim`, and the file `vim-airline/atomic.vim` to your vim-airline-themes folder: `../plugged/vim-airline-themes/autoload/airline/themes/atomic.vim`.

##### Vimf

Install it from the repositories.

##### Ranger

Install it from the repositories.

##### Mutt

Install mutt from the repositories, copy the file `.muttrc` to your `$HOME` directory and modify the settings for your email. It is configured to work for gmail.

##### Cmus

Install cmus from the repositories, copy the theme from my [Atomic repository](https://github.com/gerardbm/atomic) to your cmus folder: `$HOME/.cmus/atomic.theme`, also copy the file `playlist.pl` to the same folder.

##### Irssi

Install irssi from the repositories and install the following libraries (some plugins require them):

```
perl-libwww
perl-lwp-protocol-https
perl-text-charwidth
```

Run the script `irssi/iip.sh`: it will install the updated plugins and will create the symlinks automatically:

`. ./iip.sh`

Copy the file `irssi/config` to your irssi folder: `$HOME/.irssi/config`, then change nicknames, passwords, servers, channels, etc., for yours.
