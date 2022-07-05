# -------------------------------------------------------------------
# Composer path
# -------------------------------------------------------------------
export PATH="$PATH:$HOME/.composer/vendor/bin"

# -------------------------------------------------------------------
# Local bin
# -------------------------------------------------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# -------------------------------------------------------------------
# Python paths
# -------------------------------------------------------------------
export PATH=/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin:$PATH

# -------------------------------------------------------------------
# NVM and NPM
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if this gets sourced multiple times
# by checking whether __init_nvm is a function.
# -------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"

NVM_HOMEBREW="/usr/local/opt/nvm"
[ -s "$NVM_HOMEBREW/nvm.sh" ] && \. "$NVM_HOMEBREW/nvm.sh" --no-use
[ -s "$NVM_HOMEBREW/etc/bash_completion.d/nvm" ] && . "$NVM_HOMEBREW/etc/bash_completion.d/nvm"

export NPM_DIR="$HOME/.npm"

# -------------------------------------------------------------------
# Yarn
# -------------------------------------------------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# -------------------------------------------------------------------
# Ruby
# -------------------------------------------------------------------
# Add ruby bin folder to PATH
RUBY_BIN="/usr/local/opt/ruby/bin"

if [[ -d $RUBY_BIN ]]; then
    if ! [[ :$PATH: == *:$RUBY_BIN:* ]]; then
        export PATH="$RUBY_BIN:$PATH"
    fi
fi
