# DisplayHelp 0.6.13 (130)

DisplayHelp 0.6.13 rounds out self-service updates.

### What's new

- **Set up before you need it.** When DisplayHelp is already up to date and the DisplayHelp Updater helper is not yet approved, the "You're up to date" dialog offers **Set Up Self-Service Updates…**, so a helpdesk can give the one-time approval while setting up the Mac.
- **The update explains itself.** After an update, the relaunched app shows "DisplayHelp was updated to 0.6.13" with a note that profiles and settings are unchanged.

### What's fixed

- **Install** reloads the approved helper before using it, so it still works after a Homebrew upgrade or a reinstall unloaded the helper. Previously that needed a restart.
- The installer waits 10 seconds instead of 20 for running copies to quit before stopping them itself.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, the MDM profile, and checksums.
