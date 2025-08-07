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
#   2. Run the script: ./setup_system.sh

# Exit on any error
# set -e

# --- Configuration ---
DOTFILES_REPO="https://github.com/mariusvanzundert/dotfiles.git"
DOTFILES_CLONE_DIR="$HOME/code/dotfiles"
LINK_CONFIGS_SCRIPT="$DOTFILES_CLONE_DIR/tools/arch/install_config.sh"

# Define the filenames for the package lists (these should be in the same directory as this script)
OFFICIAL_PKG_LIST="pkglist-official.txt"
AUR_PKG_LIST="pkglist-aur.txt"

# --- Function to install yay from AUR ---
install_yay() {
    echo "--- 'yay' not found. Installing yay from AUR... ---"

    # Check if git and base-devel are installed (prerequisites for yay)
    if ! pacman -Qs git &>/dev/null || ! pacman -Qs base-devel &>/dev/null; then
        echo "Prerequisites 'git' and 'base-devel' are not installed. Installing now..."
        sudo pacman -S --needed --noconfirm base-devel git
    fi

    # Clone, build, and install yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay-temp
    cd /tmp/yay-temp
    makepkg -si --noconfirm

    # Clean up the temporary directory
    cd - >/dev/null
    rm -rf /tmp/yay-temp

    echo "--- 'yay' installed successfully! ---"
}

# --- Main Script Logic ---

echo "Starting full system setup."

# --- Step 1: Install Official Packages from pacman ---
echo "--- Installing official packages from pacman... ---"
if [ ! -f "$OFFICIAL_PKG_LIST" ]; then
    echo "Error: Official package list not found at $OFFICIAL_PKG_LIST."
    exit 1
fi
# We now filter out the 'yay' package from the official list as well, just in case.
official_packages_to_install=$(sed 's| .*||' "$OFFICIAL_PKG_LIST" | grep -v '^yay$')

if [ ! -z "$official_packages_to_install" ]; then
    sudo pacman -Syu --needed --noconfirm $official_packages_to_install
fi

# --- Step 2: Ensure yay is installed for AUR packages ---
if ! command -v yay &>/dev/null; then
    install_yay
fi

# --- Step 3: Install AUR packages using yay ---
echo "--- Installing AUR packages using yay... ---"
if [ ! -f "$AUR_PKG_LIST" ]; then
    echo "Error: AUR package list not found at $AUR_PKG_LIST."
    exit 1
fi
yay_packages_to_install=$(sed 's| .*||' "$AUR_PKG_LIST" | grep -v '^yay$')

if [ ! -z "$yay_packages_to_install" ]; then
    yay -S --needed --noconfirm $yay_packages_to_install
fi

# --- Step 4: Clone the dotfiles repository ---
echo "--- Cloning dotfiles repository from $DOTFILES_REPO... ---"
if [ -d "$DOTFILES_CLONE_DIR" ]; then
    echo "Dotfiles directory already exists. Skipping clone."
else
    git clone "$DOTFILES_REPO" "$DOTFILES_CLONE_DIR"
    echo "Dotfiles cloned successfully to $DOTFILES_CLONE_DIR."
fi

# --- Step 5: Create symlinks for config files ---
echo "--- Creating symlinks for config files... ---"
if [ ! -x "$LINK_CONFIGS_SCRIPT" ]; then
    echo "Error: Symlink script not found or not executable at $LINK_CONFIGS_SCRIPT."
    echo "Please ensure the script exists in your dotfiles repository and has executable permissions."
    exit 1
fi

bash "$LINK_CONFIGS_SCRIPT"

echo ""
echo "🎉 Setup Finished! Your Arch Linux machine is ready to go. 🎉"
