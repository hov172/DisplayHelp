# Troubleshooting

Symptom, action, cause. The picture and connection guidance grew from testing a 16:10 MacBook Pro with a Samsung 4K TV.
The current [menu capture](images/menu.png) uses sample displays; hardware capabilities and available
modes vary by Mac, cable and port.

## Contents

- [Picture and layout](#picture-and-layout)
- [Connection](#connection)
- [Controls and buttons](#controls-and-buttons)
- [Errors in Recent Events](#errors-in-recent-events)
- [The app itself](#the-app-itself)
- [Collecting diagnostics for the helpdesk](#collecting-diagnostics-for-the-helpdesk)

---

## Picture and layout

### The Dock is half off the screen after plugging in
**Do.** Wait about three seconds. If still wrong, open **Troubleshooting → Detect Displays**.
**Cause.** macOS re-mirrors on its own at plug-in and the Dock keeps the previous display's geometry. The app
restarts the Dock after any display change that ends mirrored, once the burst of changes settles.

### The TV shows snow, noise, or "mode not supported"
**Do.** Pick 1920×1080 in Resolution, or press **Match Laptop**.
**Cause.** TVs advertise sizes such as 1680×1050 as "standard timings" but only render their EDID "detailed
timings", typically 3840×2160 and 1920×1080. The picker now hides sizes the EDID does not guarantee and the
recommendations never choose them. Actual support still depends on the display, port and cable. If a manual change makes the screen unusable,
wait for the confirmation deadline to revert instead of keeping it.

### The projector goes black or flashes on a long cable
**Do.** Pick a plain size (no "(HiDPI)" in the status line), then set **Signal Cap** under More Controls, for example 1080p. If the projector's input-info menu still reports 4K, turn on **Enforce at EDID level (advanced)** (Apple Silicon).
**Cause.** A HiDPI size on a 4K display still sends 4K down the cable. The first seconds after plug-in and the login window still use the display's native signal, so one flash on a bad cable can remain. Nothing on the Mac can prove what the cable carries; the projector's input-info menu is the ground truth. If IT can change it, a hardware EDID emulator or the projector's or switcher's own EDID setting is the most reliable fix. See [Signal Cap](user-guide.md#signal-cap-externals).

### The card says "No mode under cap available"
**Do.** Choose a higher Signal Cap level, or Off, under More Controls.
**Cause.** The display offers no mode at or below the cap's size and pixel rate (for example a projector with only 4K modes under a 720p cap). DisplayHelp changes nothing rather than guessing; Recent Events shows `applyFailed` with "no mode under cap".

### The EDID Cap says "not applied", "paused" or "Another EDID override is active"
**Do.** Read the latest EDID Cap Refused or EDID Cap Paused entry in **Recent Events**. For "paused (display changed)", turn the toggle off and on again for this display. For "Another EDID override is active", remove the other tool's override first.
**Cause.** "Not applied": the trim, the validator or macOS refused the change, and nothing was changed. The message says why: "this display offers no size within the cap on this connection" (every timing the EDID lists in a form DisplayHelp can keep is above the cap; DisplayID blocks and the rarer descriptor types are dropped by design), "an extension format DisplayHelp cannot trim" (a CTA extension other than revision 3), or "could not be read in full" (bad header, checksum or block count). The raw reason, for example `trim: noTimingUnderCap`, is on the `EDID Cap:` line of Copy Diagnostics and in Recent Events, and the display's EDID bytes are in Copy Diagnostics. "Paused (display changed)": the display's EDID no longer matches the one the cap was built from (a different unit of the same model, or new firmware). "Another EDID override is active": something other than DisplayHelp has replaced this display's EDID, so DisplayHelp leaves it alone. "Not supported on this macOS": the private interface is missing (Intel, or a macOS update removed it); the Signal Cap still works.

### After turning the EDID Cap on or off, the display mirrored or became the main display
**Do.** Wait a few seconds; DisplayHelp puts back the remembered arrangement and modes after the renegotiation. If the layout is still wrong, choose **Revert** in the Keep/Revert window, or use Mirror/Extend and **Place…** again.
**Cause.** macOS keys its display settings by EDID, so a display whose EDID just changed looks new and gets the TV default (mirrored, main).

### Everything on the TV is tiny
**Do.** Press **Best for Display**.
**Cause.** The TV is on pixel-exact 3840×2160. Best for Display prefers the HiDPI mode at the same pixels,
1920×1080 HiDPI, which is sharp and readable.

### Black band top and bottom on the laptop while mirrored
**Do.** Nothing, or turn on **Laptop Leads Mirror**, or use **Extend**.
**Cause.** A 16:10 laptop cannot show a 16:9 picture without bars. When the TV leads, the laptop shows the TV's shape.
When the laptop leads, the TV gets bars on the sides instead. There is no arrangement where both are full-screen and
identical.

### The laptop and TV are on different sizes
**Do.** Nothing; the app repairs it at launch and at every reconnect. Otherwise press **Match Laptop**.
**Cause.** A laptop size the TV cannot render, such as 2560×1600, or Laptop Leads Mirror switched off while the app
was not running. The app re-mirrors the set, which makes macOS put the laptop back on the TV's size.

### The picture is stretched or the wrong shape
**Do.** Check the status line. If the TV is on a 16:10 size, press **Best for Display**. If the projector crops the
edges, use **Underscan**.

## Connection

### The display connects and disconnects every ten seconds
**Do.** Reseat both ends of the cable. Try another HDMI input or a different adapter. Quit DisplayHelp to prove it is
not involved: the cycling continues without it.
**Cause.** An HDMI link or HDCP renegotiation problem. In **Recent Events** it looks like repeating
`connected` / `mirrored` / `disconnected` triplets with no `modeChanged` between them. The app only reacts to each
reconnect; it never disconnects anything.

### The app asks Mirror or Extend for a display it already knew
**Cause.** The display's serial number changed (some TVs report 0, or a new value after a firmware update), or the
saved data was removed by the uninstaller with purge on. Answer once and it is remembered again.

### The card says "Display 2" instead of the TV's name
**Cause.** The EDID was not readable at the moment the display appeared, usually during cable flapping. The app
re-reads it two seconds later and updates the name. Since version 0.1.0 it never saves the placeholder as the
display's name.

### Only the built-in display is found
**Do.** Press **Detect Displays**; the message under the cards says it: check the cable and the projector's input. On a USB-C dock, try the
Mac's own port.

## Controls and buttons

### Match Laptop and Best for Display are both greyed
**Cause.** The current mode matches both recommendations, or no candidate is available. There is nothing to apply.
The status icon can still be the grey ⓘ when the current refresh rate is below 50 Hz.

### The TV shows a grey ⓘ at 30 Hz but the built-in card is green at 60 Hz
**Do.** Check the TV’s **Refresh Rate** options, or try **Best for Display** / **Match Laptop** when you want
recommendations applied. If no faster mode works, check the display input, adapter and cable capabilities.
**Cause.** The status icon flags any external display that is not a mirror follower when it runs below 50 Hz; when a faster rate exists at the same size, an orange one-click hint appears under the status line. Mirrored displays share a logical size,
but their reported refresh rates need not match. A green built-in follower does not validate the TV’s rate.
Recommendations prefer 50 Hz or better, but fall back when none is available.

### A profile does not appear as current after connecting the external display
**Do.** Open its preview and review differences. Apply it to restore the saved setup, or overwrite it only if
the current settings are the ones you want to keep.
**Cause.** Matching includes the exact display set and every saved setting. Full profiles include brightness and audio;
layout-only profiles deliberately ignore picture levels, underscan and audio.
A profile saved with only the laptop connected does not describe a laptop-plus-TV setup. Automatic loading
also requires an exact, unambiguous set and must be enabled explicitly.

### Identical monitors cannot save or automatically load a profile (since 0.6.6)
**Cause.** Separate profile settings require distinct macOS display UUIDs. Missing or duplicate UUIDs still
block saving. Profiles that use UUIDs to distinguish matching hardware identities always require manual preview;
automatic loading is unavailable even after a successful save.

**Do.** Open the profile or its favorite shortcut and check the numbered screens before applying. If saving is
blocked, use **System Settings → Displays** to arrange the monitors. The app cannot manually assign identities
yet; renaming monitors or resetting app data will not resolve the ambiguity.

### A profile targets the wrong identical monitor after cables or ports were swapped (since 0.6.6)
**Do.** Cancel the preview, or choose **Revert** if changes are pending. Recreate the intended layout and
resolutions, then choose **Profile → Overwrite with Current Settings → ‹profile name›**. Repeat separately for
each template after arranging its intended settings. Scope and favorite assignments are preserved.

**Cause.** The macOS identifier can describe a connection rather than follow a physical monitor across port
swaps. Re-saving records the current matching; it does not enable automatic loading or fix missing UUIDs.
See the [complete identical-monitor workaround](user-guide.md#identical-monitors-limits-and-workaround-066).

### A manual change reverted before I could keep it
**Cause.** Confirmation expires after 20 seconds, including time asleep. A connection change or failed readback
can also trigger recovery. Apply the change again and choose Keep Changes only after checking all screens.
Closing the menu does not dismiss the floating confirmation window.

### Revert could not restore every setting
**Do.** Use **Open Display Settings** and inspect the reported failures. Reconnect missing monitors or audio
outputs and check mode availability. A saved mirror group requires its primary to be connected and identifiable.
**Cause.** Rollback is a hardware operation and can fail if capabilities or connections change. The app preserves
previous reconnect preferences and reports incomplete recovery rather than treating it as success.

### Favorite shortcuts do nothing
**Do.** Expand **Quick Switch Profiles**, choose a profile beside **Favorite 1 (⌘⌥1)** or **Favorite 2 (⌘⌥2)**, then
press the shortcut from any app while DisplayHelp is running. If the note "System-wide shortcut unavailable" appears
under a slot, use **Preview** or the in-app shortcut instead.
**Cause.** The shortcuts are system-wide hotkeys registered while a favorite is assigned; another app may already own
the combination. They are unavailable during a display operation or pending confirmation and open a preview before
applying anything.

### The profile library cannot be loaded
**Do.** Choose **Recover Profiles from Backup** if offered. It restores the previous valid library and archives
the unreadable original. If no usable backup exists, **Archive Unreadable File and Start Fresh…** preserves the
original and creates an empty library. See [data-file recovery](data-files.md#profile-file-recovery).
**Cause.** Invalid JSON, invalid profile values or a filesystem access problem. Saving new profiles is blocked
until recovery so the unreadable original cannot silently be overwritten.

### Reconnect preferences could not be saved
**Do.** Keep the reported error and copy diagnostics. If `known-displays.json` is unreadable, quit the app, make
a backup copy and repair it or move it aside before relaunching. Check directory permissions for write errors.
**Cause.** Verified hardware changes and saving their reconnect preferences are separate operations. A storage
error does not prove the hardware change failed, but that change may not be recalled on reconnect.

### No Brightness slider on the external display
**Do.** Read the card’s unavailable-control explanation. Check the monitor’s DDC/CI setting and try a supported
connection. Use Copy Diagnostics if help is needed.
**Cause.** No readable control value was returned; that alone does not identify the exact cause. Ports, adapters
and monitors vary. The built-in HDMI port on Apple silicon laptops refuses DDC/CI commands while still reading the
display’s identity; the same monitor often answers over USB-C. Intel DDC control is not implemented. When connected
monitors have ambiguous identities, DDC is deliberately disabled to avoid controlling the wrong screen. Layout
controls can still work.

### HDCP shows Unavailable
**Do.** Expand **More Controls** and read the reason after the dash under **Check HDCP** (also shown in the ⓘ popover;
the status line shows nothing when unavailable). For an ambiguous match, disconnect the identical monitor. For no
answer within the time limit, press **Check HDCP** again once the display has settled.
**Cause.** The reading could not be made: identical monitors that cannot be told apart, an Intel Mac (no display
service to query), a macOS version without the status interface, a refused query, a previous check still waiting
for macOS, or no answer within three seconds. It is not a statement about the display.

### HDCP shows Unprotected or Negotiating
**Do.** Start the protected content, wait a few seconds, then press **Check HDCP**. Negotiating is re-read once
automatically after five seconds.
**Cause.** Unprotected means nothing is asking for protection right now, or the negotiation has not completed.
Negotiating is the in-progress state right after connection. Neither is a fault on its own. If protected playback
still fails while the state stays Unprotected, the chain between the Mac and the display is the next thing to check;
on DisplayPort connections the topology sentence reports whether a repeater is present and, for an HDCP 2 repeater, any limit flags it sets.

### No Rotation or Underscan row
**Cause.** macOS did not expose a usable rotation interface or adjustable underscan range. The card’s explanation
distinguishes an unavailable interface from a display reported as unable to rotate. Do not assume every physical
monitor that can swivel exposes software rotation through this connection.

### The Resolution picker is missing a size I can see in System Settings
**Cause.** By design: the size is not in the display's EDID detailed timings, so it is likely to render badly, or it is
above the display's Signal Cap (a caption under the picker says so). It is
still listed in the ⓘ popover under Supported Resolutions. If you are sure the display renders it, set it in System
Settings; the app will keep it and show it in the picker as the current size.

### A custom fix does not appear
**Cause.** The file failed the safety check: not owned by you, world-writable, or a symbolic link. The log says which:

```
log show --last 10m --info --predicate 'subsystem == "DisplayHelp"' | grep "unsafe custom script"
```

Fix with `chmod 0755` and `chown` to your user. Also confirm it ends in `.sh` and has a `# name:` line.

## Errors in Recent Events

### `applyFailed` with CGError 1001
**Cause.** macOS refused a mode. Common case: a mode that only exists while mirrored was requested after switching to
Extend. Profile restore attempts the saved mode rather than silently choosing another one; failure triggers
an attempt to restore the previous setup. Check available modes or explicitly choose **Detect Displays**.

### `applyFailed` with CGError 1007
**Cause.** A mirror request for a set that was already mirrored that way. The app guards against this; if it appears,
a reconnect clears it.

### `applyFailed` with "preset mode … unavailable"
**Cause.** The saved mode is not offered by the display on this connection (different port, different cable, or a
size the picker now hides). Pick a size once and the preset is replaced.

### `scriptFailed`
**Cause.** A fix script exited non-zero. The detail holds the exit code and the last line of its output.

## The app itself

### The Mac keeps coming up wrong regardless of what is picked
**Do.** **Troubleshooting → Reset Display Preferences** 🔒. Everyone is logged out.
**Cause.** WindowServer's own display database is corrupt. The reset deletes it and macOS rebuilds it.

### Check for Update shows no Install button, or says an administrator must approve DisplayHelp Updater
**Do.** Click **Set Up Self-Service Updates…**, then have an administrator allow "DisplayHelp Updater" in System Settings ›
General › Login Items & Extensions (the dialog's **Open Login Items** button goes there). Run Check for Update… again.
**Cause.** Installing a package needs root, so DisplayHelp uses a launchd daemon that macOS only starts after one admin
approval per Mac. Until then the dialog offers Download, which asks for an administrator password when the package opens.
If approval is already given and Install still fails, the daemon's log is under subsystem `com.displayhelp.updater` in Console.

### The icon is not in the menu bar
**Cause.** macOS hides menu bar extras when app menus need the room, or the app is not running. Open it from
`/Applications`. If it no longer starts at login, turn DisplayHelp back on in System Settings › General › Login Items › Allow in the Background.

## Collecting diagnostics for the helpdesk

**Troubleshooting → Copy Diagnostics** copies a local text report with app/macOS versions, display identities and macOS display UUIDs, modes, each display's `Signal (requested):`, `Signal Cap:`, `EDID Cap:` and `EDID (<n> bytes):` (the EDID as hex, followed by the decoded manufacturer, product, serial, timings, range limits, video codes and HDMI block; while the EDID Cap is in, an `EDID (display's own, …)` block follows, on Intel an `EDID (in use, …)` block with the override file, and a `Trim:` line says what changed; a refused cap puts its raw reason on the `EDID Cap:` line) lines plus `Virtual EDID probe:` and a `Busy` line (whether and why Forget and Reset All are disabled), layout,
the active audio output with volume and mute, the last HDCP reading for each external display with raw values and any topology,
control-availability explanations and up to 20 recent events. Placement and rotation entries include requested settings, observed bounds/angles and verification. A shared `change=` ID links each operation to its Keep/Revert outcome, including timeout or disconnect recovery. It does not upload anything. Review names, serial identities
and event details before sharing. For a deeper investigation, collect these files and the unified log:

```
~/Library/Application Support/DisplayHelp/history.jsonl
~/Library/Application Support/DisplayHelp/known-displays.json
~/Library/Application Support/DisplayHelp/profiles.json
log show --last 1h --info --predicate 'subsystem == "DisplayHelp"' > displayhelp.log
```

Reading `history.jsonl`: one JSON object per line, newest last. `mode` is the display's mode **before** the event;
`detail` is the target mode or the error text. The pattern that matters most:

| Pattern | Meaning |
|---|---|
| `connected` → `mirrored` → `disconnected`, repeating every 8 to 13 s | Repeated connection loss; compare with DisplayHelp quit and a known-working adapter/cable. The log alone cannot identify the cause. |
| `modeChanged` with `detail` 3840×2160 and no HiDPI | Something put the TV on pixel-exact 4K; press Best for Display |
| `applyFailed` right after `extended` | A saved mode may require mirroring; inspect the reported restore/recovery result |
| `present` at launch with the wrong mode, then no `modeChanged` | No preset saved; pick a size once |
| `signalCapApplied` after `connected` | The display came up above its Signal Cap and was lowered; normal |
| `edidCapSuspended` | The EDID Cap is paused: the display's EDID changed since the cap was turned on |

The **ⓘ** popover on a card is also worth a screenshot: it shows the EDID-guaranteed sizes and what each
recommendation would pick, which explains most "why did it choose that" questions.


### Clear history, forget a display, or start fresh

These are separate actions:

| Action | Removes | Keeps |
|---|---|---|
| **Troubleshooting → Recent Events → Clear Connection History** | Current event log, moved into an archive | Remembered monitor preferences, profiles and favorites |
| **Display options (…) → Forget This Display…** | That external monitor's remembered name, reconnect preferences, Signal Cap and EDID Cap (on Apple Silicon the display first gets its own EDID back and reconnects) | Current screen settings, profiles/favorites and connection history |
| **Troubleshooting → More → Reset All DisplayHelp Data…** | All active remembered monitors, profiles/favorites, automatic choices and history | Current hardware settings and custom fixes |

Automatic profiles are **opt-in**. Under **Profile → Load Automatically When Connected**, uncheck individual
profiles or choose **Turn Off All Automatic Profiles**. Manual profile use and favorites still work. Forgetting a
monitor does not edit profiles: if an enabled automatic profile includes it, that profile can restore settings
at the next connection or launch. The Forget confirmation warns about this. Disable automatic loading if you
want DisplayHelp to ask how to use the monitor again on reconnect.

The full reset requires **Back Up and Reset** confirmation. Previous data, including history archives, is saved
beside the new folder as `~/Library/Application Support/DisplayHelp-backup-<UUID>/`.
**Show Data Backup in Finder** reveals it afterward. The backup retains the old information; reset is not secure
erasure. Separately exported profiles are unaffected. To restore a backup, quit DisplayHelp, move the new
`DisplayHelp` folder aside, then rename the backup to `DisplayHelp` in the same parent folder.

Reset/Forget are unavailable during queued display operations or a pending Keep/Revert decision, and a click that lands while one is in flight says "DisplayHelp is still finishing a display change. Try again in a moment." The Forget confirmation is a dialog that comes to the front. If a display's own EDID cannot be given back, nothing is forgotten or reset and the message names the display. Full reset also
waits for running custom fixes. A staging failure preserves the original data. Neither action changes the current
resolution, arrangement, rotation, picture levels or audio. **Reset Display Preferences** is a different command
that resets macOS display configuration.

## Installer completed but the old version is still visible

Before 0.6.1, installation replaced the bundle but could leave the old app process running. Quit DisplayHelp normally,
then open `/Applications/DisplayHelp.app`. The About panel should show the installed version. Saved profiles remain.
Starting with 0.6.1, the installer requests a normal quit before replacing the app. Finish or revert any pending
change if the installer reports that DisplayHelp could not close, quit the app, then rerun the installer.

## The menu looks too short

Update to 0.6.6 or later. Its compact menu fits its content up to 900 points of height within the screen's available area. Expand More Controls for advanced settings and Troubleshooting for fixes. On smaller screens,
scroll inside the menu to reach the remaining display cards and footer controls. A mirrored layout shows one box
labeled with both screen numbers because both screens share a desktop.

## Identify Displays shows a shared number, or a label disappears

Mirrored screens share one desktop and therefore show the same group label, such as **1 + 2**. Use Extend for independent desktops. Labels disappear after five seconds or a display-configuration change; click Identify Displays again to show them. The button appears beneath Screen Layout when an external display is detected. It does not request screen-recording access or capture desktop content.

## Built-in speaker volume does not appear, or the wrong device is named

Use 0.6.3 or later and check the device named under **Output Volume** beneath Screen Layout. Select the Mac’s speakers in macOS Sound or the display’s Audio picker. Output Volume follows the active system device; a display’s Audio picker is also its saved reconnect preference. The separate Monitor Volume slider is for the monitor’s DDC control, not the Mac’s speakers.

If Output Volume says the device does not expose an adjustable control, use the device’s own controls. HDMI outputs often behave this way. Copy Diagnostics includes the active output, available system volume and mute state, separately from monitor volume.

If an audio device changes while you adjust it, the app refuses the stale adjustment and asks you to use the newly selected output. Failed writes show the current readback and an explanation. No saved display profile is overwritten by an output-volume adjustment.

### Placement appears reversed

The action names the screen being placed and its reference screen. To put an external display left of the laptop, open **Place…** on the external card and choose **Relative to Built-in Display → Place [external name] left of Built-in Display**, then alignment. Left on the built-in card means the opposite relationship. Check the visible readout and preview, then Keep Changes. For a failed move, share Copy Diagnostics immediately so its latest 20 events include the request and result.

## The app uses an unexpected language

Choose **globe → Follow System**, then restart DisplayHelp. Check any per-app override in **System Settings → General → Language & Region → Applications**. A language selected through the globe overrides the system list for this app. Unsupported languages fall back to another supported preferred language, then English. Custom display/profile names, script output and older stored diagnostic text may remain in their original language.

The globe is temporarily unavailable while display changes, profile checks or fixes run. Finish or revert the operation first.

For illustrated globe-menu and restart instructions, see [Language](user-guide.md#language). Choosing Later saves the selection but keeps the current process in its existing language until you quit and reopen DisplayHelp.
