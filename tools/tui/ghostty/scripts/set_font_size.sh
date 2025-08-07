#!/bin/sh

# Detect the operating system
OS=$(uname)

# Set default font size
FONT_SIZE=20

# Set font size based on the operating system
case "$OS" in
Linux)
    FONT_SIZE=14
    ;;
Darwin)
    FONT_SIZE=20
    ;;
*)
    FONT_SIZE=20
    ;;
esac

# Write the configuration file
cat <<EOL >$DOTFILES/tools/tui/ghostty/fonts
# Font size
font-size=$FONT_SIZE
font-family="JetBrains Mono Nerd Font"
font-feature=+liga
cursor-style=block
adjust-underline-position=4
EOL
