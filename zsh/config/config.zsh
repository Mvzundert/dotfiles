# DO NOT EDIT THIS FIL#E
# duplicate this file in zsh/config/zshconfig
# to enable/add your own custom configuration
#
# initialize autocomplete
autoload -Uz compinit add-zsh-hook

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)

if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

# Base16 shell setup
 BASE16_SHELL=$ZSH/plugins/base16_shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Disable globbing on the remote path.
alias scpng='noglob scp_wrap'
function scp_wrap {
  local -a args
  local i
  for i in "$@"; do case $i in
    (*:*) args+=($i) ;;
    (*) args+=(${~i}) ;;
  esac; done
  command scp "${(@)args}"
}

# Remove composer memory limit
export COMPOSER_MEMORY_LIMIT=-1
