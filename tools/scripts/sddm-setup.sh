#!/bin/bash

# --- Configuration ---
USER_NAME="marzun"
THEME_NAME="sugar-candy"
THEME_URL="https://github.com/MarianArlt/sddm-sugar-candy/archive/refs/heads/master.tar.gz"
WALLPAPER_LINK="/home/$USER_NAME/.config/scripts/current_wallpaper.jpg"
SYSTEM_BG_DIR="/usr/share/backgrounds/system"
SDDM_LINK="$SYSTEM_BG_DIR/sddm_link.jpg"

echo "Starting SDDM Theme Setup..."

# 1. Install Dependencies (Arch Linux)
echo "Installing dependencies..."
pacman -S --needed sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg --noconfirm

# 2. Create System Directories
echo "Creating directories..."
mkdir -p "$SYSTEM_BG_DIR"
mkdir -p /etc/sddm.conf.d

# 3. Download and Install Sugar Candy Theme
echo "Downloading and installing theme..."
mkdir -p /usr/share/sddm/themes/
curl -L "$THEME_URL" | tar -xz -C /usr/share/sddm/themes/
# Rename the folder to remove the versioning from GitHub
mv /usr/share/sddm/themes/sddm-sugar-candy-master /usr/share/sddm/themes/$THEME_NAME 2>/dev/null

# 4. Create the Symlink Bridge
echo "Setting up symlinks..."
# Ensure the user-side link exists so the system link isn't broken
touch "$WALLPAPER_LINK"
ln -sf "$WALLPAPER_LINK" "$SDDM_LINK"

# 5. Configure SDDM to use the theme
echo "Applying SDDM theme configuration..."
cat <<EOF >/etc/sddm.conf.d/theme.conf
[Theme]
Current=$THEME_NAME
EOF

# 6. Customize Theme Colors and Wallpaper Path
echo "Customizing theme colors..."
THEME_CONFIG="/usr/share/sddm/themes/$THEME_NAME/theme.conf"
sed -i "s|^Background=.*|Background=\"$SDDM_LINK\"|" "$THEME_CONFIG"
sed -i "s|^AccentColor=.*|AccentColor=\"#bb00cc\"|" "$THEME_CONFIG"
sed -i "s|^MainColor=.*|MainColor=\"#880033\"|" "$THEME_CONFIG"
sed -i "s|^FormBackgroundColor=.*|FormBackgroundColor=\"#000000\"|" "$THEME_CONFIG"

# 7. Fix Permissions
# SDDM needs to be able to enter the user's home folders to follow the link
echo "Setting folder permissions for SDDM access..."
chmod 755 "/home/$USER_NAME"
chmod 755 "/home/$USER_NAME/.config"
chmod 755 "/home/$USER_NAME/.config/scripts"
chmod 644 "$WALLPAPER_LINK"
chmod 755 "$SYSTEM_BG_DIR"

echo "-----------------------------------------------"
echo "Done! SDDM is now configured."
echo "Theme: $THEME_NAME"
echo "Wallpaper Link: $SDDM_LINK"
echo "Colors: Purple (#bb00cc) / Red (#880033)"
echo "-----------------------------------------------"
echo "You can test the look by running:"
echo "sddm-greeter --test-mode --theme /usr/share/sddm/themes/$THEME_NAME"
