# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
[ -d $HOME/.oh-my-zsh.custom ] && ZSH_CUSTOM=$HOME/.oh-my-zsh.custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="stephdewit"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
#export DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
[ "$(uname)" = "Darwin" ] \
	&& plugins=(git macos brew node npm yarn tmux golang vagrant) \
	|| plugins=(git tmux docker docker-compose terraform)

# Load zplug
if [ -d $HOME/.zplug ]; then
	export ZPLUG_HOME=$HOME/.zplug
else
	export ZPLUG_HOME=/usr/local/opt/zplug
fi

source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

zplug load

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
[ "$(uname)" = "Linux" ] && LC_CTYPE=en_US.UTF8
unsetopt HIST_VERIFY

if [ "$(uname)" = "Linux" ]; then
	source $HOME/.bash/aliases
	source $HOME/.bash/env
else
	export GOPATH=$HOME/Sources/go
	export PATH=$PATH:$(go env GOPATH)/bin
fi

[ "$(uname)" = "Linux" ] && alias ls="ls --color=tty -N"
alias aws="PAGER='' aws"

export NVM_DIR="$HOME/.nvm"
function load_nvm {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

async_start_worker nvm_worker -n
async_register_callback nvm_worker load_nvm
async_job nvm_worker sleep 0.1
