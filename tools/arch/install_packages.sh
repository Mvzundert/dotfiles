#!/bin/bash

# This script can either generate a list of installed packages or install them.
#
# Usage:
#   1. To GENERATE the package lists on your current system:
#      ./package_manager.sh generate
#
#   2. To INSTALL the packages on a new system:
#      ./package_manager.sh install
#
#   3. You must have an AUR helper (like yay or paru) installed for the 'install' command to work.

# Exit on any error
set -e

# Define the filenames for the package lists
OFFICIAL_PKG_LIST="pkglist-official.txt"
AUR_PKG_LIST="pkglist-aur.txt"

# --- Function to generate package lists ---
generate_lists() {
    echo "--- Generating list of explicitly installed official packages... ---"
    # The -e flag queries for explicitly installed packages.
    pacman -Qe >"$OFFICIAL_PKG_LIST"
    echo "Official package list saved to $OFFICIAL_PKG_LIST"

    echo "--- Generating list of AUR packages... ---"
    # The -m flag queries for foreign (AUR) packages.
    pacman -Qm >"$AUR_PKG_LIST"
    echo "AUR package list saved to $AUR_PKG_LIST"
}

# --- Function to install packages ---
install_packages() {
    # Check if the package list files exist before trying to install
    if [ ! -f "$OFFICIAL_PKG_LIST" ] || [ ! -f "$AUR_PKG_LIST" ]; then
        echo "Error: Package list files not found."
        echo "Please run this script with 'generate' command first on your existing machine."
        exit 1
    fi

    echo "--- Installing official packages... ---"
    # -S: Sync packages from the official repos
    # -u: Upgrade packages
    # --needed: Only install packages that are not already installed
    # --noconfirm: Skip confirmation prompts
    # sed removes the version numbers from the text file
    sudo pacman -Syu --needed --noconfirm $(sed 's| .*||' "$OFFICIAL_PKG_LIST")

    echo "--- Installing AUR packages... ---"
    # Assuming 'yay' is installed for AUR packages
    # If not, you'll need to install it first
    yay -S --needed --noconfirm $(sed 's| .*||' "$AUR_PKG_LIST")

    echo "--- Package installation complete! ---"
}

# --- Main script logic ---
if [ "$1" == "generate" ]; then
    generate_lists
elif [ "$1" == "install" ]; then
    install_packages
else
    echo "Error: Invalid command."
    echo "Usage: $0 [generate|install]"
    exit 1
fi
