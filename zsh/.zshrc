# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="atomic-lambda"

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
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Paths
# --------------------------------------------------
# Local bin path
export PATH=$HOME/.local/bin:$PATH

# npm path
export PATH=~/.npm-global/bin:$PATH

# QCAD path
export PATH=/opt/qcad:$PATH

# Golang path
export GOPATH=$HOME/Workspace/goprojects

# Aliases:
# For a full list of active aliases, run `alias`.
# --------------------------------------------------
alias lsp='ls -C --color=always | less -R'
alias lsd='ls -ld */'
alias lsf='ls -lp | grep -v "/"'
alias unbz='tar -jxvf'
alias ungz='tar -zxvf'
alias cmc='./configure && make && sudo checkinstall'
alias cleanswap='sudo swapoff -a && sudo swapon -a'
alias pscpu='ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6'
alias pscpuw='watch "ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6"'

# Hardware
alias ram='free -h'
alias dush='du -sh'
alias dushs='du -sh * | sort -r -h'
alias disk='df -h .'

# X11
alias xres='xrdb ~/.Xresources'

# Zsh
alias viz='vim ~/.zshrc'
alias soz='source ~/.zshrc'

# Vim
alias vir='vim $HOME/vimrc/vim/.vimrc'
alias vor='vim -N -u NORC'
alias vimgd='vim `git diff --name-only`'
alias svim='sudoedit'

# Neovim
if [ -x "$(command -v nvim)"  ]; then
	alias neo='nvim'
	alias nir='nvim $HOME/vimrc/nvim/.config/nvim/init.vim'
	alias nor='nvim -N -u NORC'
	alias neogd='nvim `git diff --name-only`'
fi

# Emacs
alias ema='emacs -nw'

# Maxima
maxio() { maxima --very-quiet --batch-string "$1\;" }

# Sqlite
sqlio() { sqlite3 -list -batch "$1" "$2" | column -t -s "|" }

# Trash-cli tool
alias tra='trash'
alias tral='trash-list'
alias trae='trash-empty'
alias traun='trash `git ls-files . --exclude-standard --others`' # mv untracked

# Apt
alias aptedit='sudo apt edit-sources'
alias aptdep='apt-cache depends'
alias aptpol='apt-cache policy'
alias aptsea='apt-cache search'
alias aptsho='apt-cache show'
alias aptver='apt-cache madison'
alias aptbin='apt-get download'
alias aptsrc='apt-get source'
alias aptins='sudo apt-get install'
alias aptsid='sudo apt-get -t sid install'
alias aptrem='sudo apt-get remove'
alias aptaut='sudo apt-get autoremove'
alias aptupg='sudo apt-get update && sudo apt-get upgrade'

# Surfraw
alias srd='surfraw duckduckgo'
alias srg='surfraw github'
alias srl='surfraw slinuxdoc'
alias srm='surfraw mdn'
alias srs='surfraw stack'
alias srw='surfraw wikipedia'
alias srwca='surfraw wikipedia -l=CA'
alias srwes='surfraw wikipedia -l=ES'
alias sry='surfraw youtube'

# Faster git alias
alias gg='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-only'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit --amend -m'
alias gl='git lol'
alias gls='git log --stat'
alias ga='git add'
alias gk='git checkout'
alias gb='git branch'
alias gt='git tag'
alias gm='git merge'
alias grebm='git rebase master'       # Update a branch with the master
alias guntr='git rm --cached'         # Untrack file
alias gunst='git reset HEAD'          # Unstage file
alias gunco='git reset --soft HEAD~1' # Undo last commit
alias gpuom='git push origin master'
alias gpush='git push'
alias gpull='git pull'

# Dev
alias cdv='cd $HOME/vimrc/; ls'
alias cdd='cd $HOME/dotfiles/; ls'
alias cds='cd $HOME/Workspace/; ls'
alias cdw='cd $HOME/Workspace/vimwiki/; ls'
alias cui='uuid | tr -d "\n" | xsel -b'

# Translate-shell
alias enes='trans en:es -brief'
alias esen='trans es:en -brief'

# Time
alias cal1='ncal -M1b'
alias cal3='ncal -M3b'
alias caly='ncal -Myb'
alias diso='date -I | sed "s/-//g"'
alias disc='date -I | sed "s/-//g" | tr -d "\n" | xsel -b'
alias dutc='date -u'
alias dabs='echo "Day: $(date +%j) - Week: $(date +%V)"'

# Network
alias ipr='ip route'
alias wanip='curl -s icanhazip.com'
alias wifil='wicd-cli -S --wireless; wicd-cli -l --wireless'
alias wific='wicd-cli -c --wireless -n'
alias wifix='wicd-cli -x --wireless'

# Testing terminal emulators
alias tmux16='env TERM=xterm-16color tmux'
alias testpl='echo "\ue0b0 \ue0b1 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699 \ue0b3 \ue0b2"'
alias testft='echo -e "\e[1mbold\e[0m \e[3mitalic\e[0m \e[4munderline\e[0m \e[9mstrikethrough\e[0m"'
alias testvt='echo -e "\e[1mbold\e[0m \e[3mitalic\e[0m \e[1m\e[3mbolditalic\e[0m"'

# http://www.zzapper.co.uk/zshtips.html
alias -g ND='*(/om[1])'     # newest directory
alias -g NF='*(.om[1])'     # newest file
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

# Misc
alias news="newsbeuter"

# --------------------------------------------------

# Atomic dark color scheme for tty
if [[ -a ~/.local/bin/atomic-tty ]]; then
	source ~/.local/bin/atomic-tty
fi

# Default browsers
if [ -n "$DISPLAY"  ]; then
	export BROWSER=/usr/bin/firefox
else
	export BROWSER=/usr/bin/w3m
fi

# Commands
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey "^Q" kill-word

# Syntax highlighting
source $HOME/.syntax/zsh-syntax-highlighting.zsh

# Configure pager 'less'
export MANPAGER='less -s -M +Gg'

man() {
	LESS_TERMCAP_md=$'\e[00;36m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;31m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[00;33m' \
	command man "$@"
}
