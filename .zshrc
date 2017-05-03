# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="atomic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Go Path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/DEV/goprojects

# Aliases:
# For a full list of active aliases, run `alias`.
# --------------------------------------------------
# GNU/Linux
alias lsp='ls -C --color=always | less -R'
alias unbz='tar -jxvf'
alias ungz='tar -zxvf'
alias cmc='./configure && make && sudo checkinstall'
alias cleanswap='sudo swapoff -a && sudo swapon -a'

# Packaging
alias aptupg='sudo apt-get update && sudo apt-get upgrade'
alias pacmir='sudo pacman-mirrors -g'
alias pacupg='sudo pacman -Syu'

# Zsh
alias vish='vim ~/.zshrc'
alias sosh='source ~/.zshrc'

# URxvt
alias xres='xrdb ~/.Xresources'

# Vim/Neovim
alias vir='vim ~/.vimrc'
alias ner='nvim ~/.config/nvim/init.vim'
alias nor='vim -N -u NORC'
alias neo='nvim'
alias syn='cd /usr/share/nvim/runtime/syntax/ && ls'

# Trash-cli tool
alias tr='trash'

# Google Drive sync
alias drive='cd $HOME/Grive/ && grive'

# Surfraw
alias srg='surfraw google'
alias srd='surfraw duckduckgo'
alias srs='surfraw stack'
alias sra='surfraw aur'
alias srl='surfraw slinuxdoc'

# Dev
alias gst='git status'
alias st='cd $HOME/DEV/wpdev/wp-content/themes/starion/'

# Translate-shell (Google Translate CLI)
alias gt='translate-shell'
alias enes='translate-shell en:es'
alias esen='translate-shell es:en'

# Network
alias wanip='curl -s icanhazip.com'

# Testing
alias tmux16='env TERM=xterm-16color tmux'
# --------------------------------------------------

CHECKTERM=$(xprop -id "$WINDOWID" WM_CLASS | cut -d" " -f3 | sed 's/^.\(.*\)..$/\1/')

# Scheme switcher (Konsole only)
if [[ "$CHECKTERM" = 'konsole' ]]; then
	if [[ -a ~/.konsole-schemes.sh ]]; then
		source ~/.konsole-schemes.sh
	fi
fi

# Scheme switcher (URxvt only)
if [[ "$CHECKTERM" = 'urxvt' ]]; then
	if [[ -a ~/.urxvt-schemes.sh ]]; then
		source ~/.urxvt-schemes.sh
	fi
fi

# Atomic dark color scheme for tty
if [[ -a ~/.atomic-tty.sh ]]; then
	source ~/.atomic-tty.sh
fi

# Commands
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
