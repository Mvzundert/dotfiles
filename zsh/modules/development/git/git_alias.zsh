# -------------------------------------------------------------------
# Git alias
# -------------------------------------------------------------------
alias gst="git status"
alias gaa="git add --all"
alias ga="git add"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gup="git pull --rebase"
alias gpl="git pull"
alias gfa="git fetch --all --prune"
alias gcmsg="git commit -m"
alias gp="git push"
alias gpt="git push && git push --tags"

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
# for fun and games
# -------------------------------------------------------------------
alias darth='gp --force'
alias yolo='gaa && git commit -m "$(curl -s https://whatthecommit.com/index.txt)" && darth'
