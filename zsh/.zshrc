# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# HELPERS
is_mac () {
    test `uname` = "Darwin"
}

distro () {
    cat /etc/*release | head -n 1 | cut -d \" -f 2
}

is_arch () {
    test distro = "Arch Linux"
}

is_debian () {
    test `distro | cut -d ' ' -f 1` = "Debian"
}

command_exists () {
    type "$1" &> /dev/null;
}

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export GOPATH=~/code/go

PATH+=:~/.rvm/bin
PATH+=:/usr/bin/core_perl
PATH+=:/opt/qt/bin
PATH+=:~/.bin
PATH+=:~/.composer/vendor/bin
PATH+=:/usr/texbin
PATH+=:~/.phpenv/bin
PATH+=:$GOPATH/bin

if is_mac; then
    PATH+=:/usr/local/texlive/2016/bin/x86_64-darwin
fi;

path () {
    echo $PATH | tr -s ':' '\n'
}

# My customisations
setopt autocd
unsetopt correct_all

if test -f ~/.zshrc.local
then
    source ~/.zshrc.local
fi

#########################
# ALIASES AND FUNCTIONS #
#########################

alias sz="source ~/.zshrc"
alias ez="e ~/.zshrc"

# DIRECTORY NAVIGATION
alias c='cd -'

# mkdir and cd into it in one command
mkcd () {
    mkdir -p $1 && cd $1
}

# move up directories quickly, e.g. up 3 is cd ../../../
up() {
    local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x;
}

# LS
if is_mac; then
    alias ls='gls -h --group-directories-first --color=always'
else
    alias ls='ls -h --group-directories-first --color=always'
fi;

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias ff='find . -iname'

# EDITORS
alias e='emacsclient -nw'

if command_exists emacs; then
    export EDITOR='emacsclient -nw'
else
    export EDITOR='vim'
fi;

# restart emacs server
er () {
    emacsclient -e '(gf/my-kill-emacs)'; emacs -daemon
}

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# GIT
alias gst='git status'
alias gch='git checkout'
alias gco='git commit'
alias gad='git add'
alias gcl='git clone'
alias gbr='git branch'
alias grbr='git branch --merged | grep -v \* | xargs git branch -d'
alias glo='git log'
alias gloo='git log --oneline'
alias gfe='git fetch'
alias gpul='git pull'
alias gpus='git push'
alias gme='git merge'
alias gdi='git diff'
alias gsu='git submodule'

git-since () {
    git log --oneline --pretty=format:"%h - %an, %ad : %s" --since="$1"
}

git-between () {
    git log --oneline --pretty=format:"%h - %an, %ad : %s" --since="$1" --until="$2"
}

# FZF
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# TMUX
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --select-1 --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# PACKAGE MANAGEMENT

# Arch
if is_arch; then
    alias bin='sudo pacman -Rs'
    alias pup='sudo pacman -Syu'
    alias porph='pacman -Qqdt' #Show package orphans
    alias pgr='pacman -Qq | grep -i' #Grep installed packages
fi;

# NETWORK
alias myip='curl canihazip.com/s/'
alias png='ping -c 5 www.google.com'

if is_mac; then
    alias reset_dns='sudo killall -HUP mDNSResponder'
fi;

# MISC
alias mysq='mysql -u root -p'

placeholder () {
    wget http://placekitten.com/$1/$2 -O $1\x$2.jpg
}

# pretty print json
alias pjson='python -mjson.tool'

# Vagrant

alias vs='vagrant ssh'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vr='vagrant reload'
alias vg='vagrant global-status'
alias vp='vagrant provision'

# PHP

sy() {
    if test -f app/console; then
        ./app/console $*
    else
        ./bin/console $*
    fi;
}

alias nep='php neptune'

alias phpunit='./vendor/bin/phpunit'
alias tphpunit='phpunit --testsuite'

alias php53='/usr/local/Cellar/php53/*/bin/php'
alias php54='/usr/local/Cellar/php54/*/bin/php'

alias comi='composer install'
alias comu='composer update'
alias comr='composer require'

#Grep for a process
alias psgr='ps -A | grep -i'

#Copy a file to Desktop to make temporary changes, e.g. rename it
#before sending to someone
#with no args, just go to desktop
desk() {
if test $# -ne 1
then
    cd ~/Desktop/
else
    cp -v $1 ~/Desktop/
fi;
}

# vagrant on MacOS sometimes has permission errors due to stale NFS file handles.
# use this to jog its memory.
alias jog='ls -Ra > /dev/null'

# Download stuff
dl() {
    (cd ~/Downloads/; curl -L -O $1)
}

# Combine pdfs
# pdf-combine 1.pdf 2.pdf
# OR
# pdf-combine *.pdf
# creates output.pdf
# the input files are printed after 'from' when gs is followed by a command
# (echo), but doesn't output anything normally. I have no idea why.
alias pdf-combine='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output.pdf && echo "created output.pdf from"'

alias clone_lib='cd ~/code/lib && git clone'

# Sometimes Chrome favicon cache needs a kick
alias rm_chrome_favicons='rm ~/Library/Application\ Support/Google/Chrome/Default/Favicons'

alias pygment-styles='python -c "from pygments.styles import get_all_styles; print(list(get_all_styles()))"'

# FUN
alias starwars='telnet towel.blinkenlights.nl'
alias youtube-mp3="youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k"

# FASD
if command_exists fasd;
then;
    eval "$(fasd --init auto)"

    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection

    ee () {e `fasd -sif $1`}
fi;

# Tmuxinator completions
if test -f ~/.bin/tmuxinator.zsh
then
    source ~/.bin/tmuxinator.zsh
fi;
