# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/Calayag/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras virtualenvwrapper django heroku jira)


# Customize to your needs...
export PATH="/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
alias wb="cd $HOME/Documents/Projects/BetterWorks"
alias gac="git add . && git commit"
alias gap="git add -p"
alias gcm="git commit -m"
alias gmu="git fetch upstream && git merge upstream/master"
alias gru="git pull -r upstream master"
alias gpo="git push --set-upstream origin \`git symbolic-ref --short HEAD\`"
alias gbd="git branch -D "
alias gpf="git push --force-with-lease"
alias gd="git diff --minimal -w HEAD | cdiff -s -w 100"
alias f8="flake8 -j auto"
alias is="find . -name \"*.py\" -not -name appfiles | xargs -n 400 -P 8 isort -q"
alias tt="py.test -s"
alias es="wb; cd ../elasticsearch; ./es.sh"
alias pt="py.test -n -0"
alias run="./manage.py runserver"
bindkey "^R" history-incremental-pattern-search-backward
cd .

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# DATABASE ALIASES
# list all current dbs
alias listdb="psql -c 'select datname from pg_database where datistemplate=false;'"
  
# copy a db, useful for testing PRs locally that involve migrations
# this is super useful for pulling down and testing PRs locally that may involve migrations without having to re-pull data down from champagne later when you are done testing the PR
# usage: copydb (current db name) (new db name)
# copydb mats_db testing_pr_3123
copydb() {
  createdb -O $USERNAME -T $1 $2
}
  
# sets current active db, tricky part is it is only for that terminal so if you have multiple open it can get fun
setdb() {
  export DATABASE_URL=postgresql://$USERNAME@localhost:5432/$1
}
  
# which db is currently set as my active db
whichdb() {
  echo $DATABASE_URL
}
