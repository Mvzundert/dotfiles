alias cigr="composer info | ack"
alias ciggr="composer global info | ack"

### PHP Unit
alias phpunit='$(get_phpunit_install)'

### Composer
alias ci='composer install'
alias cu='composer update'
alias cda="composer dump-autoload"

# Switch php and unlink the "default" version.
function switchphp() {
    brew unlink php && brew link --force --overwrite php@$1
}

# Checks if phpunit is installed in vendor folder or if we should use global one.
function get_phpunit_install() {
    if [ -f vendor/bin/paratest ]; then
        echo './vendor/bin/paratest'
    elif [ -f vendor/bin/phpunit ]; then
        echo './vendor/bin/phpunit'
    else
        echo 'phpunit'
    fi
}