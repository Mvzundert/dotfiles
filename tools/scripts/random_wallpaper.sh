#!/bin/bash

# --- Configuration ---
DIR="/home/marzun/Pictures/wallpapers/Marske"
SYMLINK_PATH="$HOME/.config/scripts/current_wallpaper.jpg"
TIMEOUT=2000 # Time in milliseconds (2 seconds)

if [ ! -d "$DIR" ]; then
    [ -x "$(command -v dunstify)" ] && dunstify -u critical -t $TIMEOUT "Wallpaper Error" "Directory $DIR not found"
    exit 1
fi

# --- 1. Detect Compositor ---
if hyprctl monitors >/dev/null 2>&1; then
    MONITORS=$(hyprctl monitors -j | jq -r '.[] | .name')
    [ -z "$MONITORS" ] && MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')
elif swaymsg -t get_outputs >/dev/null 2>&1; then
    MONITORS=$(swaymsg -t get_outputs | jq -r '.[] | .name')
else
    [ -x "$(command -v dunstify)" ] && dunstify -u critical -t $TIMEOUT "Wallpaper Error" "No compositor detected"
    exit 1
fi

# --- 2. Logic ---
if [ "$1" == "--same" ]; then
    RANDOM_PIC=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" \) | shuf -n 1)

    for MONITOR in $MONITORS; do
        swww img "$RANDOM_PIC" --outputs "$MONITOR" --transition-type random --transition-step 90 --transition-duration 1.2
    done

    # Update the local symlink only
    ln -sf "$RANDOM_PIC" "$SYMLINK_PATH"
    # Ensure the actual image is readable by SDDM
    chmod 644 "$RANDOM_PIC"

else
    for MONITOR in $MONITORS; do
        RANDOM_PIC=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" \) | shuf -n 1)

        swww img "$RANDOM_PIC" --outputs "$MONITOR" --transition-type random --transition-step 90 --transition-duration 1.2

        # Every loop updates the symlink; the last monitor processed becomes the lockscreen
        ln -sf "$RANDOM_PIC" "$SYMLINK_PATH"
        chmod 644 "$RANDOM_PIC"
    done
fi

# Notify
if command -v dunstify >/dev/null 2>&1; then
    dunstify -a "System" -i "$SYMLINK_PATH" -t $TIMEOUT "Wallpaper Updated" "SDDM & Lockscreen Synced"
fi
