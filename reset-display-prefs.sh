#!/bin/zsh
# name: Reset Display Preferences
# description: Clears system and per-user WindowServer display settings while preserving ColorSync profiles, then restarts WindowServer. This logs everyone out immediately. Needs an administrator password.
# admin: true
set -euo pipefail
setopt null_glob

# System-wide WindowServer preferences/database
rm -f /Library/Preferences/com.apple.windowserver*.plist
rm -rf /private/var/db/WindowServer

# Clear per-user settings for all users with home folders
for HOME_DIR in /Users/*; do
    [ -d "$HOME_DIR" ] || continue
    rm -f "$HOME_DIR"/Library/Preferences/ByHost/com.apple.windowserver.displays*.plist 2>/dev/null
done

echo "Display preferences reset, restarting WindowServer"
# Restart WindowServer
killall -HUP WindowServer
