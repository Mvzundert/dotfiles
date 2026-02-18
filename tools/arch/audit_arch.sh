#!/bin/bash

# Define output file
OUTPUT="arch_migration_audit.txt"

echo "--- ARCH LINUX PACKAGE AUDIT ($(date)) ---" >"$OUTPUT"

echo -e "\n[1] NATIVE REPO PACKAGES (Explicitly installed)" >>"$OUTPUT"
echo "-------------------------------------------" >>"$OUTPUT"
pacman -Qnqe >>"$OUTPUT"

echo -e "\n[2] AUR PACKAGES (Foreign)" >>"$OUTPUT"
echo "-------------------------------------------" >>"$OUTPUT"
pacman -Qmqe >>"$OUTPUT"

echo -e "\n[3] FLATPAKS" >>"$OUTPUT"
echo "-------------------------------------------" >>"$OUTPUT"
if command -v flatpak &>/dev/null; then
    flatpak list --columns=application >>"$OUTPUT"
else
    echo "No flatpaks installed." >>"$OUTPUT"
fi

echo -e "\n[4] SYSTEM SERVICES (Enabled)" >>"$OUTPUT"
echo "-------------------------------------------" >>"$OUTPUT"
systemctl list-unit-files --state=enabled --no-pager >>"$OUTPUT"

echo "Audit complete. Results saved to $OUTPUT"
