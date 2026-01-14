#!/bin/bash

# --- Configuration ---
USER_NAME="marzun"
USER_HOME="/home/$USER_NAME"
CONFIG_DIR="$USER_HOME/.config"
SCRIPT_DIR="$CONFIG_DIR/scripts"
WALLPAPER="$SCRIPT_DIR/current_wallpaper.jpg"

echo "Starting Swaylock & Swayidle Setup..."

# 1. Install Dependencies
echo "Installing packages..."
pacman -S --needed swaylock swayidle brightnessctl jq --noconfirm

# 2. Create Directory Structure
echo "Creating directories..."
mkdir -p "$SCRIPT_DIR"

# 3. Create the Idle Management Script (Caffeine Toggle)
# This includes the logic to detect the compositor and the timers.
echo "Creating idle toggle script..."
cat <<'EOF' >"$SCRIPT_DIR/idle_manager.sh"
#!/bin/bash

# Configuration
WALLPAPER="$HOME/.config/scripts/current_wallpaper.jpg"
LOCK_CMD="swaylock --image $WALLPAPER --scaling fill --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --show-failed-attempts --daemonize"

# Detect Compositor
if hyprctl monitors >/dev/null 2>&1; then
    IDLE_DAEMON="hypridle"
elif swaymsg -t get_outputs >/dev/null 2>&1; then
    IDLE_DAEMON="swayidle"
else
    exit 1
fi

# Toggle Logic
if pgrep -x "$IDLE_DAEMON" >/dev/null; then
    pkill -x "$IDLE_DAEMON"
else
    if [ "$IDLE_DAEMON" == "swayidle" ]; then
        swayidle -w \
            timeout 120 "$LOCK_CMD" \
            timeout 300 'brightnessctl set 10%' resume 'brightnessctl set 100%' \
            timeout 420 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
            before-sleep "$LOCK_CMD" &
    else
        hypridle &
    fi
fi

# Signal Waybar
pkill -RTMIN+10 waybar
EOF

# 4. Create a "Lock Now" shortcut script
echo "Creating lock script..."
cat <<EOF >"$SCRIPT_DIR/lock_now.sh"
#!/bin/bash
swaylock --image "$WALLPAPER" --scaling fill --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --show-failed-attempts
EOF

# 5. Set Permissions
echo "Setting permissions..."
chmod +x "$SCRIPT_DIR/idle_manager.sh"
chmod +x "$SCRIPT_DIR/lock_now.sh"
chown -R "$USER_NAME:$USER_NAME" "$CONFIG_DIR"

# 6. Reminder for Sway Config
echo "-------------------------------------------------------"
echo "Setup Complete!"
echo "To auto-start the idle manager, add this to your sway config:"
echo "exec $SCRIPT_DIR/idle_manager.sh"
echo ""
echo "To bind a lock key (e.g., Win+L):"
echo "bindsym Mod4+l exec $SCRIPT_DIR/lock_now.sh"
echo "-------------------------------------------------------"
