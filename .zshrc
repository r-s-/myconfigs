export ZSH=/Users/ryanselk/.oh-my-zsh
ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=13
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
plugins=(git)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
alias v=nvim
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Fast shortcuts
alias c='clear'
alias r='reset'
alias q='exit'
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vh='vagrant halt'
alias vus='vagrant up && vagrant ssh'
alias vhus='vagrant halt && vagrant up && vagrant ssh'
alias gl='glog'

# Because sometimes you don't have the time to put this two letters
alias ..='cd ..'
alias ...='cd ../..'
alias -- -="cd -"

hash -d kd=~"/Dev/devops/dev_vm/"
hash -d kw=~"/Dev/vagrant_kudos/kudos/"
hash -d kr=~"/Dev/vagrant_kudos/services/kudos-reporting-service/"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
