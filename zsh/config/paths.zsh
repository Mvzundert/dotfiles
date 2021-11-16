# -------------------------------------------------------------------
# Composer path
# -------------------------------------------------------------------
export PATH="$PATH:$HOME/.composer/vendor/bin"

# -------------------------------------------------------------------
# Local bin
# -------------------------------------------------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# -------------------------------------------------------------------
# NVM and NPM
# -------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
