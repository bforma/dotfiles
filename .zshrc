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

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
[ -r ~/.ssh/jortt-acceptance-aliases ] && _jortt_acceptance=($(cat ~/.ssh/jortt-acceptance-aliases | sed -ne 's/Host[=\t ]//p')) || _jortt_acceptance=()
[ -r ~/.ssh/jortt-production-aliases ] && _jortt_production=($(cat ~/.ssh/jortt-production-aliases | sed -ne 's/Host[=\t ]//p')) || _jortt_production=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_ssh_config[@]"
  "$_jortt_acceptance[@]"
  "$_jortt_production[@]"
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off
# end completion

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Ruby GC optimization
export RUBY_GC_HEAP_INIT_SLOTS=1250000
export RUBY_HEAP_SLOTS_INCREMENT=100000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=30000000
export RUBY_GC_HEAP_FREE_SLOTS=12500

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

NUMBER_OF_CORES=`sysctl -n hw.ncpu`
export PARALLEL_TEST_PROCESSORS=`expr $NUMBER_OF_CORES - 1`
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1
export NODE_ENV=development

export LETTER_OPENER=yes
export RUBOCOP_DAEMON_USE_BUNDLER=true

alias aliases='vi ~/.zshrc; source ~/.zshrc'
alias gm='git checkout master'
alias gpr='git pull -r'
alias gs='git status'
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias git-prune-local='git checkout master && git remote prune origin && git fetch && git branch --merged master | grep -v "master$" | xargs git branch -d'
alias git-prune-local2='git checkout feature/organization-rules && git remote prune origin && git fetch && git branch --merged feature/organization-rules | grep -v "feature/organization-rules$" | xargs git branch -d'
alias amend='git commit --amend'
alias be='bundle exec'
alias rails='be rails'
alias rake='be rake'
alias rspec='be rspec'
alias sekrets='be sekrets'
alias fastlane='be fastlane'
alias s='PORT=3000 foreman start'
alias c='rails c'
alias freemle_reset='NO_DEBUG=1 bundle exec rake freemle:db:reset && NO_DEBUG=1 bundle exec rake freemle:compleet freemle:freemle && NO_DEBUG=1 bundle exec rake db:migrate'

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

PERL5LIB="/Users/bobforma/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/bobforma/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/bobforma/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/bobforma/perl5"; export PERL_MM_OPT;

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH="/Users/bobforma/perl5/bin${PATH:+:${PATH}}"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$PATH
export PATH="./bin:node_modules/.bin:$PATH"
export PATH=$PATH:~/Library/Android/sdk/platform-tools
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/Users/bobforma/Qt5.5.0/5.5/clang_64/bin/:$PATH"

export JORTT_PUMA_PORT=3000
export JORTT_PUSHER_PORT=4000
export WEBSOCKET_URL=http://localhost:4000
export NO_DEBUG=1
