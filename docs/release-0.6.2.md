# DisplayHelp 0.6.2 (93) — testing release

Released 2026-09-20 for testing. Feedback, bug reports and suggestions are welcome. macOS 14 or later; universal Apple Silicon and Intel installer. Existing profiles remain compatible.

## What changed

- **Identify Displays** appears beneath Screen Layout whenever an external display is connected. It shows matching numbers and names for five seconds, with a shared number group for mirrored screens.
- Labels do not change settings, intercept clicks or steal focus. Repeating the action replaces existing labels and restarts the timer. A display-configuration change dismisses them.
- Documentation explains how to choose **Position → Make Main**, confirm the change, and save it in either a Full setup or Layout only profile. This profile capability already existed; Identify Displays is the new control.
- All current app screenshots and downloadable guides have been refreshed from the 0.6.2 interface. The locally hosted YouTube thumbnail links to a video of the earlier interface.

## Validation

- 133 Swift tests passed, including four-display numbering with a mirrored group and unknown/disconnected screen handling.
- Six installer lifecycle checks passed; they use stubbed system commands, without modifying displays or installing packages.
- A live check on this Mac covered two physical displays sharing one mirrored desktop: labels were click-through, did not steal focus, did not stack on repeated activation, and disappeared after five seconds.
- Local upgrade to 0.6.2 (93) succeeded. The running installed executable matches the built executable; the package receipt reports 0.6.2.93.
- The release installer is Developer ID signed, notarized by Apple, stapled and accepted by Gatekeeper.

Three-or-more-screen layouts are covered by logic tests, but have not been physically tested on this Mac. The earlier [hardware capability validation](release-0.6.0.md) still applies; capabilities vary by monitor, adapter and connection.

Screenshots use isolated sample displays and production controls. The Identify Displays image captures the actual temporary panel using sample names mapped to a real desktop. No display settings or user data were changed to stage screenshots. See the [current screenshot gallery](README.md#screenshots).
