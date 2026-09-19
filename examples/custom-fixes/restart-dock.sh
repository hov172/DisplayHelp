#!/bin/zsh
# name: Restart Dock
# description: Briefly closes and restarts your Dock to refresh its position after a display change. Does not reset display preferences or remove ColorSync profiles.
# admin: false
set -euo pipefail

/usr/bin/killall Dock
echo "Dock restart requested. macOS will reopen it automatically."
