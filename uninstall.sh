#!/bin/zsh
# Removes DisplayHelp: the app bundle, the login agent, its package receipt, and (with "purge") the user's saved displays,
# profiles and history. Run as root. The app quits itself afterwards; MDM can run this directly:
#   sudo /bin/zsh uninstall.sh /Applications/DisplayHelp.app purge /Users/<name>
set -euo pipefail
APP=${1:?app path}
MODE=${2:-keep}
USER_HOME=${3:-}

case "$APP" in
    */DisplayHelp.app) ;;
    *) echo "refusing to remove '$APP': not DisplayHelp.app"; exit 2 ;;
esac
[ -d "$APP" ] && rm -rf "$APP"
rm -f /Library/LaunchAgents/com.displayhelp.app.plist
# Unload the agent from the console user's session; ignore failure (nobody at the console, or not loaded).
uid=$(stat -f %u /dev/console 2>/dev/null || echo 0)
[ "$uid" != 0 ] && launchctl bootout "gui/$uid/com.displayhelp.app" >/dev/null 2>&1 || true
pkgutil --forget com.displayhelp.app >/dev/null 2>&1 || true
if [ "$MODE" = purge ] && [ -n "$USER_HOME" ] && [ -d "$USER_HOME/Library/Application Support/DisplayHelp" ]; then
    rm -rf "$USER_HOME/Library/Application Support/DisplayHelp"
fi
echo "DisplayHelp removed"
