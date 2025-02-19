# initialize autocomplete
autoload -Uz compinit promptinit add-zsh-hook

# Enable prompt substitution, to enable function and variable calling from prompts
setopt prompt_subst

# Initiate the prompt magic
promptinit

source $ZSH/plugins/fzf-tab/fzf-tab.plugin.zsh

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)

if [[ "$(uname)" == 'Linux' || "$(uname)" == 'linux-gnu'  ]]; then
  setopt extendedglob

  # shellcheck disable=SC1073
  for dump in ~/.zcompdump(N.mh+24); do
    compinit
  done

  compinit -C
elif [[ "$(uname)" == 'Darwin' ]]; then
    if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
       compinit
      else
        compinit -C
      fi
fi

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
