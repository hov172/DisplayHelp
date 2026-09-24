# FAQ

**Does it work without an internet connection?**
Yes. It never uses the network.

**Does it need an administrator password?**
The built-in Reset Display Preferences and Uninstall actions require an administrator password. Custom fixes
marked with a lock also run as administrator. Display controls run as the logged-in user. The password dialog is macOS's own; the app never sees the password.

**Will it change my displays without asking?**
Remembered settings and opted-in automatic profiles can apply at launch or connection. A new display normally
asks Mirror or Extend. Detect Displays applies recommendations because you pressed it. Manual layout changes and
profile applications now show Keep Changes / Revert with a 20-second deadline; automatic profiles verify results
and attempt rollback on failure without requiring confirmation.

**Why does the picker not list a size System Settings shows?**
The display's own EDID does not guarantee it, and on TVs those sizes render as snow. It is still in the ⓘ popover.
Set it in System Settings if you are sure, and the app will keep it.

**Why is the laptop letterboxed while mirroring?**
A 16:10 panel showing a 16:9 picture. Turn on Laptop Leads Mirror to flip which side gets the bars, or use Extend.

**Can two people on the same Mac have different settings?**
Yes. Everything is per user, in that user's Application Support folder. The login item is per user too.

**Does it support more than two displays?**
Yes. Each gets a card and appears in the numbered layout preview. Profiles capture each monitor’s own resolution,
rotation and position, plus the exact primary of each mirror group. This includes two externals mirrored together
while the laptop stays extended. The simple Mirror button uses the laptop as partner when available; save an
existing arrangement as a profile to recall its exact topology.

**Can I switch between two layouts without changing brightness or sound?**
Yes. Save each using **Layout only**, expand **Quick Switch Profiles**, then select each saved name from **Choose Profile…** beside the
**Favorite 1** and **Favorite 2** rows (0.6.6). Each monitor can have its own resolution in Extend mode. Layout-only profiles include rotation,
position and the main display but leave brightness, contrast, monitor volume, underscan and audio alone.

**Are the favorite shortcuts global?**
In 0.6.6, yes: press and release **⌘⌥1** or **⌘⌥2** from another app while DisplayHelp is running.
They open a preview; you still choose Apply and then Keep Changes. If a shortcut cannot be registered,
use the favorite button or the app-local shortcut. In 0.6.5, shortcuts work only while DisplayHelp is active.

**Can identical monitors have different saved resolutions?**
In 0.6.6, yes, if macOS supplies distinct display UUIDs. These profiles require manual preview and cannot
auto-load. After swapping cables or ports, recreate the intended setup and overwrite each affected profile.
If macOS cannot distinguish the monitors, saving stays blocked; use macOS Displays to arrange them.
See the [limits and step-by-step workaround](user-guide.md#identical-monitors-limits-and-workaround-066).

**What if a change leaves a screen unusable?**
Wait for the 20-second confirmation deadline or press Revert. The floating confirmation remains available when
the menu closes. Sleep does not extend the deadline. If hardware cannot reproduce the previous setup, the app
reports the remaining problems and offers Open Display Settings. Force-quitting the app prevents its timer from
running; the timer is not a macOS crash-recovery guarantee.

**How do I go back after keeping a profile switch?**
Use **Restore Previous Setup** below Quick Switch Profiles. To keep a permanent starting point, arrange your
screens and choose **Save Current Setup as Default…**, then use **Restore Default Setup** later. Both open a
preview and survive app restarts. Previous tracks one successful profile switch; Default changes only when
you explicitly save it again. Neither reconstructs an unsaved first-connection setup or macOS factory defaults.
See [Previous and Default Setup](user-guide.md#previous-and-default-setup-066).

**Can I recover a damaged profile library?**
Yes, when a valid backup exists: use **Recover Profiles from Backup**. The previous file is archived first.
Without a usable backup, **Archive Unreadable File and Start Fresh…** preserves it and creates an empty library.
See [data-file recovery](data-files.md#profile-file-recovery).

**What does a profile not capture?**
Unreadable or unsupported hardware settings, display nicknames, Start at Login, and macOS settings such as HDR,
color profiles, True Tone, Night Shift and system audio volume. The saved monitor volume is DDC volume, not the
Mac's system audio volume. Display nicknames remain in the separate known-displays store.

**Do I need to recreate old profiles after updating to 0.6.0?**
Old profiles still load, but cannot restore fields they never contained. Set up the displays and use
**Profile › Overwrite with Current Settings** to capture positions, the main display and active system audio.
Use **Save Current Setup As…** if there are no profiles. Older profiles default to Full setup and retain legacy mirror-leader behavior. Re-save to capture exact mirror
groups. Missing hardware and unsupported modes can still prevent a complete restore; failed changes trigger
an attempt to return to the previous setup.

**Why can one display be orange while the laptop is green?**
An orange dot means a different mode is recommended or an external primary display is below the preferred
50 Hz minimum. Each card is checked separately; mirrored displays can report different refresh rates.
The current screenshots use sample modes to illustrate the controls. Try an available recommendation or inspect
the offered refresh rates. An orange dot is not proof that a faster mode is supported.

**Will settings follow my projector to a different Mac?**
Not automatically. Settings are per user and per Mac. Export a profile and import it on the destination,
mapping the built-in panel, external displays and audio devices as needed. Imports do not apply immediately
and start with automatic loading disabled and no favorite slots assigned. Display nicknames are not transferred by profile import.

**Why does the screenshot have fewer controls than the guide describes?**
Everyday controls stay visible; expand **More Controls** for advanced settings and **Troubleshooting** for fixes and diagnostics. Controls also depend on the hardware and current arrangement. Place… appears in Extend mode. External brightness,
contrast and volume need DDC readback; rotation and underscan need platform support. Missing controls do not
mean the app failed to detect the display.

**What happens if I quit the app?**
Confirmed settings normally stay in place. Quit is disabled while applying changes; a system quit request during
a pending confirmation attempts to revert first. If recovery fails, the app stays open. macOS’s own behavior
returns at the next plug-in until DisplayHelp runs again.

**Is there a Windows or Linux version?**
No. It is built on macOS display and IOKit APIs.

**Where do I report a problem?**
Start with **Copy Diagnostics**, then collect the data files and log if needed as described in [troubleshooting.md](troubleshooting.md#collecting-diagnostics-for-the-helpdesk)
and send them with the room, the display model and what you expected to see.

**Does clearing history make DisplayHelp forget my monitor?**
No. **Clear Connection History** only archives the event log. Use the external display's **… → Forget This Display…**
to remove its remembered name and reconnect preferences. Saved profiles remain; disable any automatic profiles
that include the monitor if you want to be asked again at its next connection.

**Can I turn automatic profiles off?**
Yes. They are opt-in. Uncheck a profile under **Profile → Load Automatically When Connected**, or choose
**Turn Off All Automatic Profiles**. Profiles and favorites remain available for manual use.

**Can I reset everything?**
Use **Troubleshooting → More → Reset All DisplayHelp Data… → Back Up and Reset**. This clears active preferences, profiles,
favorites and history while saving a backup. Current screen settings, custom fixes and Start at Login remain.

**How do I tell which physical screen matches a numbered preview?**
Click **Identify Displays** beneath Screen Layout when an external screen is connected. Numbers and names appear for five seconds on each desktop. Mirrored screens share a label. Repeated clicks restart the timer, and a display-configuration change dismisses the labels. No display settings change.

**Can I choose a main display and save it in a profile?**
Yes. In Extend mode, choose **Place… → Make [display name] Main** on the desired display and confirm **Keep Changes**. Save a new profile or overwrite an existing one with the current settings. Full setup and Layout only profiles both save the main-screen choice.

**Can DisplayHelp control the Mac’s built-in speaker volume?**
Yes, starting in 0.6.3. Select the built-in speakers as the active output, then use Output Volume beneath Screen Layout. Volume and mute controls appear when the selected device exposes writable controls. Audio changes made outside the app are detected while DisplayHelp is running.

**Why does HDMI say output volume is unavailable?**
That audio device does not expose a readable, writable volume control to macOS. Use its physical controls or the separate Monitor Volume slider if DDC/CI is supported. This is a device capability limit, not evidence of a bad cable.

**Do profiles save Output Volume or mute?**
No. Those are live system controls. Full setup profiles still save the chosen audio output and supported external-monitor DDC volume. Layout-only profiles leave audio alone.

**Why does choosing Left put the external screen on the right?**
Place acts on the card you opened. Choosing “Built-in Display left of SAMSUNG” puts the laptop on the left and SAMSUNG on the right. To put SAMSUNG left of the laptop, open Place… on SAMSUNG’s card and choose it left of Built-in Display. The visible placement, alignment and rotation describe the actual setup.

## Can I change the language without changing my Mac?

Yes. Use the globe at the top of DisplayHelp, choose a language and restart the app when prompted. **Follow System** restores macOS language selection. Eleven languages are bundled; macOS selects the best supported preferred language, with English as fallback. It does not automatically translate missing languages. Language belongs to the current user's app preferences, not a display profile. Names you enter, device names and custom script output are not translated.

For the complete language list, switching instructions and a comparison of macOS settings with the globe menu, see [Language in the user guide](user-guide.md#language).


## Does this release check HDCP or test cables?

No. DisplayHelp 0.6.6 does not include HDCP status checks, HDCP negotiation changes or link-error/cable tests. Research probes are separate from the app. Copy Diagnostics remains useful for display identity, settings and recent changes, but does not certify protected playback or cable health.
