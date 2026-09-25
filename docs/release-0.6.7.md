# DisplayHelp 0.6.7 (122)

DisplayHelp 0.6.7 shows HDCP state for each external display and fixes monitor controls on macOS 26.

### What’s new

- See the HDCP state in each display’s status line, for example **Extended · 1920×1080 · 60 Hz · HDCP2**. DisplayHelp reads it once when a display connects and never changes or negotiates protection.
- Use **Check HDCP** under More Controls to read it again, for example after playback starts or stops. The result names the protocol family macOS reports, the protection and encryption state, and the time of the check.
- When the DisplayPort receiver reports it, the result also states whether a repeater is present, the reported device count and depth, and any topology limit flags. These are observations from the display chain, not a verdict on a specific device.
- **Copy Diagnostics** includes the HDCP result and raw register values for support.
- Get a one-click hint when a display runs below 50 Hz and a smoother mode exists at the same size, such as **60 Hz is available at 1920×1080 without HiDPI**.
- Brightness, contrast and monitor volume work again on macOS 26, where the display service moved in the system registry. Ports that refuse DDC/CI, such as the built-in HDMI port on Apple silicon laptops, still report those controls as unavailable.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, and checksums.
