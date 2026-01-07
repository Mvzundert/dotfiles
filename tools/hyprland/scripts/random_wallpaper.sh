#!/bin/bash

# --- Configuration ---
DIR="/home/marzun/Pictures/wallpapers/Marske"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper.jpg"
TIMEOUT=2000 # Time in milliseconds (2 seconds)

if [ ! -d "$DIR" ]; then
    [ -x "$(command -v dunstify)" ] && dunstify -u critical -t $TIMEOUT "Wallpaper Error" "Directory $DIR not found"
    exit 1
fi

# --- 1. Get List of Monitors ---
MONITORS=$(hyprctl monitors -j | jq -r '.[] | .name')
if [ -z "$MONITORS" ]; then
    MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')
fi

# --- 2. Logic: Same vs Different ---
if [ "$1" == "--same" ]; then
    # Pick ONE random picture for ALL monitors
    RANDOM_PIC=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" \) | shuf -n 1)
    FILE_NAME=$(basename "$RANDOM_PIC")

    for MONITOR in $MONITORS; do
        swww img "$RANDOM_PIC" --outputs "$MONITOR" --transition-type random --transition-step 90 --transition-fps 60 --transition-duration 1.2

        if command -v dunstify >/dev/null 2>&1; then
            dunstify -a "System" \
                -i "$RANDOM_PIC" \
                -t $TIMEOUT \
                -h "string:x-dunst-stack-tag:wall_$MONITOR" \
                "Wallpaper: $MONITOR" \
                "$FILE_NAME"
        fi
    done

    ln -sf "$RANDOM_PIC" "$SYMLINK_PATH"
else
    # Pick a DIFFERENT picture for EACH monitor
    for MONITOR in $MONITORS; do
        RANDOM_PIC=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" \) | shuf -n 1)
        FILE_NAME=$(basename "$RANDOM_PIC")

        swww img "$RANDOM_PIC" --outputs "$MONITOR" --transition-type random --transition-step 90 --transition-fps 60 --transition-duration 1.2

        if command -v dunstify >/dev/null 2>&1; then
            dunstify -a "System" \
                -i "$RANDOM_PIC" \
                -t $TIMEOUT \
                -h "string:x-dunst-stack-tag:wall_$MONITOR" \
                "Wallpaper: $MONITOR" \
                "$FILE_NAME"
        fi

        ln -sf "$RANDOM_PIC" "$SYMLINK_PATH"
    done
fi
