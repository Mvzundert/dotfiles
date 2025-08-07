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
#   3. The script will automatically install 'yay' if it's not found in the PATH.

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

# --- Function to install packages ---
install_packages() {
    # Check if the package list files exist before trying to install
    if [ ! -f "$OFFICIAL_PKG_LIST" ] || [ ! -f "$AUR_PKG_LIST" ]; then
        echo "Error: Package list files not found."
        echo "Please run this script with 'generate' command first on your existing machine."
        exit 1
    fi

    # --- Install official packages first ---
    echo "--- Installing official packages from pacman... ---"
    # We now filter out the 'yay' package from the official list
    official_packages_to_install=$(sed 's| .*||' "$OFFICIAL_PKG_LIST" | grep -v '^yay$')

    if [ ! -z "$official_packages_to_install" ]; then
        sudo pacman -Syu --needed --noconfirm $official_packages_to_install
    fi

    # --- Check for and install yay if it's not in the PATH ---
    if ! command -v yay &>/dev/null; then
        install_yay
    fi

    # --- Install AUR packages (now that yay is guaranteed to be installed) ---
    echo "--- Installing AUR packages using yay... ---"
    # Filter 'yay' from the AUR list to prevent the script from trying to install it again
    yay_packages_to_install=$(sed 's| .*||' "$AUR_PKG_LIST" | grep -v '^yay$')

    # Now, install the remaining AUR packages
    if [ ! -z "$yay_packages_to_install" ]; then
        yay -S --needed --noconfirm $yay_packages_to_install
    fi

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
