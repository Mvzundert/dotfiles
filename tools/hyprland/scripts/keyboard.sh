#!/bin/bash

KEYBOARD_NAME="framework-laptop-16-keyboard-module---ansi-keyboard"

# Usage: keyboard_control.sh <enable|disable>

if [ "$1" == "disable" ]; then
    # Disable the internal keyboard
    hyprctl keyword input:$KEYBOARD_NAME:events disabled
elif [ "$1" == "enable" ]; then
    # Enable the internal keyboard
    hyprctl keyword input:$KEYBOARD_NAME:events enabled
fi
