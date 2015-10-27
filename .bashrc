source ~/Dotfiles/git/.git-prompt.sh
source ~/Dotfiles/git/.git-completion.sh

export PS1='\[\033[01;31m\]\u:\[\033[01;33m\]\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\[\033[01;34m\] \n⚡ \[\033[00m\] '
export EDITOR=vim
export TERM=xterm-256color

# Disables tmux auto title
export DISABLE_AUTO_TITLE=true

# Aliases
alias be='bundle exec'
alias ls='ls --color=auto'
alias open=google-chrome
alias projects="cd $HOME/projects"

# Docker
alias docker.rm='docker rm -f $(docker ps -a -q)'
alias docker.rmi='docker rmi -f $(docker images -q)'

# Golang
export GOPATH=$HOME/projects/go
export GOROOT=/opt/go
export PATH=$PATH:$GOPATH/bin

# Ruby
source /home/wjsantos/.rvm/scripts/rvm
