source ~/Dotfiles/git/.git-prompt.sh
source ~/Dotfiles/git/.git-completion.sh

export PS1='\[\033[01;31m\]\u:\[\033[01;33m\]\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\[\033[01;34m\] \n⚡ \[\033[00m\] '

# Disables tmux auto title
export DISABLE_AUTO_TITLE=true

# Docker
alias docker.rm='docker rm -f $(docker ps -a -q)'
alias docker.rmi='docker rmi -f $(docker images -q)'
