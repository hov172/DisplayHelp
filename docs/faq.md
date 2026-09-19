# FAQ

**Does it work without an internet connection?**
Yes. It never uses the network.

**Does it need an administrator password?**
Only for the two fixes marked with a lock: Reset Display Preferences and Uninstall. Everything else runs as the
logged-in user. The password dialog is macOS's own; the app never sees the password.

**Will it change my displays without asking?**
Only to what you or a profile chose before, and only for that display. On a display it has never seen it asks
Mirror or Extend once. Detect Displays is the exception: it applies the recommendation to every external display
because you pressed it.

**Why does the picker not list a size System Settings shows?**
The display's own EDID does not guarantee it, and on TVs those sizes render as snow. It is still in the ⓘ popover.
Set it in System Settings if you are sure, and the app will keep it.

**Why is the laptop letterboxed while mirroring?**
A 16:10 panel showing a 16:9 picture. Turn on Laptop Leads Mirror to flip which side gets the bars, or use Extend.

**Can two people on the same Mac have different settings?**
Yes. Everything is per user, in that user's Application Support folder. The login item is per user too.

**Does it support more than two displays?**
Yes. Each gets a card. Profiles capture all of them. Mirror sets can only have one primary, which is the external
you pressed Mirror on unless Laptop Leads Mirror is on.

**What does a profile not capture?**
Unreadable or unsupported hardware settings, display nicknames, Start at Login, and macOS settings such as HDR,
color profiles, True Tone, Night Shift and system audio volume. The saved monitor volume is DDC volume, not the
Mac's system audio volume. Display nicknames remain in the separate known-displays store.

**Do I need to recreate old profiles after updating to 0.4.0?**
Old profiles still load, but cannot restore fields they never contained. Set up the displays and use
**Profile › Overwrite with Current Settings** to capture positions, the main display and active system audio.
Use **Save Current Setup As…** if there are no profiles. A partial restore lists what could not be reproduced;
macOS may not support an old mirror follower mode under its saved primary.

**Why is the TV orange while the laptop is green in the screenshot?**
The TV reports 30 Hz, below the app’s preferred minimum of 50 Hz. The built-in panel is a mirror follower and
reports 60 Hz. Both share the same logical desktop size; their reported refresh rates can differ. Try a higher
available Refresh Rate or a recommendation. An orange dot is not proof that a faster mode is supported.

**Will settings follow my projector to a different Mac?**
Not automatically. Settings are per user and per Mac. Export a profile and import it on the destination,
mapping the built-in panel, external displays and audio devices as needed. Imports do not apply immediately
and start with automatic loading disabled. Display nicknames are not transferred by profile import.

**Why does the screenshot have fewer controls than the guide describes?**
Controls depend on the hardware and current arrangement. Position appears in Extend mode. External brightness,
contrast and volume need DDC readback; rotation and underscan need platform support. Missing controls do not
mean the app failed to detect the display.

**What happens if I quit the app?**
Nothing changes on screen. Displays stay on whatever they are on. macOS's own behaviour returns at the next plug-in
until the app runs again.

**Is there a Windows or Linux version?**
No. It is built on macOS display and IOKit APIs.

**Where do I report a problem?**
Collect the three data files and the log as described in [troubleshooting.md](troubleshooting.md#collecting-diagnostics-for-the-helpdesk)
and send them with the room, the display model and what you expected to see.
