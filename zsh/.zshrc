# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

fpath+=~/.zfunc

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunaku"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias drf="docker rm -f \$(docker ps -aq)"
alias dri="docker rmi \$(docker images -q --filter \"dangling=true\")"
alias ac="ag --clojure"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias e="emacs \"$@\""
alias ed="emacs --daemon"
alias ec="emacsclient -c &"
alias eapp="open /Applications/Emacs.app"
alias dcl="docker-compose logs -f --tail=100"
alias dcr="docker-compose restart"
alias dockergc="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc"
alias dcv="docker volume rm $(docker volume ls -qf dangling=true)"
alias fixgit="killall gpg-agent && gpg-agent --daemon --pinentry-program /usr/local/bin/pinentry"
alias ls="exa"
alias lll="exa -l -h --git"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#export ZSH_TMUX_AUTOSTART=true
#export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git osx tmux)


#Spotify shortcuts
alias sp="spotify pause"
alias spp="spotify play"

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"
export PATH="$(brew --prefix git)/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='emacs'
fi

export TERM=xterm-256color

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e "/usr/local/share/zsh/site-functions/_aws" && source "/usr/local/share/zsh/site-functions/_aws"

source $HOME/.cargo/env
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="$PATH:/usr/local/bin/cvent-aws-cli"
export PATH="/usr/local/opt/ruby/bin:$PATH:/usr/local/lib/ruby/gems/2.6.0/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.chefdk/gem/ruby/2.3.0/bin:$HOME/code/flutter/bin"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

export PATH="${PATH}:/usr/local/share/dotnet"

export PYENV_ROOT="$HOME/.pyenv"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jcomer/code/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jcomer/code/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jcomer/code/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jcomer/code/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/jcomer/code/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/jcomer/code/node_modules/tabtab/.completions/slss.zsh

export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/jcomer/Library/Preferences/org.dystroy.broot/launcher/bash/br

. /usr/local/opt/asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

export PATH="$HOME/.radicle/bin:$PATH"
if [ -e /Users/jcomer/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jcomer/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
