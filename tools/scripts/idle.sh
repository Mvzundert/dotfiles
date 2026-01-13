#!/bin/bash

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
            timeout 300 'brightnessctl set 10%' resume 'brightnessctl set 100%' \
            timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' &
    else
        hypridle &
    fi
fi

# Signal Waybar to refresh the caffeine module (Signal 10)
pkill -RTMIN+10 waybar
