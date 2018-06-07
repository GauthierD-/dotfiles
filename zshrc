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
  zsh-syntax-highlighting
  npm
  tmux
 )

# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOCONNECT="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias tmux='tmux -2'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias m='meteor'
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

export NVM_DIR="/Users/Gauthierderoo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Config for vim-superman (man inside vim)
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

# completion NVM
[ -r $NVM_DIR/bash_completion  ] && . $NVM_DIR/bash_completion

###-tns-completion-start-###
if [ -f /Users/Gauthierderoo/.tnsrc ]; then 
    source /Users/Gauthierderoo/.tnsrc 
fi
###-tns-completion-end-###


### archey swag
archey -c

## Kubernete
export KUBE_EDITOR="vim"
# export K8PATH=/Users/Gauthierderoo/Documents/k8/kubernetes/platforms/darwin/amd64
# export PATH=$PATH:$K8PATH

export NPM_TOKEN=b1bd9ee4-c3f9-4c19-a07c-00d7a21dcaa6
export GOOGLE_MAPS_KEY=AIzaSyCgSjw75V2YSoSbll1HsaH1kkQESMjzqtc
export INSTAGRAM_CLIENT_ID=2fa7b3e24a4446b5b303a6bfea3cd09c
export MAPBOX_KEY=pk.eyJ1IjoiZnJhbnR6cmVlbGV2YW50IiwiYSI6ImNpeWs2aWhhcjAwMWQyd3I0bGd6cnllOXkifQ.2M9A0N21P4TttPmeTaMSpA

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Gauthierderoo/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/Gauthierderoo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Gauthierderoo/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/Gauthierderoo/google-cloud-sdk/completion.zsh.inc'; fi

### Java / Maven / Beam
export JAVA_HOME=$(/usr/libexec/java_home)
export MAVENPATH=/Users/Gauthierderoo/apache-maven-3.5.0
export PATH=$PATH:$MAVENPATH/bin
