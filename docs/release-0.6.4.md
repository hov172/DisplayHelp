# DisplayHelp 0.6.4 (102)

Released 2026-09-21. Full release for macOS 14 or later, with a universal Apple Silicon and Intel installer. Existing profiles remain compatible. Feedback and suggestions are welcome.

## What changed

- A compact menu keeps everyday controls visible. Advanced display settings are under **More Controls**; **Troubleshooting** groups Detect Displays, fixes, history and Copy Diagnostics.
- The menu fits its content within the available screen height, with scrolling for longer setups. The layout diagram labels screens without repeating a separate legend.
- Each display shows its actual position/alignment relative to a named screen and its rotation beside **Place…**. Placement actions name both the selected and reference screen. **Make Main** is inside Place.
- Moving the primary screen translates the full desktop to preserve its origin and main-display role. Placement is checked against macOS readback before it is reported successful.
- Diagnostics export the latest 20 events with linked change IDs, before/requested/actual layout state, and rotation verification. Keep, manual Revert, timeout, disconnect, quit and failed rollback outcomes are distinguished. Full history stays local.
- The original Audio picker and Output Volume behavior are retained. There is no new global output selector in this release.
- Current documentation screenshots and downloadable Word/PDF guides are refreshed for this version.

## Validation

- 148 Swift regression tests passed on the release source tree, including placement, rotation, readback failures and confirmation outcomes.
- All 6 installer lifecycle checks passed.
- Native fixture checks cover short-window scrolling, content sizing, expanded controls, light/dark, four displays, mirroring and long names.
- The user confirmed placement and alignment work in the local trial. A separate intermittent physical signal-dropout report remains unresolved; this release does not claim to diagnose or repair cable/adapter faults.
- The universal installer is Developer ID signed, notarized by Apple, stapled, and accepted by Gatekeeper.
- Local upgrade to 0.6.4 (102) succeeded; the installed executable matches the signed build and the installer receipt reports 0.6.4.102.
- All 34 current documentation screenshots were recaptured from production controls; the Word/PDF guides were rebuilt.

Screenshots use the current production controls with isolated sample data. They do not establish hardware compatibility. Comprehensive room-by-room hot-plug, audio and accessibility walkthroughs remain deployment checks. Earlier [hardware validation](release-0.6.0.md) and [audio validation](release-0.6.3.md) remain historical records.
