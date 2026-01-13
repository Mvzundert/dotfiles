#!/bin/bash

# Options for the menu
options="Lock\nReboot\nShutdown\nSuspend\nLogout"

# Get the selected option using wofi
selected_option=$(echo -e "$options" | wofi --show dmenu --prompt "Power Menu" --insensitive --sort-method=no-sort)

# --- Detect Compositor ---
if hyprctl monitors >/dev/null 2>&1; then
    COMPOSITOR="hyprland"
elif swaymsg -t get_outputs >/dev/null 2>&1; then
    COMPOSITOR="sway"
else
    COMPOSITOR="none"
fi

# --- Execute Action ---
case "$selected_option" in
"Shutdown")
    systemctl poweroff
    ;;
"Reboot")
    systemctl reboot
    ;;
"Lock")
    if [ "$COMPOSITOR" == "hyprland" ]; then
        hyprlock
    else
        # Sway uses swaylock
        swaylock -i ~/.config/scripts/current_wallpaper.jpg
    fi
    ;;
"Suspend")
    systemctl suspend
    ;;
"Logout")
    if [ "$COMPOSITOR" == "hyprland" ]; then
        hyprctl dispatch exit
    elif [ "$COMPOSITOR" == "sway" ]; then
        swaymsg exit
    fi
    ;;
*)
    exit 0
    ;;
esac
