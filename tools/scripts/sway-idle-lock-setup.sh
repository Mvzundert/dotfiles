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
# Logic: Locks at 2m, Dims at 5m, Never Sleeps (No DPMS).
echo "Creating idle toggle script..."
cat <<'EOF' >"$SCRIPT_DIR/idle.sh"
#!/bin/bash

# --- Configuration Variables ---
TEST_MODE=false
WALLPAPER="$HOME/.config/scripts/current_wallpaper.jpg"
LOCK_CMD="swaylock --image $WALLPAPER --scaling fill --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --show-failed-attempts --daemonize"

# --- Define Timers ---
if [ "$TEST_MODE" = true ]; then
    TIME_LOCK=5
    TIME_DIM=10
else
    TIME_LOCK=120
    TIME_DIM=300
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
    # Reset brightness immediately if killed while dimmed
    brightnessctl set 100%
else
    # Start it (Caffeine OFF)
    if [ "$IDLE_DAEMON" == "swayidle" ]; then
        swayidle -w \
            timeout $TIME_LOCK "$LOCK_CMD" \
            timeout $TIME_DIM 'brightnessctl set 10%' resume 'brightnessctl set 100%' \
            before-sleep "$LOCK_CMD" &
    else
        hypridle &
    fi
fi

# Signal Waybar to refresh the caffeine module (Signal 10)
pkill -RTMIN+10 waybar
EOF

# 4. Create a "Lock Now" shortcut script
echo "Creating lock_now script..."
cat <<EOF >"$SCRIPT_DIR/lock_now.sh"
#!/bin/bash
swaylock --image "$WALLPAPER" --scaling fill --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --show-failed-attempts
EOF

# 5. Set Permissions
echo "Setting permissions..."
chmod +x "$SCRIPT_DIR/idle.sh"
chmod +x "$SCRIPT_DIR/lock_now.sh"
chown -R "$USER_NAME:$USER_NAME" "$CONFIG_DIR"

# 6. Final Instructions
echo "-------------------------------------------------------"
echo "Setup Complete!"
echo "-------------------------------------------------------"
echo "To auto-start the idle manager, add this to your sway config:"
echo "exec $SCRIPT_DIR/idle.sh"
echo ""
echo "To bind a lock key (e.g., Win+L):"
echo "bindsym Mod4+l exec $SCRIPT_DIR/lock_now.sh"
echo ""
echo "Note: The screen will Dim but NEVER sleep (DPMS off removed)."
echo "-------------------------------------------------------"
