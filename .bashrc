source ~/Dotfiles/git/.git-prompt.sh
source ~/Dotfiles/git/.git-completion.sh

export PS1='\[\033[01;31m\]\u:\[\033[01;33m\]\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\[\033[01;34m\] \n⚡ \[\033[00m\] '
export EDITOR="vim"
export GOPATH=$HOME/go
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$PATH:/home/wsantos/.dotnet/tools

# Disables tmux auto title
export DISABLE_AUTO_TITLE=true

# aliases
alias be="bundle exec"
alias ls="ls --color"

# Docker
alias docker.rm='docker rm -f $(docker ps -a -q)'
alias docker.rmi='docker rmi -f $(docker images -q)'

alias ip_route_fix='for x in `ip route | grep linkdown | cut -f1 -d" " | grep 172` ; do sudo ip route del $x ; done'

# set PATH to includes rbenv if exists
if [ -d "$HOME/.rbenv/shims" ] ; then
    export PATH="$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init -)"
fi


connect_container(){
  local namespace=$1

  local pod_name=`kubectl get pods -n $namespace | grep Running | awk '{ print $1 }' | head -n1`
  kubectl exec -n $namespace -it $pod_name bash
}
