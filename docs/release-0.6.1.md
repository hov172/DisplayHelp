# DisplayHelp 0.6.1 (89)

Released 2026-09-20. macOS 14 or later; universal Apple Silicon and Intel installer.

- Adds **Forget This Display…**, preserving profiles and history, with a warning about enabled automatic profiles.
- Adds **Turn Off All Automatic Profiles** alongside optional per-profile toggles.
- Adds confirmed **Reset All DisplayHelp Data…** with a recoverable backup and preserved custom scripts/login settings; current hardware settings are unchanged.
- Clarifies **Clear Connection History** preserves saved display preferences and profiles.
- Fixes upgrades that installed new files but left the old app running. The installer now requests normal Quit before replacing the bundle, waits for exit, then opens the new app. It never force-kills a pending display change; if quitting is refused, installation stops with instructions.
- Makes the menu taller: up to 900 points, capped by available screen height, with scrolling for remaining controls.
- Skips running-session actions for installs onto another volume and skips launch at the login/setup screen.

Validation: 132 Swift tests and six installer lifecycle checks. Universal arm64/x86_64 build, Developer ID signing, Apple
notarization/stapling and Gatekeeper verification passed. The installer tests stub system
commands; they do not install packages or modify displays. Existing profiles remain compatible.

A live upgrade on this Mac passed: the preinstall script closed the old process, version 0.6.1 (89) replaced
the installed bundle, and postinstall launched a new process. The package receipt confirms 0.6.1.89.

Current screenshots are native production UI captures with sample display/profile data, labeled 0.6.1 (89).
Every screenshot linked by the current guides has been refreshed for 0.6.1 (89).
Hardware capability limits from [0.6.0 validation](release-0.6.0.md) still apply.

Documentation refresh: added step-by-step data-management instructions, a complete replacement of earlier-version screenshots, and rollout
checks. Word/PDF guides and the screenshot archive were regenerated. App version/build and the signed installer
remain 0.6.1 (89); documentation changes do not replace the tested executable.

The current gallery now documents [0.6.3](release-0.6.3.md). For the original 0.6.1 captures, use its release screenshot archive.
