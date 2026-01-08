# -------------------------------------------------------------------
# fish
# -------------------------------------------------------------------
alias reload='exec fish'

# -------------------------------------------------------------------
# Config
# -------------------------------------------------------------------
alias dotc="nvim ~/dotfiles/"
alias sshc="nvim ~/.ssh/config"
alias sshs='ssh-search'
alias sshed='cat ~/.ssh/id_ed25519.pub'
alias sshid='cat ~/.ssh/id_rsa.pub'

alias buuc='brew update && brew upgrade && brew cleanup'
alias bbd='brew bundle dump --describe -f'

# -------------------------------------------------------------------
# Pacman alias
# -------------------------------------------------------------------
alias execute_order_66="sudo pacman -Syu"
alias pacl="pacman -Rs $(pacman -Qdtq)"
alias pacc="pacman -Rs $(pacman -Qdtq)"

# -------------------------------------------------------------------
# Program alias
# -------------------------------------------------------------------
alias cat='bat'
alias grep='rg'
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"
alias emacs="nvim"

# -------------------------------------------------------------------
# Darwin only show and hide files
# -------------------------------------------------------------------
alias showFiles "defaults write com.apple.finder AppleShowAllFiles YES; and killall Finder"
alias hideFiles "defaults write com.apple.finder AppleShowAllFiles NO; and killall Finder"

# -------------------------------------------------------------------
# System
# -------------------------------------------------------------------
alias myip='wget http://ipinfo.io/ip -qO -'
alias size='du -sh * | sort -r -n | grep "[0-9][G|M]"'
alias ifa="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias ifi="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: inactive'"
alias ifip="ifconfig | grep 'inet.*broadcast'"
alias t='tmz'

# -------------------------------------------------------------------
# Misc alias
# -------------------------------------------------------------------
alias ytmp3="youtube-dl -x --audio-format mp3 $1"
# Grep for Password from lastpass then add it to clipboard
alias lpc="grep Password | cut -d ':' -f2- | tr -d '[:cntrl:]\n\r ' | wl-copy"
alias mirror='rev'

# -------------------------------------------------------------------
# for fun and games (Here be dragons)
# -------------------------------------------------------------------
alias darth='git push --force'
alias yolo='git add --all && git commit -m "$(curl -s https://whatthecommit.com/index.txt)" && git push --force'
alias fucking="sudo"
alias please="sudo"
alias love="echo 'not war?'"
alias war="echo 'not love?'"
alias execute_order_66="sudo pacman -Syu"
alias coffee="echo 'Error: Heat death of the universe imminent. Please refill beans.'"
alias never="echo 'Gonna give you up...'"

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
# Composer
# -------------------------------------------------------------------
alias cigr="composer info | grep"
alias ciggr="composer global info | grep"
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
alias artg="art list | grep"
alias artr="art route:list"
alias artrg="art route:list | grep"
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
alias sartg="sart list | grep"
alias sartr="sart route:list"
alias sartrg="sart route:list | grep"
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
alias hsd="hugo server --buildDrafts --disableFastRender --navigateToChanged --cleanDestinationDir"
alias hsw="hugo server --disableFastRender --navigateToChanged --cleanDestinationDir"
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
alias pup="pip3 install --user --upgrade" # to upgrade installed pgrepages.
