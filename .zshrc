# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_HOME=`brew --prefix android`

export DOCKER_CERT_PATH=/Users/bobforma/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376

export EDITOR=vim
export WKHTMLTOPDF_BINARY=/usr/local/bin/wkhtmltopdf

# fixes ImageMagick gem installation
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Ruby GC optimization
export RUBY_GC_HEAP_INIT_SLOTS=1250000
export RUBY_HEAP_SLOTS_INCREMENT=100000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=30000000
export RUBY_GC_HEAP_FREE_SLOTS=12500

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export RUBYLIB=/Applications/RubyMine.app/rb/testing/patch/common:/Applications/RubyMine.app/rb/testing/patch/bdd

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export APPLE_DEVELOPER_PROGRAM_APPLE_ID=bobforma@gmail.com
export ITUNES_CONNECT_APPLE_ID=bforma+workaway@zilverline.com

alias aliases='vi ~/.zshrc; source ~/.zshrc'
alias gm='git checkout master'
alias gpr='git pull -r'
alias gs='git status'
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias git-prune-local='git checkout master && git remote prune origin && git fetch && git branch --merged master | grep -v "master$" | xargs git branch -d'
alias amend='git commit --amend'

alias s='foreman s'
alias bi='bundle install'
alias be='bundle exec'
alias migrate='rake db:migrate'
alias rollback='rake db:rollback'
alias pdb_reset='rake db:drop db:create db:migrate db:test:clone && rake db:seed && rake parallel:prepare'
alias db_reset='rake db:drop db:create db:migrate db:test:clone && rake db:seed'
alias spec='rspec spec'
alias pspec='DISABLE_SPRING=1 rake spec'

alias rails='be rails'
alias rake='be rake'
alias rspec='be rspec'

eval "$(direnv hook zsh)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
