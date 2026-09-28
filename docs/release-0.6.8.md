# DisplayHelp 0.6.8 (124)

DisplayHelp 0.6.8 starts at login for every account on the Mac.

### What’s new

- The installer now ships a global LaunchAgent, so DisplayHelp starts at login for everyone who uses the Mac, including accounts created later. Earlier versions registered a per-user login item the first time each person opened the app.
- The in-app **Start at Login** toggle is gone. To stop it for your account, turn DisplayHelp off in **System Settings › General › Login Items › Allow in the Background**, then open it from Applications when you need it. Managed Macs can pre-approve the agent with a Service Management profile keyed on the Team ID.
- Upgrading removes the per-user login item older versions registered, so the app starts once per login, not twice.
- **Uninstall DisplayHelp…** and the IT uninstall script also remove the login agent.
- The menu opens at the height of its content on macOS 27. Earlier builds could open with an empty band above the Profile row.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, and checksums.
