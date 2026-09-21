# DisplayHelp 0.6.3 (95)

Released 2026-09-20. Feedback, bug reports and suggestions are welcome. macOS 14 or later; universal Apple Silicon and Intel installer. Existing profiles remain compatible.

## What changed

- **Output Volume** beneath Screen Layout follows the active macOS audio device, including built-in speakers, with volume and mute controls when supported.
- Native CoreAudio notifications refresh the active device and its volume/mute when changed in macOS or another app. Device switches prevent stale controls from writing to the newly selected device.
- Devices without writable software volume show an explanation. External monitor DDC volume is separately labeled **Monitor Volume**.
- Master-volume controls are preferred. Channel-based devices preserve relative balance; failed writes/readback attempt to restore prior channel values. An all-zero channel set has no recoverable balance and starts evenly when raised.
- Copy Diagnostics distinguishes system output volume/mute from monitor volume. Output Volume and mute are not saved in profiles; existing saved audio routing and DDC volume retain their behavior.
- All current UI screenshots and Word/PDF guides were refreshed, including built-in speaker and unsupported-output examples. The locally hosted video thumbnail still links to the earlier-interface video.

## Validation

- 139 Swift tests passed without compiler warnings, covering channel balance, invalid levels, write/readback failure recovery, unsupported outputs, stale-device writes and unchanged stored preferences.
- Live built-in speaker validation on this Mac verified volume and mute writes/readback and received three native audio-change callbacks. Original volume, mute and output selection were restored afterward.
- Local upgrade to 0.6.3 (95) succeeded; the running installed executable matches the built executable and the package receipt reports 0.6.3.95.
- The universal release installer is Developer ID signed, notarized by Apple, stapled and accepted by Gatekeeper.

The live audio check covered this Mac’s built-in speakers; behavior on other USB, HDMI and third-party audio devices depends on their exposed controls. See the earlier [display hardware validation](release-0.6.0.md) and [Identify Displays validation](release-0.6.2.md) for those features.

All 34 app screenshots use current production controls and isolated sample data. No real audio/display settings or user data were changed to stage them; only the harmless Custom Fixes demo was executed. See the [screenshot gallery](README.md#screenshots).
