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
# Add usr bin folder to PATH
# -------------------------------------------------------------------
USR_BIN="/usr/bin"

if [[ -d $USR_BIN ]]; then
    if ! [[ :$PATH: == *:$USR_BIN:* ]]; then
        export PATH="$USR_BIN:$PATH"
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
# Add WSL local bin folder to PATH
# -------------------------------------------------------------------
WSL_LOCAL_BIN="/$HOME/.local/bin/"

if [[ -d $WSL_LOCAL_BIN ]]; then
    if ! [[ :$PATH: == *:$WSL_LOCAL_BIN:* ]]; then
        export PATH="$WSL_LOCAL_BIN:$PATH"
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
# Add rbenv to PATH
# -------------------------------------------------------------------
RBENV="$HOME/.rbenv/bin"

if [[ -d $RBENV ]]; then
    if ! [[ :$PATH: == *:$RBENV:* ]]; then
        export PATH="$RBENV:$PATH"
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
# Add Cargo (Rust)  bin folder to PATH
# -------------------------------------------------------------------
RUST_BIN="$HOME/.cargo/bin"

if [[ -d $RUST_BIN ]]; then
    if ! [[ :$PATH: == *:$RUST_BIN:* ]]; then
        export PATH="$RUST_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Add GO  bin folder to PATH
# -------------------------------------------------------------------
GO_BIN="/usr/local/go/bin"

if [[ -d $GO_BIN ]]; then
    if ! [[ :$PATH: == *:$GO_BIN:* ]]; then
        export PATH="$GO_BIN:$PATH"
    fi
fi

# -------------------------------------------------------------------
# Init OPAM if we can find it. 
# -------------------------------------------------------------------
OPAM_BIN="$home/.opam/opam-init/init.zsh"

if [[ -r $OPAM_BIN ]]; then
    source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
fi
