set fish_greeting
set -g theme_nerd_fonts yes
set -g theme_display_git no
set -U fish_user_paths /Library/Frameworks/Python.framework/Versions/3.6/bin ~/Library/Python/3.6/bin $fish_user_paths

set -x ANDROID_HOME /Users/ahmet/Library/Android/sdk
set path $PATH:$ANDROID_HOME/tools $PATH
set path $PATH:$ANDROID_HOME/platform-tools $PATH

alias code='/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code'

set -x AWS_REGION 'eu-west-2'
set -x NEW_CANDIDATE_FEATURE false

set -x EDITOR vi

alias adb='/Users/ahmet/Library/Android/sdk/platform-tools/adb'

alias synon='launchctl load /Library/LaunchAgents/com.symless.synergy.synergy-service.plist'
alias synoff='launchctl unload /Library/LaunchAgents/com.symless.synergy.synergy-service.plist'

alias t='rubocop -a; rspec'
alias g='guard --no-bundler-warning'

# Source SSH
function ssh-load
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/kyan_deploy
end

alias ios="react-native run-ios"
alias android="react-native run-android"
alias iphonex="react-native run-ios --simulator 'iPhone X'"

alias hosts="vs /etc/hosts"
alias nginxconf="vs /usr/local/etc/nginx/nginx.conf"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Docker
alias dc='docker-compose'
alias dcr='docker-compose run --rm'
alias dcb='docker-compose build'
alias dcu='rm -rf tmp/pids/server.pid; docker-compose up'
alias dce='docker-compose exec'
alias dcl='docker-compose run web /bin/bash'
alias dp='docker system prune'
alias dck='docker-compose kill'
alias dcs='docker-compose stop'
alias dcrmi='docker rmi (docker images --filter "dangling=true" -q) -f'
alias dcrmc='docker rm (docker ps -aq)'
alias dk='docker kill (docker ps -q)'

# CodeClimate

function cc_install
  docker pull codeclimate/codeclimate
end

function cc
  docker run \
  --interactive --tty --rm \
  --env CODECLIMATE_CODE="$PWD" \
  --volume "$PWD":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/cc:/tmp/cc \
  codeclimate/codeclimate analyze
end

function nuke
  artillery quick --count 50 -n 100 $argv
end

# Heroku

function heroku-backup
  heroku pg:backups:capture --app $argv
  heroku pg:backups:download --app $argv
end

function pg-restore
  pg_restore --verbose --clean --no-acl --no-owner -h 127.0.0.1 -U postgres -d $argv latest.dump
end

function pg-dump
  pg_dump -Fc --no-acl --no-owner -h localhost -U postgres $argv > database.dump
end

function startagain
  heroku local:run rake db:drop
  heroku local:run rake db:create
  heroku local:run rake db:migrate
  heroku local:run rake db:seed
end

# Editor
alias vs='open -a /Applications/Visual\ Studio\ Code\ -\ Insiders.app/'

# Git
alias ga='git add -A'
alias gc='git commit -m'
alias gca='git add -A; git commit -m'
alias gs='git status'
alias gd='git diff'
alias gr='git revert'
alias gp='git push'
alias shipit='git push'
alias sync='git fetch upstream;git merge upstream/master'
alias wipeit='git reset --hard'
alias master='git checkout master'
alias staging='git checkout staging'
alias gpr='git pull --rebase'
alias gb='git branch'
alias gpom='git pull origin master'

alias l='ls -la -G'
alias ls='ls -la -G'
alias grep='grep --color=auto'
alias env='env | sort'
alias c='clear'

alias p='cd ~/Projects'
alias mp='cd ~/MyProjects'
alias d='cd /Users/ahmet/desktop'
alias cd..='cd ..'

source ~/.asdf/asdf.fish
