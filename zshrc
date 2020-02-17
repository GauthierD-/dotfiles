# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"
# ZSH_THEME="cloud"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  z
  npm
  tmux
  kubectl
  zsh-syntax-highlighting
 )

# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOCONNECT="true"

LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias vim='nvim'
alias tmux='tmux -2'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias git-branch-rm='git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done'
alias docker-image-rm-none='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias docker-image-rm='docker rmi $(docker images -a -q)'
alias docker-ps-stop='docker stop $(docker ps -a -q)'
alias docker-ps-rm='docker rm $(docker ps -a -q)'

# start tmux on every shell login
# and checks if tmux is installed before trying to launch
if which tmux 2>&1 >/dev/null; then
    #if no session is started, start a new session
    test -z ${TMUX} && tmux

    #when quitting tmux try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

# Config for vim-superman (man inside vim)
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

### archey swag
archey -c

## Kubernete
export KUBE_EDITOR="vim"
# export K8PATH=/Users/Gauthierderoo/Documents/k8/kubernetes/platforms/darwin/amd64
# export PATH=$PATH:$K8PATH

export PATH=/usr/local/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Gauthierderoo/google-cloud-sdk/path.zsh.inc' ]; then
  source '/Users/Gauthierderoo/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Gauthierderoo/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/Users/Gauthierderoo/google-cloud-sdk/completion.zsh.inc';
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

