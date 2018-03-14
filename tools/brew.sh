#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"gs should pass through the the `brew list check`
fi

echo "\n\nInstalling homebrew taps..."
echo "=============================="

taps=(
    homebrew/core
    homebrew/php
    homebrew/bundle
    homebrew/services
    caskroom/cask
)

for tap in "${taps[@]}"; do
    if brew tap "$tap" > /dev/null 2>&1; then
        echo "$tap already installed... skipping."
    else
        brew tap $tap
    fi
done

echo "\n\nBrewing formulas..."
echo "=============================="

formulas=(
    git
    ack
    icu4c
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
    tmate
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
    wget
    fswatch
    libxml2
    pkg-config
    zsh
    zsh-completions
    gdbm
    libyaml
    python
    gettext
    lnav
    readline
    ctags
    youtube-dl
    ffmpeg
    php71
    php71-xdebug
    php-cs-fixer
    phplint
    mysql
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
