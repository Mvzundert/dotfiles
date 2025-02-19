# -------------------------------------------------------------------
# fish
# -------------------------------------------------------------------
alias reload='exec fish'

# -------------------------------------------------------------------
# Config
# -------------------------------------------------------------------
alias dotc="vim ~/.dotfiles/"
alias sshc="vim ~/.ssh/config"
alias buuc='brew update && brew upgrade && brew cleanup'
alias bbd='brew bundle dump --describe -f'
alias t='sesh connect $(sesh list -c | fzf --height 40% --border)'

# -------------------------------------------------------------------
# System
# -------------------------------------------------------------------
alias myip='wget http://ipinfo.io/ip -qO -'
alias size='du -sh * | sort -r -n | ack "[0-9][G|M]"'
alias ifa="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias ifi="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: inactive'"
alias ifip="ifconfig | ack 'inet.*broadcast'"
alias t='sesh connect $(sesh list -c | fzf --height 40% --border)'

# -------------------------------------------------------------------
# Misc alias
# -------------------------------------------------------------------
alias ytmp3="youtube-dl -x --audio-format mp3 $1"

# -------------------------------------------------------------------
# Git alias
# -------------------------------------------------------------------
alias gst="git status"
alias gaa="git add --all"
alias ga="git add"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gup="git pull"
alias gfa="git fetch --all --prune"
alias gcmsg="git commit -m"
alias gp="git push"
alias gpt="git push && git push --tags"
alias guh='git_update_hooks'

# -------------------------------------------------------------------
# Github CLI
# -------------------------------------------------------------------
# Github PR's reviewing
alias ghprl="gh pr list"

# Github Diffs
alias ghd="gh pr diff"
alias ghdp="gh pr diff --patch"
alias ghdm="gh pr diff --name-only"
alias ghdw="gh pr diff --web"

alias ghpc="gh pr checkout"
alias ghprm="gh pr review --approve && gh pr merge"
alias ghprv="gh pr view"
alias ghprc="gh pr checks"

# Github PR's creating
alias ghpr="gh pr create --fill -a '@me'"

# Github actions
alias ghl="gh run list"
alias ghrr="gh run rerun"

# Github workflows
alias ghwf="gh workflow list"
alias ghr="gh workflow run"

# -------------------------------------------------------------------
# Submodule
# -------------------------------------------------------------------
alias gsum="git submodule update --remote --merge"
alias gprs="git pull --recurse-submodules"
alias gsur="git submodule update --recursive --remote"

# -------------------------------------------------------------------
# Diff and graph's
# -------------------------------------------------------------------
alias gd="git diff"
alias gds="git diff --staged"
alias gdch="git -c core.fileMode=false diff"
alias glgp="git log --stat --color -p"
alias glol="git log --graph --abbrev-commit --decorate --date=relative --all"
alias glog="git log --all --decorate --oneline --graph"
alias glc="git log --decorate --oneline --graph --show-signature"
alias gcount=" git shortlog -n -s -e"

# -------------------------------------------------------------------
# Checkout branches
# -------------------------------------------------------------------
alias gcd='git checkout develop'
alias gcs='git checkout staging'
alias gcm='git checkout master'

# -------------------------------------------------------------------
# Rebase all the things
# -------------------------------------------------------------------
alias grbd='git rebase develop'
alias grbs='git rebase staging'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

# -------------------------------------------------------------------
# Stash all the things
# -------------------------------------------------------------------
alias gstash='git stash'

# -------------------------------------------------------------------
# for fun and games (Here be dragons)
# -------------------------------------------------------------------
alias darth='gp --force'
alias yolo='gaa && git commit -m "$(curl -s https://whatthecommit.com/index.txt)" && darth'

# -------------------------------------------------------------------
# Composer
# -------------------------------------------------------------------
alias cigr="composer info | ack"
alias ciggr="composer global info | ack"
alias symsec="symfony security:check"
alias ci='composer install'
alias cu='composer update'
alias cda="composer dump-autoload"

# -------------------------------------------------------------------
# Docker
# -------------------------------------------------------------------
alias dockers='open -a Docker'
alias dcrm='docker rm $(docker ps -a -q)'
alias dcirm='docker rmi $(docker images -q)'
alias dcw='docker compose exec workspace bash'
alias dcs='docker compose stop'
alias dcu='docker compose up -d'
alias dcuv='docker compose up'
alias dcb='docker compose build'
alias dcrn='docker exec -it crb_dock_nginx bash -c "nginx -s reload"'

# -------------------------------------------------------------------
# Laravel artisan
# -------------------------------------------------------------------
alias artg="art list | ack"
alias artr="art route:list"
alias artrg="art route:list | ack"
alias artmr="art migrate:fresh"
alias artmrs="art migrate:refresh --seed"
# Get all translations from app and resourses
alias arttg="art translations:find && art translations:import"
# Clean all translations
alias arttc="art translations:clean"
# Export translations
alias artte="art translations:export"
# Start the queue worker once
alias artqw="art queue:work --once"
# Do all the IDE helper stuff
alias artide=" art ide-helper:models && art ide-helper:meta && art ide-helper:generate"

# -------------------------------------------------------------------
# Artisan when using Sail
# -------------------------------------------------------------------
alias sail="[ -f sail ] && bash sail || bash vendor/bin/sail"
alias sart="sail artisan"
alias sdcu="sail up -d"
alias sdcs="sail stop"
alias sdcd="sail up"

# -------------------------------------------------------------------
# Artisan shortcuts when using Sail
# -------------------------------------------------------------------
alias sartg="sart list | ack"
alias sartr="sart route:list"
alias sartrg="sart route:list | ack"
alias sartmr="sart migrate:refresh"
alias sartmrs="sart migrate:refresh --seed"
alias sartqw="sart queue:work --once"

# -------------------------------------------------------------------
# Composer when using sail
# -------------------------------------------------------------------
alias sci="sail composer install"
alias scu="sail composer update"
alias scr="sail composer require"

# -------------------------------------------------------------------
# NPM when using sail
# -------------------------------------------------------------------
alias sni="sail npm install"
alias snu="sail npm update"
alias snt="sail npm run test"
alias snw="sail npm run watch"
alias snb="sail npm run build"
alias snd="sail npm run dev"

# -------------------------------------------------------------------
# Elixir Mix Alias
# -------------------------------------------------------------------
alias mpn='mix phx.new'
alias mps='mix phx.server'
alias mpgc='mix phx.gen.context'

# -------------------------------------------------------------------
# Elixir Ecto Alias
# -------------------------------------------------------------------
alias mec='mix ecto.create'
alias megm='mix ecto.gen.migration'
alias mem='mix ecto.migrate'
alias mrs='mix run priv/repo/seeds.exs'

# -------------------------------------------------------------------
# Hugo alias 
# -------------------------------------------------------------------
alias hsd="hugo server --buildDrafts --disableFastRender --navigateToChanged"
alias hsw="hugo server --disableFastRender --navigateToChanged"
alias hb="hugo build -d public"

# -------------------------------------------------------------------
# Alias Python 3 and pip3 because we also have
# Python 2 and Pip installed for legacy stuff.
# -------------------------------------------------------------------
alias python="python3"
alias pip="pip3"

# -------------------------------------------------------------------
# Some default commands
# -------------------------------------------------------------------
alias pserve="python -m http.server 80"   # Start a webserver with the current Dir as root.
alias pup="pip3 install --user --upgrade" # to upgrade installed packages.
