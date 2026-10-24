# DisplayHelp 0.7.2 (152)

DisplayHelp 0.7.2 makes the menu bar icon report status at a glance.

### What's new

- **Green outline** once a second screen is connected: two displays side by side when extended, two stacked rectangles when mirrored. Strokes only, so the glyph never fills in. With one screen it stays the plain glyph that follows the menu bar.
- **Orange** when something waits on you: a Keep/Revert countdown, a profile restore, profiles that could not load, or a Signal Cap that is set but not yet in effect (not applied, written but waiting for a reconnect, or another EDID override in the way).
- **Red** when the last display change or revert failed, or when a Signal Cap leaves a display with no usable mode. Orange and red show even with one screen, so a problem never hides behind the plain glyph.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, the MDM profile, and checksums.
