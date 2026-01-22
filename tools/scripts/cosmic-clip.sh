#!/bin/bash

# Ensure we can find our binaries
export PATH=$PATH:/usr/local/bin

case "$1" in
pick)
    # Check if daemon is even running
    if ! systemctl --user is-active --quiet cosmic-clipboard.service; then
        notify-send "Clipboard Error" "Watcher service is not running. Restarting..."
        systemctl --user restart cosmic-clipboard.service
    fi

    # Get list from cliphist
    # Using -dmenu for wofi to ensure it returns the string
    selection=$(cliphist list | wofi --dmenu --prompt "Clipboard History")

    if [[ -n "$selection" ]]; then
        echo "$selection" | cliphist decode | wl-copy
        notify-send "Clipboard" "Item copied to buffer"
    fi
    ;;
clear)
    cliphist wipe
    wl-copy -c
    notify-send -u low "Clipboard" "History cleared"
    ;;
status)
    systemctl --user status cosmic-clipboard.service
    ;;
*)
    echo "Usage: $0 {pick|clear|status}"
    exit 1
    ;;
esac
