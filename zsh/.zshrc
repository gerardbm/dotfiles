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
DISABLE_AUTO_TITLE="true"

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
alias pscpu='ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6'
alias pscpuw='watch "ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6"'

# Packaging (Arch and Debian based)
alias pacupg='sudo pacman -Syu'
alias pacmir='sudo pacman-mirrors -f0 && sudo pacman -Syy'
alias aptupg='sudo apt-get update && sudo apt-get upgrade'

# Zsh
alias vish='nvim ~/.zshrc'
alias sosh='source ~/.zshrc'

# Xresources
alias xres='xrdb ~/.Xresources'

# Vim/Neovim
alias vir='vim $HOME/.vimrc'
alias nir='nvim $HOME/.config/nvim/init.vim'
alias nor='nvim -N -u NORC'
alias neo='nvim'
alias syn='cd /usr/share/nvim/runtime/syntax/; ls'

# Emacs
alias emacst='emacs -nw'

# Trash-cli tool
alias tra='trash'

# Google Drive sync
alias gdrive='cd $HOME/Grive/ && grive'

# Surfraw
alias sra='surfraw archwiki'
alias src='surfraw cite'
alias srd='surfraw duckduckgo'
alias srg='surfraw google'
alias srl='surfraw slinuxdoc'
alias srm='surfraw mdm'
alias srs='surfraw stack'
alias srt='surfraw github'
alias srw='surfraw wikipedia'
alias srwca='surfraw wikipedia -l=CA'
alias srwes='surfraw wikipedia -l=ES'
alias sry='surfraw youtube'

# Dev
alias gst='git status'
alias cdv='cd $HOME/DEV/; ls'
alias cdd='cd $HOME/dotfiles/; ls'
alias cui='uuid | tr -d "\n" | xclip -selection clipboard'

# Translate-shell
alias enes='trans en:es -e bing -b'
alias esen='trans es:en -e bing -b'

# Network
alias ipr='ip route'
alias wanip='curl -s icanhazip.com'

# Testing terminal emulators
alias tmux16='env TERM=xterm-16color tmux'
alias testpl='echo "\ue0b0 \ue0b1 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699 \ue0b3 \ue0b2"'
alias testft='echo -e "\e[1mbold\e[0m \e[3mitalic\e[0m \e[4munderline\e[0m \e[9mstrikethrough\e[0m"'

# http://www.zzapper.co.uk/zshtips.html
alias -g ND='*(/om[1])' 	      # newest directory
alias -g NF='*(.om[1])' 	      # newest file
alias -g NO='&>|/dev/null'
alias -g P='2>&1 | $PAGER'
alias -g VV='| vim -R -'
alias -g L='| less'
alias -g M='| most'
alias -g C='| wc -l'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

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

# Default browsers
if [ -n "$DISPLAY"  ]; then
	export BROWSER=/usr/bin/qutebrowser
else
	export BROWSER=/usr/bin/w3m
fi

# Commands
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# Syntax highlighting
source $HOME/.syntax/zsh-syntax-highlighting.zsh
