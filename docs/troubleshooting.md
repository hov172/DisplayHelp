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
**Do.** Wait two seconds. If still wrong, press **Detect Displays**.
**Cause.** macOS re-mirrors on its own at plug-in and the Dock keeps the previous display's geometry. The app
restarts the Dock after any display change that ends mirrored, once the burst of changes settles.

### The TV shows snow, noise, or "mode not supported"
**Do.** Pick 1920×1080 in Resolution, or press **Match Laptop**.
**Cause.** TVs advertise sizes such as 1680×1050 as "standard timings" but only render their EDID "detailed
timings", typically 3840×2160 and 1920×1080. The picker now hides sizes the EDID does not guarantee and the
recommendations never choose them. Actual support still depends on the display, port and cable. If a manual change makes the screen unusable,
wait for the confirmation deadline to revert instead of keeping it.

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
**Do.** The message under the cards says it: check the cable and the projector's input. On a USB-C dock, try the
Mac's own port.

## Controls and buttons

### Match Laptop and Best for Display are both greyed
**Cause.** The current mode matches both recommendations, or no candidate is available. There is nothing to apply.
The dot can still be orange when the current refresh rate is below 50 Hz.

### The TV is orange at 30 Hz but the built-in card is green at 60 Hz
**Do.** Check the TV’s **Refresh Rate** options, or try **Best for Display** / **Match Laptop** when you want
recommendations applied. If no faster mode works, check the display input, adapter and cable capabilities.
**Cause.** The status dot flags external-primary rates below 50 Hz. Mirrored displays share a logical size,
but their reported refresh rates need not match. A green built-in follower does not validate the TV’s rate.
Recommendations prefer 50 Hz or better, but fall back when none is available.

### A profile does not appear as current after connecting the external display
**Do.** Open its preview and review differences. Apply it to restore the saved setup, or overwrite it only if
the current settings are the ones you want to keep.
**Cause.** Matching includes the exact display set and every saved setting. Full profiles include brightness and audio;
layout-only profiles deliberately ignore picture levels, underscan and audio.
A profile saved with only the laptop connected does not describe a laptop-plus-TV setup. Automatic loading
also requires an exact, unambiguous set and must be enabled explicitly.

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
**Do.** Assign slots under **Profile › Favorite Shortcuts**, activate DisplayHelp and press **⌘⌥1** or **⌘⌥2**.
**Cause.** These are local shortcuts, not system-wide hotkeys. They are unavailable during a display operation or
pending confirmation and open a preview before applying anything.

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
and monitors vary. Intel DDC control is not implemented. When connected monitors have ambiguous identities,
DDC is deliberately disabled to avoid controlling the wrong screen. Layout controls can still work.

### No Rotation or Underscan row
**Cause.** macOS did not expose a usable rotation interface or adjustable underscan range. The card’s explanation
distinguishes an unavailable interface from a display reported as unable to rotate. Do not assume every physical
monitor that can swivel exposes software rotation through this connection.

### The Resolution picker is missing a size I can see in System Settings
**Cause.** By design: the size is not in the display's EDID detailed timings, so it is likely to render badly. It is
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
**Do.** **Fixes › Reset Display Preferences** 🔒. Everyone is logged out.
**Cause.** WindowServer's own display database is corrupt. The reset deletes it and macOS rebuilds it.

### The icon is not in the menu bar
**Cause.** macOS hides menu bar extras when app menus need the room, or the app is not running. Open it from
`/Applications`. If **Start at Login** was turned off, turn it back on in the menu.

### Start at Login is greyed
**Cause.** The app is running unbundled, from `swift run`, where there is no login item to register.

## Collecting diagnostics for the helpdesk

**Copy Diagnostics** copies a local text report with app/macOS versions, display identities, modes, layout,
control-availability explanations and recent events. It does not upload anything. Review names, serial identities
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
| `connected` → `mirrored` → `disconnected`, repeating every 8 to 13 s | Cable or HDCP, not settings |
| `modeChanged` with `detail` 3840×2160 and no HiDPI | Something put the TV on pixel-exact 4K; press Best for Display |
| `applyFailed` right after `extended` | A saved mode may require mirroring; inspect the reported restore/recovery result |
| `present` at launch with the wrong mode, then no `modeChanged` | No preset saved; pick a size once |

The **ⓘ** popover on a card is also worth a screenshot: it shows the EDID-guaranteed sizes and what each
recommendation would pick, which explains most "why did it choose that" questions.


### Clear history, forget a display, or start fresh

These are separate actions:

| Action | Removes | Keeps |
|---|---|---|
| **Recent Events → Clear Connection History** | Current event log, moved into an archive | Remembered monitor preferences, profiles and favorites |
| **Display options (…) → Forget This Display…** | That external monitor's remembered name and reconnect preferences | Current screen settings, profiles/favorites and connection history |
| **Fixes → More → Reset All DisplayHelp Data…** | All active remembered monitors, profiles/favorites, automatic choices and history | Current hardware settings, custom fixes and Start at Login |

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

Reset/Forget are unavailable during queued display operations or a pending Keep/Revert decision; full reset also
waits for running custom fixes. A staging failure preserves the original data. Neither action changes the current
resolution, arrangement, rotation, picture levels or audio. **Reset Display Preferences** is a different command
that resets macOS display configuration.

## Installer completed but the old version is still visible

Before 0.6.1, installation replaced the bundle but could leave the old app process running. Quit DisplayHelp normally,
then open `/Applications/DisplayHelp.app`. The About panel should show the installed version. Saved profiles remain.
Starting with 0.6.1, the installer requests a normal quit before replacing the app. Finish or revert any pending
change if the installer reports that DisplayHelp could not close, quit the app, then rerun the installer.

## The menu looks too short

Update to 0.6.2. Its menu uses up to 900 points of height within the screen's available area. On smaller screens,
scroll inside the menu to reach the remaining display cards and footer controls. A mirrored layout shows one box
labeled with both screen numbers because both screens share a desktop.

## Identify Displays shows a shared number, or a label disappears

Mirrored screens share one desktop and therefore show the same group label, such as **1 + 2**. Use Extend for independent desktops. Labels disappear after five seconds or a display-configuration change; click Identify Displays again to show them. The button appears beneath Screen Layout when an external display is detected. It does not request screen-recording access or capture desktop content.
