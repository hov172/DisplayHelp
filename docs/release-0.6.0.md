# DisplayHelp 0.6.0 (88)

Released 2026-09-20. macOS 14 or later; universal Apple Silicon and Intel installer.

## Changes

- Full and layout-only profiles, two favorite templates, and app-local Command–Option–1/2 shortcuts.
- Numbered screen layout with combined mirrored labels, rotation/main indicators and aligned placement.
- One 20-second Keep/Revert window, verified hardware readback and rollback on normal Quit.
- Profile backup/recovery, safer preference persistence, unique DDC/EDID identity matching and Copy Diagnostics.
- Polished spacing and progress messages, updated documentation and screenshots.
- Underscan trials now capture a full snapshot so Revert restores the previous underscan value.

## Validation

| Check | Result |
|---|---|
| Automated tests | 123 passed, zero failures |
| Release architectures | arm64 and x86_64 verified with lipo |
| Version metadata | 0.6.0, build 88 |
| App signature | Developer ID Application; strict/deep verification passed |
| Installer signature | Developer ID Installer with trusted timestamp |
| Apple notarization | Accepted; ticket stapled and validated |
| Gatekeeper | Accepted, Notarized Developer ID |
| Live display checks | 16 passed on Samsung external and built-in Mac display |

The live checks exercised production views and display control code using isolated preferences, before the final
UI polish and underscan fix. They covered full/layout capture, favorites, refresh readback, timed revert,
Extend/Keep, right/center placement and revert, 90° rotation and revert, applying a saved layout, mirror/mode
restoration and a final exact baseline comparison. The installed application was not replaced by this test.
The original mirror group, main display, modes, rotation, positions, built-in brightness and audio were restored.

External DDC brightness/contrast/volume and underscan were unavailable on this connection and were not physically
verified. Underscan Keep/Revert is covered by a simulated regression. Intel was built, not run on physical Intel
hardware. A disconnected display, unavailable mode, forced quit, crash or power loss can prevent recovery.

## Screenshots and assets

[Current screenshot gallery](README.md#screenshots) includes native production UI captures rendered with sample
displays and profiles, labeled as fixtures. Screen boxes show geometry, not live desktop contents. This document records the earlier 0.6.0 validation; the linked gallery now shows the current release.

Both repositories publish the same signed installer, Word/PDF user guides, Custom Fixes examples, current
screenshot archive and SHA-256 checksums. Existing profiles remain compatible; their default scope is full setup.
The public repository contains documentation and helper scripts; application source remains private.
