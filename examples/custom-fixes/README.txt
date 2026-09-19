DisplayHelp Custom Fixes

These optional scripts work with DisplayHelp 0.5.1 and later. They are separate
from the app's built-in Reset Display Preferences action.

Included fixes
- Demo — Test Custom Fixes: confirms setup without changing settings.
- Restart Dock: briefly closes your Dock; macOS restarts it automatically.
  Use it when the Dock remains misplaced after connecting a display. This is
  not a general display reset and does not delete preferences or color profiles.

Where to install
There is no upload website. Install the scripts locally for each macOS user:
~/Library/Application Support/DisplayHelp/scripts/
The ~ means that user's home folder. Do not install inside the application.

Install
1. Extract the archive. Move the DisplayHelp Custom Fixes folder into Downloads.
2. Open Terminal and run these three lines:

mkdir -p "$HOME/Library/Application Support/DisplayHelp/scripts"
install -m 755 "$HOME/Downloads/DisplayHelp Custom Fixes/demo.sh" "$HOME/Library/Application Support/DisplayHelp/scripts/demo.sh"
install -m 755 "$HOME/Downloads/DisplayHelp Custom Fixes/restart-dock.sh" "$HOME/Library/Application Support/DisplayHelp/scripts/restart-dock.sh"

Run these as the signed-in user, without sudo. Installing under an existing
filename replaces that custom script; rename or back up your existing copy first.
You can install only the demo by omitting the last line.

Use
1. Close and reopen the DisplayHelp menu; it rescans scripts when opened.
2. Under Custom Fixes, choose Demo — Test Custom Fixes.
3. Read the confirmation and choose Run, or Cancel to leave it untouched.
4. Check the result under Fixes: exit 0 and the demo success message confirm it
   worked. Recent Events also records success or failure.
5. Run Restart Dock only when you want to refresh the Dock. If it reports a
   nonzero exit, the command failed; the Dock might not be running.

If nothing appears
Use Finder > Go > Go to Folder and paste the installation path above. Check
that the scripts are directly in that folder, not inside another folder, and
that each filename ends in .sh (not .sh.txt). The file must belong to the user
running DisplayHelp. World-writable files and symbolic links are ignored.
The install commands above set appropriate permissions for ordinary user use.

Remove
Move the script out of the scripts folder, then reopen DisplayHelp's menu.
This removes its menu action without removing your profiles or app settings.

For helpdesks creating additional fixes
Use plain-text zsh scripts. Place these metadata comments within the first
20 lines, immediately after the #!/bin/zsh line:
# name: A clear action name
# description: What changes and what the user should expect.
# admin: false

The name appears in the menu. The description appears in the confirmation.
Use admin: true only when root access is necessary; macOS then requests
administrator authentication. The examples here do not need it. Administrative
scripts must explicitly identify their target user; do not assume their home
folder is the signed-in user's home folder. Scripts run without an interactive
Terminal, so do not prompt for typed input or rely on an interactive shell setup.
Use absolute command paths. Exit 0 for success and nonzero for failure; make the
last output line a useful result because that is what the menu displays.

For managed deployment, place approved scripts in each target user's scripts
folder, owned by that user with permissions 0755. Only install scripts whose
contents and effects you trust. The scripts run commands on the Mac.
