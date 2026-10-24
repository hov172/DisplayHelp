# FAQ

**Does it work without an internet connection?**
Yes. Display, audio and profile features never use the network. The only network request is **Check for Update…**,
which contacts GitHub when you click it and says so if the Mac is offline.

**Does it need an administrator password?**
The built-in Reset Display Preferences and Uninstall actions require an administrator password. Custom fixes
marked with a lock also run as administrator. Display controls run as the logged-in user. The password dialog is macOS's own; the app never sees the password.
Installing an update needs one administrator approval per Mac for **DisplayHelp Updater**; after that, or when an MDM
profile pre-approves it, standard accounts can click **Install** themselves.

**How do I update DisplayHelp?**
Click **Check for Update…** beside Quit. It compares the newest GitHub release with your version. **Install** updates in
place through the approved DisplayHelp Updater helper; **Download** fetches the installer package for a manual install.
Homebrew users can run `brew upgrade --cask displayhelp` instead. Managed Macs usually get updates from their MDM.

**Can I install it with Homebrew?**
Yes: `brew tap hov172/displayhelp`, `brew trust hov172/displayhelp`, then `brew install --cask displayhelp`. It runs the same
signed installer package, so the app and its login agent end up exactly as a manual install leaves them.

**Can IT skip the administrator approval for updates?**
Yes. An MDM can pre-approve the login agent and DisplayHelp Updater with the Service Management profile in
`mdm`; see the [rollout guide](rollout.md#pre-approving-the-login-agent-and-updater-with-mdm).

**Will it change my displays without asking?**
Remembered settings and opted-in automatic profiles can apply at launch or connection. A new display normally
asks Mirror or Extend. Detect Displays applies recommendations because you pressed it. Manual layout changes and
profile applications now show Keep Changes / Revert with a 20-second deadline; automatic profiles verify results
and attempt rollback on failure without requiring confirmation.

**Why does the picker not list a size System Settings shows?**
The display's own EDID does not guarantee it, and on TVs those sizes render as snow. It is still in the ⓘ popover.
Set it in System Settings if you are sure, and the app will keep it. If a caption under the picker says "Sizes above … are hidden by
Signal Cap.", the display has a Signal Cap under More Controls; set it to Off to see the larger sizes again.

**Can DisplayHelp stop a projector from receiving a 4K signal?**
Mostly. Choose a plain (non-HiDPI) size, then set **Signal Cap** under More Controls; **Enforce at EDID level (advanced)** also hides the larger timings from macOS, live on Apple Silicon and through an override file on Intel once self-service updates are approved. The first seconds after plug-in and the login window still use the display's native signal, and the projector's own input-info menu is the only proof of what arrives. If IT can change it, a hardware EDID emulator or the projector's or switcher's own EDID setting is still the most reliable fix. See [Signal Cap](user-guide.md#signal-cap-externals).

**Does the EDID Cap survive a restart?**
On Apple Silicon, no. macOS drops it at restart, unplug and sleep, and DisplayHelp re-applies it at connect and wake while the display's EDID matches the one it was built from. A different unit or new firmware shows "EDID Cap: paused (display changed)". It uses a private macOS interface; if an update removes it, the card reads "EDID Cap: not supported on this macOS" and the Signal Cap keeps working.
On Intel, yes. It is an override file macOS reads at every connect. To remove it, turn the toggle off and reconnect the display (or restart); **Uninstall DisplayHelp** and **Reset All DisplayHelp Data** remove the file too.

**What happens to the EDID Cap when I forget the display or reset all DisplayHelp data?**
On Apple Silicon the display first gets its own EDID back (it flickers and reconnects), then the record goes; on Intel the override file is removed first. If either step fails, nothing is forgotten or reset and the message says so. On the next connection DisplayHelp asks how to use the display again, with no cap. Both actions are unavailable while a display operation is in flight, and a click that lands then says "DisplayHelp is still finishing a display change. Try again in a moment."

**What is the difference between picking 1920×1080 in Resolution, setting a Signal Cap, and turning on Enforce at EDID level?**
Picking 1920×1080 is a one-time choice: macOS still knows the display is 4K, anything can put the larger size back, and on Apple Silicon the wire can stay at 4K while macOS scales a 1080p desktop. Signal Cap 1080p is a standing rule DisplayHelp enforces: larger sizes hidden, recommendations kept under the ceiling, the mode lowered again on connect, wake and drift; macOS itself still believes the display is 4K, so the login window and the first seconds after plug-in negotiate at native. Enforce at EDID level changes what macOS believes: with the 4K timings removed from the EDID, macOS lists nothing above 1080p anywhere and negotiates a 1080p link. Try them in that order, reading the projector's input menu after each. See [Signal Cap](user-guide.md#signal-cap-externals).

**If the Signal Cap is Off and Resolution is 1920×1080, does the Mac still try higher speeds?**
Mostly no: macOS keeps the mode while the display stays connected and DisplayHelp restores it on reconnect. The exceptions are every plug-in and wake, where the link is negotiated from the display's EDID at its advertised maximum before any mode is set (only the EDID level closes that window), anything that picks a mode such as Best for Display, a profile saved at 4K, System Settings or a presenter choosing the HiDPI 1080p entry (the cap refuses or lowers those), and Apple Silicon Macs that keep a 4K link while scaling a 1080p desktop (only the EDID level changes that). See [Signal Cap](user-guide.md#signal-cap-externals).

**How does the EDID Cap work on an Intel Mac?**
Through a documented macOS mechanism rather than the private interface: macOS reads an override file named after the display's vendor and product IDs when the display connects, and uses the EDID inside it. DisplayHelp Updater (the approved root helper) writes that file with the trimmed EDID after re-checking it, marks it as DisplayHelp's own, and never touches a file it did not write. It applies to every unit of that model on the Mac, takes effect after the display reconnects or the Mac restarts, covers the login window, survives restarts, and has no 20-second auto-revert; turning it off deletes the file and takes effect at the next reconnect. Uninstall removes every file DisplayHelp wrote. macOS 26 is the last release for Intel Macs. See [Signal Cap](user-guide.md#signal-cap-externals).

**Do profiles remember the Signal Cap?**
Yes. A profile records each external display's Signal Cap level and whether the EDID Cap was active, and the preview shows both when they would change. Profiles saved before this feature leave both alone, and the first automatic load of an imported profile never turns the EDID Cap on.

**Why is the laptop letterboxed while mirroring?**
A 16:10 panel showing a 16:9 picture. Turn on Laptop Leads Mirror to flip which side gets the bars, or use Extend.

**Can two people on the same Mac have different settings?**
Yes. Everything is per user, in that user's Application Support folder. The app starts at login for every account; each person can turn that off in System Settings › General › Login Items › Allow in the Background.

**Does it support more than two displays?**
Yes. Each gets a card and appears in the numbered layout preview. Profiles capture each monitor’s own resolution,
rotation and position, plus the exact primary of each mirror group. This includes two externals mirrored together
while the laptop stays extended. The simple Mirror button uses the laptop as partner when available; save an
existing arrangement as a profile to recall its exact topology.

**Can I switch between two layouts without changing brightness or sound?**
Yes. Save each using **Layout only**, expand **Quick Switch Profiles**, then select each saved name from **Choose Profile…** beside the
**Favorite 1 (⌘⌥1)** and **Favorite 2 (⌘⌥2)** rows (since 0.6.6). Each monitor can have its own resolution in Extend mode. Layout-only profiles include rotation,
position and the main display but leave brightness, contrast, monitor volume, underscan, audio and the microphone alone.

**Are the favorite shortcuts global?**
Since 0.6.6, yes: press and release **⌘⌥1** or **⌘⌥2** from another app while DisplayHelp is running.
They open a preview; you still choose Apply and then Keep Changes. If a shortcut cannot be registered,
use the favorite button or the app-local shortcut. In 0.6.5, shortcuts work only while DisplayHelp is active.

**Can identical monitors have different saved resolutions?**
Since 0.6.6, yes, if macOS supplies distinct display UUIDs. These profiles require manual preview and cannot
auto-load. After swapping cables or ports, recreate the intended setup and overwrite each affected profile.
If macOS cannot distinguish the monitors, saving stays blocked; use macOS Displays to arrange them.
To check whether your pair could be told apart by hardware, open each display's Details and compare the
**Serial string** rows: distinct values mean the panels are distinguishable, and the diagnostics text lists
the same value as **EDID serial string**. The app does not use it yet.
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
Unreadable or unsupported hardware settings, display nicknames, and macOS settings such as HDR,
color profiles, True Tone, Night Shift and system audio volume. The saved monitor volume is DDC volume, not the
Mac's system audio volume. A full-setup profile does capture the active audio output and microphone. Display nicknames remain in the separate known-displays store.

**Do I need to recreate old profiles after updating to 0.6.0?**
Old profiles still load, but cannot restore fields they never contained. Set up the displays and use
**Profile › Overwrite with Current Settings** to capture positions, the main display and active system audio.
Use **Save Current Setup As…** if there are no profiles. Older profiles default to Full setup and retain legacy mirror-leader behavior. Re-save to capture exact mirror
groups. Missing hardware and unsupported modes can still prevent a complete restore; failed changes trigger
an attempt to return to the previous setup.

**What does the HDCP part of the status line mean?**
It is the copy-protection state macOS reports for that connection (0.6.7): **HDCP2** or **HDCP1** when protected,
**HDCP Unprotected** or **HDCP Negotiating** when the link answered but is not protected right now, nothing when
it could not be read. Unprotected on its own is not a fault; nothing may be asking for protection. DisplayHelp only
reads the state. It never negotiates, forces or bypasses protection, and it cannot say whether a particular title
will play.

**Why is a 4K display on 1920×1080 HiDPI stuck at 30 Hz?**
HiDPI draws a 1080p-sized desktop using all of the panel's 4K pixels, so the cable carries a 4K signal. Many HDMI
paths only hold 4K at 30 Hz. Plain 1920×1080 sends a quarter of the pixels and reaches 60 Hz. The orange hint
under the status line offers that mode when it exists; click it to switch. Sharpness and smoothness are the trade.

**Why does one display show a grey ⓘ while the laptop shows a green check?**
The grey ⓘ means a different mode is recommended, or an external display that is not a mirror follower is below the
preferred 50 Hz minimum. Each card is checked separately; mirrored displays can report different refresh rates.
When a faster rate exists at the same size, an orange "60 Hz is available…" link appears under the status line;
otherwise try an available recommendation or inspect the offered refresh rates. The grey ⓘ is not proof that a
faster mode is supported.

**Will settings follow my projector to a different Mac?**
Not automatically. Settings are per user and per Mac. Export a profile and import it on the destination,
mapping the built-in panel, external displays, audio outputs and microphones as needed. Imports do not apply immediately
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
favorites and history while saving a backup. Current screen settings and custom fixes remain.

**How do I tell which physical screen matches a numbered preview?**
Click **Identify Displays** beneath Screen Layout when an external screen is connected. Numbers and names appear for five seconds on each desktop. Mirrored screens share a label. Repeated clicks restart the timer, and a display-configuration change dismisses the labels. No display settings change.

**Can I choose a main display and save it in a profile?**
Yes. In Extend mode, choose **Place… → Make [display name] Main** on the desired display and confirm **Keep Changes**. Save a new profile or overwrite an existing one with the current settings. Full setup and Layout only profiles both save the main-screen choice.

**Can DisplayHelp control the Mac’s built-in speaker volume?**
Yes, starting in 0.6.3. Select the built-in speakers in the Output Volume picker beneath Screen Layout, then use its slider. Volume and mute controls appear when the selected device exposes writable controls. Audio changes made outside the app are detected while DisplayHelp is running.

**Why does HDMI say output volume is unavailable?**
That audio device does not expose a readable, writable volume control to macOS. Use its physical controls or the separate Monitor Volume slider if DDC/CI is supported. This is a device capability limit, not evidence of a bad cable.

**Do profiles save Output Volume or mute?**
No. Those are live system controls. Full setup profiles still save the chosen audio output, the active microphone and supported external-monitor DDC volume. Layout-only profiles leave audio and the microphone alone.

**How do I make a room microphone follow a display?**
Expand the display's **More Controls** and pick the mic in the **Mic** row. DisplayHelp makes it the Mac's default input now, whenever that display connects, and when the mic itself appears after the display is already connected. **Don't change** leaves the input alone. The choice is per display and goes into full-setup profiles.

**What does the Microphone picker at the top of the menu do?**
It is the Mac's default input right now, the same as Sound › Input. Choosing another one switches now and remembers nothing; the Mic row under a display is what follows a display. "No microphone detected." means the Mac has no input at all.

**Why does Zoom, Teams or Meet still use the old microphone?**
They follow the Mac's default input only when their microphone setting is **Same as System** (or the equivalent). A mic pinned inside the app is not changed by DisplayHelp.

**The dock re-registered its mic; will DisplayHelp still find it?**
If the saved identity is gone but exactly one input has the same name, that one is used. Two inputs with the same name are never guessed between: Recent Events then shows "‹name› not connected; input left alone", and you pick one by hand or in the import dialog.

**Why does choosing Left put the external screen on the right?**
Place acts on the card you opened. Choosing “Built-in Display left of SAMSUNG” puts the laptop on the left and SAMSUNG on the right. To put SAMSUNG left of the laptop, open Place… on SAMSUNG’s card and choose it left of Built-in Display. The visible placement, alignment and rotation describe the actual setup.

## Can I change the language without changing my Mac?

Yes. Use the globe at the top of DisplayHelp, choose a language and restart the app when prompted. **Follow System** restores macOS language selection. Eleven languages are bundled; macOS selects the best supported preferred language, with English as fallback. It does not automatically translate missing languages. Language belongs to the current user's app preferences, not a display profile. Names you enter, device names and custom script output are not translated.

For the complete language list, switching instructions and a comparison of macOS settings with the globe menu, see [Language in the user guide](user-guide.md#language).
