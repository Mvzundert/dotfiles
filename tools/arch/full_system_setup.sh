#!/bin/bash

# This script automates the setup of a new Arch Linux machine.
# It performs the following steps:
# 1. Installs official packages from a predefined list.
# 2. Installs an AUR helper ('yay') if it's not already present.
# 3. Installs AUR packages from a predefined list.
# 4. Clones a dotfiles repository to a specified location.
# 5. Executes a separate script to create symlinks for the configuration files.
#
# Usage:
#   1. Make this script executable: chmod +x setup_system.sh
#   2. Run the script: ./full_setup_system.sh

# Exit on any error
# set -e

# --- Configuration ---
DOTFILES_REPO="https://github.com/mariusvanzundert/dotfiles.git"
DOTFILES_CLONE_DIR="$HOME/code/dotfiles"
LINK_CONFIGS_SCRIPT="$DOTFILES_CLONE_DIR/tools/arch/install_config.sh"
INSTALL_PACKAGES_SCRIPT="$DOTFILES_CLONE_DIR/tools/arch/install_packages.sh"

# Define the filenames for the package lists (these should be in the same directory as this script)
OFFICIAL_PKG_LIST="pkglist-official.txt"
AUR_PKG_LIST="pkglist-aur.txt"

# --- Main Script Logic ---

# --- Step 1: Clone the dotfiles repository ---
echo "Starting full system setup."

echo "--- Installing Packages ... ---"
if [ ! -x "$INSTALL_PACKAGES_SCRIPT" ]; then
    echo "Error: Symlink script not found or not executable at $INSTALL_PACKAGES_SCRIPT."
    echo "Please ensure the script exists in your dotfiles repository and has executable permissions."
    exit 1
fi

bash "$INSTALL_PACKAGES_SCRIPT"

# --- Step 2: Clone the dotfiles repository ---
echo "--- Cloning dotfiles repository from $DOTFILES_REPO... ---"
if [ -d "$DOTFILES_CLONE_DIR" ]; then
    echo "Dotfiles directory already exists. Skipping clone."
else
    git clone "$DOTFILES_REPO" "$DOTFILES_CLONE_DIR"
    echo "Dotfiles cloned successfully to $DOTFILES_CLONE_DIR."
fi

# --- Step 3: Create symlinks for config files ---
echo "--- Creating symlinks for config files... ---"
if [ ! -x "$LINK_CONFIGS_SCRIPT" ]; then
    echo "Error: Symlink script not found or not executable at $LINK_CONFIGS_SCRIPT."
    echo "Please ensure the script exists in your dotfiles repository and has executable permissions."
    exit 1
fi

bash "$LINK_CONFIGS_SCRIPT"

echo ""
echo "🎉 Setup Finished! Your Arch Linux machine is ready to go. 🎉"
