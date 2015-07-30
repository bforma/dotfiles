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

export PATH="./bin::$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

# rbenv
eval "$(rbenv init -)"
export RBENV_ROOT=$HOME/.rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export RUBYLIB=/Applications/RubyMine.app/rb/testing/patch/common:/Applications/RubyMine.app/rb/testing/patch/bdd
# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias aliases='vi ~/.zshrc; source ~/.zshrc'
alias ws='cd /Users/bobforma/Documents/projects/$1'
alias fr='cd /Users/bobforma/Documents/projects/freemle-sinatra'
alias robo='cd /Users/bobforma/Documents/projects/robo-racer'
alias katas='cd /Users/bobforma/Documents/projects/katas'
alias tools='cd /Users/bobforma/Documents/tools'
alias freemle_db='psql -U freemle_dev_user freemle_dev_db'
alias wa='cd /Users/bobforma/Documents/projects/workaway/workaway'
alias lw='cd /Users/bobforma/Documents/projects/lightweight-360'
alias belp='bundle exec localeapp pull'
alias rcov='open ./coverage/index.html'
alias bi='bundle install'
alias fv='cd /Users/bobforma/Documents/projects/face-value'
alias fva='cd /Users/bobforma/Documents/projects/facevalue-api'

alias gm='git checkout master'
alias gbl='git branch --list'
alias gpr='git pull -r'
alias gp='git push'
alias grc='git rebase --continue'
alias gs='git status'
alias gp='git push'
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias git-prune-local='git checkout master && git remote prune origin && git fetch && git branch --merged master | grep -v "master$" | xargs git branch -d'
alias amend='git commit --amend'

alias s='rails s'
alias fs='be bin/freemle s'
alias routes='be rake routes'
alias be='bundle exec'
alias migrate='be rake db:migrate db:test:clone && be rake parallel:prepare'
alias rollback='be rake db:rollback'
alias pdb_reset='be rake db:drop db:create db:migrate db:test:clone && be rake db:seed && be rake parallel:prepare'
alias db_reset='be rake db:drop db:create db:migrate db:test:clone && be rake db:seed'
alias spec='DISABLE_COVERAGE=true be rspec spec'
alias cspec='ENABLE_COVERAGE=true be rspec spec'
alias pspec='be rake parallel:spec'
alias spec_int='DISABLE_COVERAGE=true be rspec spec -t integration'
alias spec_diff="DISABLE_COVERAGE=true git diff --name-only HEAD | grep 'spec/' | xargs be rspec"
alias prod_dump="be rake db:load_dump\[production\]"

eval "$(direnv hook zsh)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
