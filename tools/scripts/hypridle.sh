#!/bin/bash

# Define the path to the hypridle service/executable
HYPRIDLE_CMD="hypridle"

# Check if hypridle is running
if pgrep -x "$HYPRIDLE_CMD" >/dev/null; then
    # If hypridle is running (Caffeine OFF), stop it (Caffeine ON)
    pkill "$HYPRIDLE_CMD"
    notify-send "Caffeine Mode" "Hypridle stopped. Caffeine ON ☕"
else
    # If hypridle is not running (Caffeine ON), start it (Caffeine OFF)
    "$HYPRIDLE_CMD" &
    notify-send "Caffeine Mode" "Hypridle started. Caffeine OFF"
fi

sleep 0.2
