#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"gs should pass through the the `brew list check`
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    ack
    icu4c
    mysql
    reattach-to-user-namespace
    autoconf
    jpeg
    node
    ruby
    dnsmasq
    automake
    libevent
    openssl
    sqlite
    coreutils
    libgpg-error
    openssl@1.1
    tmux
    ctop
    libksba
    pcre
    unixodbc
    drush
    libpng
    perl
    vim
    freetype
    libtool
    php70
    wget
    fswatch
    libxml2
    pkg-config
    zsh
    gdbm
    libyaml
    python
    zsh-completions
    gettext
    lnav
    readline
    ctags
    php-cs-fixer
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
