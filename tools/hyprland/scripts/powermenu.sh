#!/bin/sh

# Options for the menu
options="Lock\nReboot\nShutdown\nSuspend\nLogout"

# Get the selected option using wofi
selected_option=$(echo -e "$options" | wofi --show dmenu --prompt "Power Menu")

# Execute the action based on the selected option
case "$selected_option" in
"Shutdown")
    systemctl poweroff
    ;;
"Reboot")
    systemctl reboot
    ;;
"Lock")
    hyprlock
    ;;
"Suspend")
    systemctl suspend
    ;;
"Logout")
    hyprctl dispatch exit
    ;;
*)
    # Do nothing if the user cancels or selects an invalid option
    exit 0
    ;;
esac
