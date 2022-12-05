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
export PATH="$HOME/.local/bin:$PATH"

# npm path
export PATH="$HOME/.npm-global/bin:$PATH"

# QCAD path
export PATH="/opt/qcad:$PATH"

# Golang path
export GOPATH="$HOME/Workspace/goprojects"

# Ruby path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Pyenv path
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Aliases:
# For a full list of active aliases, run `alias`.
# --------------------------------------------------
alias ls='ls --color=always --group-directories-first'
alias ll='ls -l --color=always --group-directories-first'
alias lsp='ls -C --color=always | less -R'
alias lsd='ls -ld */'
alias lsf='ls -lp | grep -v "/"'
alias lx='ls -Slhlp | grep -v "/"'
alias unbz='tar -jxvf'
alias ungz='tar -zxvf'
alias cmc='./configure && make && sudo checkinstall'
alias cleanswap='sudo swapoff -a && sudo swapon -a'
alias yy='pwd | tr -d "\n" | xsel -b'
alias fid='find . -type d -name'
alias fif='find . -type f -name'
alias fidi='find . -type d -iname'
alias fifi='find . -type f -iname'
alias mkd='mkdir -pv'

# Hardware
alias ram='free -h'
alias dush='du -sh'
alias dushs='du -sh * | sort -r -h'
alias disk='df -h .'

# X11
alias xres='xrdb ~/.Xresources'

# Zsh
alias viz='vim $HOME/.zshrc'
alias soz='source $HOME/.zshrc'

# Vim
alias vir='vim $HOME/.vimrc'
alias vor='vim -N -u NORC'
alias vimgd='vim `git diff --name-only`'
alias vimgdh='vim `git diff --name-only | head -n 1`'
alias vimgdt='vim `git diff --name-only | tail -n 1`'
alias vimgds='vim `git diff --staged --name-only`'
alias vimgdsh='vim `git diff --staged --name-only | head -n 1`'
alias vimgdst='vim `git diff --staged --name-only | tail -n 1`'
alias vimun='vim `git ls-files . --exclude-standard --others`'
alias svim='sudoedit'
alias vimt='vim `ls | tail -n 1`'
alias vimh='vim `ls | head -n 1`'

# Vifm
alias vif='vim ~/.config/vifm/vifmrc'

# Tmux
alias vit='vim ~/.tmux.conf'

# Xresources
alias vix='vim ~/.Xresources'

# Neovim
if [ -x "$(command -v nvim)"  ]; then
	alias neo='nvim'
	alias nir='nvim $HOME/.config/nvim/init.vim'
	alias nor='nvim -N -u NORC'
	alias neogd='nvim `git diff --name-only`'
fi

# Emacs
alias ema='emacs -nw'

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
alias srg='surfraw google'
alias srh='surfraw github'
alias srl='surfraw slinuxdoc'
alias srm='surfraw mdn'
alias srr='surfraw rae'
alias srs='surfraw stack'
alias wen='surfraw wikipedia'
alias wca='surfraw wikipedia -l=CA'
alias wes='surfraw wikipedia -l=ES'
alias sry='surfraw youtube'

# Faster git alias
alias gg='git status'
alias gx='git status -s'
alias gd='git diff'
alias gdw='git diff --color-words'
alias gdm='git diff --color-words=.'
alias gdn='git diff --name-only'
alias gds='git diff --staged'
alias gdsw='git diff --staged --color-words'
alias gdsm='git diff --staged --color-words=.'
alias gdsn='git diff --staged --name-only'
alias gc='git commit'
alias gcm='git commit -m'
alias gcmd='git commit -m "$(date -I | sed "s/-//g")"'
alias gcam='git commit --amend -m'
alias gl='git lol'
alias gls='git log --stat'
alias ga='git add'
alias gau='git add $(git ls-files -o --exclude-standard)' # Add untracked
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
alias cdf='cd $HOME/Sync/; ls'
alias cdv='cd $HOME/vimrc/; ls'
alias cdd='cd $HOME/dotfiles/; ls'
alias cds='cd $HOME/Workspace/; ls'
alias cdw='cd $HOME/Workspace/vimwiki/; ls'
alias cui='uuid | tr -d "\n" | xsel -b'

# Deploy
alias rsyncd='rsync -v -rz --checksum --delete'
alias -g rsh='--rsh="ssh -p2222"'

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

# http://www.zzapper.co.uk/zshtips.html
alias -g ND='*(/om[1])'     # newest directory
alias -g NF='*(.om[1])'     # newest file
alias -g NO='&>|/dev/null'
alias -g P='2>&1 | $PAGER'
alias -g VV='| vim -R -'
alias -g G='| grep'
alias -g F='| fzf'
alias -g L='| less'
alias -g M='| most'
alias -g C='| wc -l'
alias -g H='| head'
alias -g T='| tail'
alias -g H1='| head -n 1'
alias -g T1='| tail -n 1'
alias -g LL='2>&1 | less'
alias -g CA='2>&1 | cat -A'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g CC='| xsel -b'

# Convert utilities
alias convertao='convert -alpha on'
alias convertar='convert -alpha remove -background white'
alias convertdd='convert -alpha remove -background white -density 300 -depth 8'

# Misc
alias news='newsbeuter'
alias jekill='pkill -f jekyll; rm /tmp/jekyll.ps'
alias jeklast='bundle exec jekyll serve --limit_posts 1 -l'
alias jekincr='bundle exec jekyll serve --incremental -l'
alias yt='yt-dlp -if best'
alias epub='ebook-viewer'
alias ff='pcmanfm .'
alias mpv0='mpv --ytdl-format=0'
alias mpv1='mpv --ytdl-format=1'
alias ytf='ytfzf -Dfl'
alias ytd='ytfzf -Dfdl'
alias yth='ytfzf -DfHl'
alias deploy='zsh deploy.sh'
alias report='zsh report.sh'
alias nav='zsh nav.sh'
alias clock='tty-clock -C6 -c'
alias ra='ranger'

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

# Syntax highlighting
if [[ -a ~/.syntax/zsh-syntax-highlighting.zsh ]]; then
	source $HOME/.syntax/zsh-syntax-highlighting.zsh
fi

# Autosuggestions
if [[ -a ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=007'
	ZSH_AUTOSUGGEST_STRATEGY=(completion)
	ZSH_AUTOSUGGEST_USE_ASYNC=1
fi

# Speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
	OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
	zle -N self-insert url-quote-magic
}

pastefinish() {
	zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

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

# Prevent ^d (ctrl-d) exiting the shell
set -o ignoreeof

# Custom tools
# Maps called after vi-mode
vifmx() {
	vifm . 2>/dev/null
}

lsix() {
	setopt +o nomatch
	sxiv -t *.(png|jpg|jpeg|bmp|gif|tiff) 2>/dev/null
	setopt -o nomatch
}

# --------------------------------------------------

# Vi-mode
bindkey -v
export KEYTIMEOUT=1

bindkey -s '^o' 'vifmx\n'
bindkey -s '^s' 'lsix\n'

# Visual mode settings
zle_highlight=( region:bg=7,fg=0 )

# Navigate in tab autocomplete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Change cursor shape
zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
	echo -ne "\e[2 q"
else
	echo -ne "\e[6 q"
fi
}

zle-line-init() {
	echo -ne "\e[6 q"
}

zle-line-finish() {
	echo -ne "\e[2 q"
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# Edit line in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x' edit-command-line

# Readline commands
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^h' backward-delete-char
bindkey '^d' delete-char
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^w' backward-kill-word
bindkey '^q' kill-word
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
bindkey '^z' autosuggest-clear
bindkey '^y' autosuggest-toggle
bindkey "^t" fzf-file-widget

# Vi-mode commands
# This skips 'down-line-or-history' and 'up-line-or-history'
bindkey -M vicmd 'j' down-line
bindkey -M vicmd 'k' up-line

# Interrupt key is Ctrl+j
# - As in tmux to close pane/window: Ctrl+Alt+j
# - As in i3wm window: Ctrl+$mod+j
stty intr ^j

# Escape key is Ctrl+c
bindkey '^c' vi-cmd-mode

# Escape key from visual mode is Ctrl+c
bindkey -M visual '^c' deactivate-region

# Surround
autoload -U select-quoted # ci"
zle -N select-quoted
for m in visual viopp; do
	for c in {a,i}{\',\",\`}; do
		bindkey -M $m $c select-quoted
	done
done

autoload -U select-bracketed # ci{, ci(
zle -N select-bracketed
for m in visual viopp; do
	for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
		bindkey -M $m $c select-bracketed
	done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# Use this ssh-askpass
# export SSH_ASKPASS=/usr/bin/lxqt-openssh-askpass

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -p ~/.gitignore -g ''"
export FZF_DEFAULT_OPTS="\
--bind ctrl-f:abort \
--bind alt-u:preview-half-page-up \
--bind alt-d:preview-half-page-down \
--height=15 --reverse \
--prompt='> ' --pointer='→' --no-bold \
--color fg:15,bg:0,hl:3,fg+:6,bg+:8,hl+:3,header:7,\
info:6,prompt:6,spinner:2,pointer:3,marker:3,border:6"

export FZF_CTRL_T_COMMAND="ag --hidden --ignore .git -p ~/.gitignore -g ''"
export FZF_CTRL_T_OPTS="--bind ctrl-t:abort"
export FZF_CTRL_R_OPTS="--bind ctrl-r:abort"

export YTFZF_EXTMENU_LEN=150
export YTFZF_EXTMENU=" fzf $FZF_DEFAULT_OPTS"
