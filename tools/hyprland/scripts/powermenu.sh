#!/bin/sh

# Options for the menu
options="Shutdown\nReboot\nSuspend\nLogout"

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
"Suspend")
    systemctl suspend
    ;;
"Logout")
    hyprctl exit
    ;;
*)
    # Do nothing if the user cancels or selects an invalid option
    exit 0
    ;;
esac
