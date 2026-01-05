#!/bin/bash

# --- Configuration ---
DIR="/home/marzun/Pictures/wallpapers/Marske"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper.jpg"

# --- 1. Randomize & Pick ---
RANDOM_PIC=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" \) | shuf -n 1)

if [ -z "$RANDOM_PIC" ]; then
    [ -x "$(command -v dunstify)" ] && dunstify -u critical "Wallpaper Error" "No images found in $DIR"
    exit 1
fi

FILE_NAME=$(basename "$RANDOM_PIC")

# --- 2. Update Wallpaper (swww) ---
# We use 'random' here to rotate through all animation styles
swww img "$RANDOM_PIC" \
    --transition-type random \
    --transition-step 90 \
    --transition-fps 60 \
    --transition-duration 1.2

# --- 3. Update the Symbolic Link ---
ln -sf "$RANDOM_PIC" "$SYMLINK_PATH"

# --- 4. Send Dunst Notification ---
# Only sends if dunstify is installed
if command -v dunstify >/dev/null 2>&1; then
    dunstify -a "System" -i "$RANDOM_PIC" -r 9910 "Wallpaper Updated" "Current: $FILE_NAME"
fi

echo "Success: $RANDOM_PIC applied with a random transition."
