# DisplayHelp 0.6.11 (128)

DisplayHelp 0.6.11 makes self-service updates reliable on shared Macs and ships the MDM profile.

### What's fixed

- Updates complete on Macs with fast user switching. The installer previously asked each running DisplayHelp to quit with an Apple event, which cannot reach a copy in another user's background session, and then gave up. It now stops those copies itself, and the app treats that stop as a normal Quit so a pending display trial is still reverted. After the install, DisplayHelp restarts in every signed-in session, not only the one at the console.

### What's new

- `DisplayHelp-BackgroundItems.mobileconfig` is attached to the release and kept in the `mdm` folder. Deployed by an MDM, it pre-approves the login agent and DisplayHelp Updater by Team ID, so standard users get **Install** without an administrator ever visiting System Settings.
- The Homebrew cask lives in its own tap: `brew tap hov172/displayhelp`, then `brew install --cask displayhelp`.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, the MDM profile, and checksums.
