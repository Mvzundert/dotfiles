#!/bin/bash

# --- Configuration Variables ---
# Set this to true to test with 5/10/15 second timers.
# Set back to false for normal 2/5/7 minute use.
TEST_MODE=false

# Update this path to your actual wallpaper file
WALLPAPER="~/.config/scripts/current_wallpaper.jpg"

# Define the lock command for consistency
LOCK_CMD="swaylock --image $WALLPAPER --scaling fill --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --show-failed-attempts --daemonize"

# --- Define Timers ---
if [ "$TEST_MODE" = true ]; then
    TIME_LOCK=5
    TIME_DIM=10
    TIME_OFF=15
else
    TIME_LOCK=120
    TIME_DIM=300
    TIME_OFF=420
fi

# --- Detect Compositor ---
if hyprctl monitors >/dev/null 2>&1; then
    IDLE_DAEMON="hypridle"
elif swaymsg -t get_outputs >/dev/null 2>&1; then
    IDLE_DAEMON="swayidle"
else
    exit 1
fi

# --- Toggle Logic ---
if pgrep -x "$IDLE_DAEMON" >/dev/null; then
    # Kill it (Caffeine ON)
    pkill -x "$IDLE_DAEMON"
else
    # Start it (Caffeine OFF)
    if [ "$IDLE_DAEMON" == "swayidle" ]; then
        swayidle -w \
            timeout $TIME_LOCK "$LOCK_CMD" \
            timeout $TIME_DIM 'brightnessctl set 10%' resume 'brightnessctl set 100%' \
            timeout $TIME_OFF 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
            before-sleep "$LOCK_CMD" &
    else
        hypridle &
    fi
fi

# Signal Waybar to refresh the caffeine module (Signal 10)
pkill -RTMIN+10 waybar
