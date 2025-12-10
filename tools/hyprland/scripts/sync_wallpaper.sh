#!/bin/bash

# Define the fixed location for the symbolic link
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper.jpg"

# 1. Get the active wallpaper path from hyprpaper
# The output is like: 'eDP-1 = /path/to/image.jpg'
# We use 'grep' to find the line and 'awk' to split it at the ' = ' and take the second part (the path).

# Note: This version assumes you want the wallpaper from the *first* monitor listed
# if you have multiple monitors with different wallpapers.
WALLPAPER_INFO=$(hyprctl hyprpaper listactive | grep -m 1 '=')
WALLPAPER_PATH=$(echo "$WALLPAPER_INFO" | awk -F ' = ' '{print $2}')

# Check if a path was actually found
if [ -z "$WALLPAPER_PATH" ]; then
    echo "Error: Could not retrieve active wallpaper path from hyprpaper."
    # If a path isn't found, you might want hyprlock to fall back to a safe image.
    # We will still exit here to avoid creating a broken symlink.
    exit 1
fi

# 2. Update the symbolic link
# Use '-fn' (force, no dereference) to safely create or replace the symlink
ln -sf "$WALLPAPER_PATH" "$SYMLINK_PATH"

echo "Wallpaper symlink updated: $WALLPAPER_PATH -> $SYMLINK_PATH"
