# DisplayHelp 0.6.10 (127)

DisplayHelp 0.6.10 lets standard users install updates themselves.

### What’s new

- **Check for Update…** can now install the update. After an administrator allows **DisplayHelp Updater** once in System Settings › General › Login Items & Extensions, anyone using the Mac clicks **Install** and DisplayHelp updates itself: a signed privileged helper downloads the release package from GitHub, verifies the Developer ID signature and Gatekeeper assessment, refuses anything that is not a newer DisplayHelp release, and runs the macOS installer. **Download** still opens the package in your browser for a manual install.
- The update dialogs are translated into all ten additional languages.
- Homebrew users can install and update from the `hov172/displayhelp` tap: `brew install --cask displayhelp`.

### Notes

- Managed Macs can keep deploying the package through MDM; the helper is optional and only activates after an administrator approves it.
- The helper only accepts a version number from DisplayHelp itself and never runs anything else.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, and checksums.
