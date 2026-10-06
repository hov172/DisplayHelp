# DisplayHelp 0.6.9 (126)

DisplayHelp 0.6.9 can tell you when a newer version is available.

### What’s new

- **Check for Update…** sits beside Quit. It asks GitHub for the newest DisplayHelp release and compares it with the version you are running. If a newer one exists, the dialog names both versions and **Download** opens the installer package in your browser; otherwise it says you are up to date. Nothing is installed from inside the app, and if the Mac is offline or GitHub is rate-limiting requests the dialog says so.
- The new strings are shown in English in the ten other languages until translations land.

### Under the hood

- Continuous integration now builds and runs the 182 Swift tests on every push.
- The display model and menu views were split into smaller files with no behaviour change.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, and checksums.
