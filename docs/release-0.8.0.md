# DisplayHelp 0.8.0 (154)

DisplayHelp 0.8.0 brings microphones onto the same rails as speakers.

### What's new

- **Mic** under More Controls on external displays, below Audio: pick the room's USB conference bar, webcam or dock mic once and it becomes the Mac's default input whenever that display connects, when the mic arrives after the display, and when a full-setup profile loads. Remembered per display; cleared by Forget This Display and Reset All. A missing mic is listed as "(not connected)", left alone at connect, and noted in Recent Events. A mic whose identity changed (a dock after a reconnect, the same bar on another Mac) is matched by name when exactly one input carries it.
- **Microphone** picker below Output Volume: the Mac's default input right now, switchable like Sound › Input, with no external display needed.
- **Output Volume** names the current output in a picker: choose another to switch the Mac's default output now, like Sound › Output.
- **Profiles**: full-setup profiles save the active microphone and select it on load, where it wins over the per-display Mic rows. Importing profiles offers to map each saved mic to one of this Mac's input devices. Layout-only profiles and profiles saved before this version leave the mic alone.
- Conferencing apps follow the mic only when set to "Same as System"; a mic pinned inside the app is not changed. Input volume, mute and the camera are not part of this.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, the MDM profile, and checksums.
