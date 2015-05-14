export ZSH=/Users/ryanselk/.oh-my-zsh
ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=13
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
plugins=(git)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
alias v=nvim
