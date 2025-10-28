#!/bin/bash

# Configuration
LAPTOP_MONITOR="eDP-1"

# Log file (optional, for debugging the systemd service)
LOG_FILE="/tmp/hyprland_lid_log.txt"

# Check current lid state via /proc/acpi/button/lid/LID0/state
# 'grep -q' checks if the string is present and exits with 0 (true) or 1 (false)
LID_STATE=$(cat /proc/acpi/button/lid/LID0/state | grep -i open)

# Get the current status of the monitor from hyprctl (0 for disabled, 1 for enabled)
MON_STATUS=$(hyprctl monitors | grep "$LAPTOP_MONITOR" -A 4 | grep "Monitor $LAPTOP_MONITOR" -A 4 | grep "disabled" | wc -l)

# 1. LID IS OPEN
if [[ $LID_STATE ]]; then
    # Lid is open, ensure monitor is enabled
    if [[ $MON_STATUS -ne 0 ]]; then
        # Monitor is currently disabled, enable it
        /usr/bin/hyprctl keyword monitor "$LAPTOP_MONITOR, preferred, auto, 1" >>"$LOG_FILE" 2>&1
        echo "$(date): Lid opened. Monitor ENABLED." >>"$LOG_FILE"
    fi

# 2. LID IS CLOSED
else
    # Only disable if the external monitor is NOT connected/active.
    # Note: If an external screen is connected, you usually want to keep the lid closed monitor disabled,
    # but the external screen active. Hyprland handles this well, but some users prefer explicit checks.

    # We disable the internal monitor
    /usr/bin/hyprctl keyword monitor "$LAPTOP_MONITOR, disable" >>"$LOG_FILE" 2>&1
    echo "$(date): Lid closed. Monitor DISABLED." >>"$LOG_FILE"
fi
