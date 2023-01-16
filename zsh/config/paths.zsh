# -------------------------------------------------------------------
# Add home bin folder to PATH
# -------------------------------------------------------------------
HOME_BIN="$HOME/bin"

if [[ -d $HOME_BIN ]]; then
    if ! [[ :$PATH: == *:$HOME_BIN:* ]]; then
        export PATH="$HOME_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add local bin folder to PATH
# -------------------------------------------------------------------
USER_LOCAL_BIN="/usr/local/bin"

if [[ -d $USER_LOCAL_BIN ]]; then
    if ! [[ :$PATH: == *:$USER_LOCAL_BIN:* ]]; then
        export PATH="$USER_LOCAL_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add local sbin folder to PATH
# -------------------------------------------------------------------
USER_LOCAL_SBIN="/usr/local/sbin"

if [[ -d $USER_LOCAL_SBIN ]]; then
    if ! [[ :$PATH: == *:$USER_LOCAL_SBIN:* ]]; then
        export PATH="$USER_LOCAL_SBIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add usr sbin folder to PATH
# -------------------------------------------------------------------
USER_SBIN="/usr/sbin"

if [[ -d $USER_SBIN ]]; then
    if ! [[ :$PATH: == *:$USER_SBIN:* ]]; then
        export PATH="$USER_SBIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add composer bin folder to PATH
# -------------------------------------------------------------------
COMPOSER_BIN="$HOME/.composer/vendor/bin"

if [[ -d $COMPOSER_BIN ]]; then
    if ! [[ :$PATH: == *:$COMPOSER_BIN:* ]]; then
        export PATH="$COMPOSER_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add ruby bin folder to PATH
# -------------------------------------------------------------------
RUBY_BIN="/usr/local/opt/ruby/bin"

if [[ -d $RUBY_BIN ]]; then
    if ! [[ :$PATH: == *:$RUBY_BIN:* ]]; then
        export PATH="$RUBY_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add mysql-client bin folder to PATH
# -------------------------------------------------------------------
MYSQLCLIENT_BIN="/usr/local/opt/mysql-client/bin"

if [[ -d $MYSQLCLIENT_BIN ]]; then
    if ! [[ :$PATH: == *:$MYSQLCLIENT_BIN:* ]]; then
        export PATH="$MYSQLCLIENT_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add python bin folder to PATH
# -------------------------------------------------------------------
PYTHON_BIN="/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin"

if [[ -d $PYTHON_BIN ]]; then
    if ! [[ :$PATH: == *:$PYTHON_BIN:* ]]; then
        export PATH="$PYTHON_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add php8.0 bin folder to PATH
# -------------------------------------------------------------------
PHP_8_0_BIN="/usr/local/opt/php@8.0/bin"

if [[ -d PHP_8_0_BIN ]]; then
    if ! [[ :$PATH: == *:PHP_8_0_BIN:* ]]; then
        export PATH="PHP_8_0_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add php8.0 sbin folder to PATH
# -------------------------------------------------------------------
PHP_8_0_SBIN="/usr/local/opt/php@8.0/sbin"

if [[ -d PHP_8_0_SBIN ]]; then
    if ! [[ :$PATH: == *:PHP_8_0_SBIN:* ]]; then
        export PATH="PHP_8_0_SBIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Yarn
# -------------------------------------------------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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