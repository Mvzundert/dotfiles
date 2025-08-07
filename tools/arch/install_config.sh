#!/bin/bash

# A script to create symbolic links for configuration files.
# This is useful for managing dotfiles in a Git repository.
#
# Usage: ./link_configs.sh
#
# NOTE: This script will overwrite existing files or symlinks in your ~/.config directory.

# --- Configuration ---
# Set the directory where your configuration files (dotfiles) are stored.
# This should be the path to your cloned Git repository.
DOTFILES_DIR="$HOME/dotfiles/tools"

# Set the destination directory where the symlinks will be created.
CONFIG_DIR="$HOME/.config"

# --- Main Logic ---

# Check if the dotfiles directory exists. Exit if not.
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: Dotfiles directory not found at $DOTFILES_DIR"
    echo "Please clone your repository first or update the DOTFILES_DIR variable."
    exit 1
fi

echo "Creating symbolic links from $DOTFILES_DIR to $CONFIG_DIR..."

# Define an array of files and directories to link.
# IMPORTANT: The commas have been removed. Array elements are space-separated in Bash.
FILES_TO_LINK=(
    "nvim"
    "bat"
    "tui/ghostty"
    "tui/alacritty"
    "tui/fastfetch"
    "prompt/starship.toml"
    "git/lazygit"
    "hyprland/hypr"
    "hyprland/rofi"
    "hyprland/waybar"
    "hyprland/dunst"
)

# Loop through the defined list of files and directories
for file in "${FILES_TO_LINK[@]}"; do
    # Define the source and destination paths
    SOURCE_PATH="$DOTFILES_DIR/$file"
    DEST_PATH="$CONFIG_DIR/$file"

    # --- DEBUGGING: Print the paths before the check fails ---
    echo "DEBUG: Checking existence of source path: $SOURCE_PATH"
    # --- END DEBUGGING ---

    # Check if the source file actually exists before linking
    if [ ! -e "$SOURCE_PATH" ]; then
        echo "Warning: Source file/directory not found at $SOURCE_PATH. Skipping."
        continue
    fi

    # Create the symbolic link
    # -s: create a symbolic link (not a hard link)
    # -f: force overwrite if a file or symlink already exists at the destination
    ln -sf "$SOURCE_PATH" "$DEST_PATH"

    # Print a confirmation message
    echo "Linked: $SOURCE_PATH -> $DEST_PATH"
done

echo "Symbolic link creation complete."
