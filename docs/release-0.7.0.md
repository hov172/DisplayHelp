# DisplayHelp 0.7.0 (150)

DisplayHelp 0.7.0 adds Signal Cap and EDID Cap for displays and projectors on long or marginal cables.

### What's new

- **Signal Cap** (More Controls, external displays, Intel and Apple Silicon): Off, 4K at 30 Hz, 1440p, 1080p or 720p. Each level is a size ceiling plus a pixel-rate ceiling. It hides larger sizes, constrains Best for Display, Match Laptop, Detect Displays and the refresh picker, lowers the mode on connect and whenever something else raises it, and substitutes a saved profile mode above the cap without editing the profile. Setting, changing or clearing it runs under Keep/Revert.
- **EDID Cap** ("Enforce at EDID level (advanced)"): on Apple Silicon, DisplayHelp gives macOS a trimmed copy of the display's own EDID so timings above the cap no longer exist, under Keep/Revert, re-applied on connect and wake, with the remembered arrangement and modes put back after each renegotiation. On Intel it writes a model-wide macOS display override through DisplayHelp Updater, takes effect after reconnect or restart, and is removed by Uninstall and Reset All DisplayHelp Data.
- Works on displays whose only detailed timing is their native size (such as a Wacom DTK246): the trimmed EDID gets a first detailed timing built from the largest kept video code or standard timing.
- **Profiles**, and the Previous and Default setups, carry each external display's Signal Cap level and the EDID Cap toggle.
- Every display card shows the requested signal for HiDPI modes, and the plain size is listed before the HiDPI entry of the same size.
- **Copy Diagnostics** gains `Signal (requested):`, `Signal Cap:`, `EDID Cap:` and `Busy` lines, each display's EDID as hex and decoded (manufacturer, product, serial string, timings, range limits, CTA video codes, HDMI block), and the display's own EDID beside the trimmed one with a `Trim:` line while a cap is active.
- When the EDID Cap is refused, the message says why in plain words in all 11 languages.

### What's fixed

- **Forget This Display** confirms in a dialog that comes to the front; the previous in-window sheet did not reliably appear after the display's "…" menu closed.
- Forget This Display and Reset All DisplayHelp Data say "DisplayHelp is still finishing a display change. Try again in a moment." when a click lands during a display operation, instead of doing nothing. Both give an Apple Silicon display its own EDID back before the record goes.
- A trimmed EDID left behind by a crash during the EDID Cap trial is cleared the next time DisplayHelp sees the display.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, the MDM profile, and checksums.
