# Path to your oh-my-zsh installation.
export ZSH=/home/rs/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git last-working-dir ruby)


export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
alias v=nvim
export PATH="$HOME/.rbenv/bin:$PATH"
alias tmux='tmux -2'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


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
