# -------------------------------------------------------------------
# Switch php and unlink the "default" version.
# -------------------------------------------------------------------
function switchphp() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
       # Custom Linux Aliases
       if [[ -f /usr/bin/php ]]; then
           sudo rm /usr/bin/php
       fi

       sudo ln -s /usr/bin/php$1 /usr/bin/php

    elif [[ $OSTYPE == "darwin"* ]]; then
        # Custom MAC OSX Aliases
        brew unlink php && brew link --force --overwrite php@$1
    fi
}

# -------------------------------------------------------------------
# Checks if phpunit is installed in vendor folder or if we should use global one.
# -------------------------------------------------------------------
function get_phpunit_install() {
    if [[ -f vendor/bin/pest ]]; then
        echo './vendor/bin/pest'
    elif [[ -f vendor/bin/paratest ]]; then
        echo './vendor/bin/paratest'
    elif [[ -f vendor/bin/phpunit ]]; then
        echo './vendor/bin/phpunit'
    else
        echo 'phpunit'
    fi
}

# -------------------------------------------------------------------
# Checks if phpstan is installed in vendor folder or if we should use global one.
# -------------------------------------------------------------------
function get_stan_install() {
    if [[ -f vendor/bin/phpstan ]]; then
        echo './vendor/bin/phpstan'    
    else
        echo 'phpstan'
    fi
}
