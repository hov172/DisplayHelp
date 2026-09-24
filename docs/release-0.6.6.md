# DisplayHelp 0.6.6 (120)

Released 2026-09-23 for macOS 14 or later, on Apple Silicon and Intel. This release improves profile switching and recovery.

Profiles can distinguish matching hardware identities when macOS supplies distinct display UUIDs. Preview, mirror topology, mode/layout restoration, readback verification and rollback retain those identities. Ordinary and legacy profile keys remain supported. UUID-based profiles require manual preview: a connection identifier cannot prove which physical twin is connected after a port swap. Missing or duplicate UUIDs still block saving. Shared reconnect preferences are neither loaded nor overwritten while twins are connected; separate naming and DDC matching remain unresolved.

Favorite 1/2 use native system-wide hotkeys for the assigned slots. They open the existing preview on key release and retain Keep/Revert. Removing favorites unregisters the hotkeys; registration failures appear below the affected slot, with local shortcuts as fallback. Expand Quick Switch Profiles beneath Profile to assign favorites: choose a saved name, then use the separate Preview button. The section remembers its expanded state and includes Save Current Setup as Default. Restore Previous Setup and Restore Default Setup remain visible when collapsed.

Restore Previous Setup retains the setup before the last successful profile switch. Save Current Setup as Default explicitly records a permanent starting point; Restore Default Setup previews it later. Both persist in restore-setups.json with a last-good backup, use existing preview and Keep/Revert, and are cleared by Reset All DisplayHelp Data. Failed undo-snapshot saves roll back the switch. These snapshots do not reconstruct an earlier first connection or factory defaults.

The release installer is Developer ID signed, accepted by Apple notarization, stapled, and accepted by Gatekeeper. The universal app includes arm64 and x86_64. User guides, example fixes, screenshots and SHA-256 checksums accompany the installer.

Automated acceptance: all 160 Swift tests passed with native hotkey testing enabled; six installer lifecycle tests and localization consistency checks passed. The four-display fixture covers templates, favorites, Keep/Revert, timeout, enumeration changes and restore-snapshot persistence. Native shortcut registration/conflict/release checks passed. Hardware-changing tests use simulated displays and temporary storage; these do not replace physical four-monitor, keystroke or cable-reconnect testing.

Profile and language controls now remain stable during periodic read-only hardware checks. Pending settings changes still invalidate the active-profile label and block language restarts.

Profiles with distinct display UUIDs are supported with manual preview.
