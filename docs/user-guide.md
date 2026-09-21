# DisplayHelp user guide

Control by control. The [README](../README.md) is the short version; this is the complete one.

## Contents

1. [Opening the app](#opening-the-app)
2. [The menu bar icon](#the-menu-bar-icon)
3. [Profile row](#profile-row)
4. [Keep or revert display changes](#keep-or-revert-display-changes)
5. [Detect Displays](#detect-displays)
6. [Display cards](#display-cards)
7. [When something is refused](#when-something-is-refused)
8. [Fixes](#fixes)
9. [Recent Events](#recent-events)
10. [Start at Login, Quit, About](#start-at-login-quit-about)
11. [The connect dialog](#the-connect-dialog)
12. [What is remembered, and when it is applied](#what-is-remembered-and-when-it-is-applied)
13. [Keyboard and accessibility](#keyboard-and-accessibility)

---

## Opening the app

In 0.6.1, the menu opens up to 900 points tall, limited by the available screen height. Scroll inside it for any controls below the visible area.

DisplayHelp has no Dock icon or main window. Profile previews, import/export and confirmations use dialogs.
Click its menu bar icon to open the menu;
click anywhere else or press Escape to close it. If the icon is missing, macOS may have hidden it to make room for
app menus on a narrow screen, or the app is not running: open it from `/Applications`.

## The menu bar icon

The icon reports the display state without opening the menu:

| Icon | Meaning |
|---|---|
| Two stacked rectangles | At least one display is mirrored |
| Two displays side by side | More than one display, extended |
| One display | Only the built-in panel is connected |

## Profile row

![DisplayHelp 0.6.1 layout and favorites, rendered by the production UI with sample display data](images/layout-profiles.png)

The current diagram shows screen geometry, names and rotation; it does not stream desktop content. The older
screenshots below are labeled historical references. See [screenshot provenance](README.md#screenshots).

<p align="center">
  <img src="images/profiles.png" width="380" alt="DisplayHelp 0.5.1 Profile menu with Demo, overwrite, remove, automatic loading, export, save and import commands over the connected Samsung and built-in display cards">
</p>

**Profile: ‹name›** or **Profile: Choose or Create…** at the top left. A profile is a named snapshot of every
connected display: arrangement, size, refresh rate, readable brightness, contrast and volume, rotation, underscan,
mirror leadership, position, main display and audio preference. It also captures the active system audio output when saved as **Full setup**.

The save form offers **Full setup** or **Layout only**. Layout-only profiles save resolution and refresh rate,
rotation, position, the main display and exact mirror groups. They leave brightness, contrast, monitor volume,
underscan, reconnect audio preferences and the active audio output alone. Each display can have a different
resolution in Extend mode. Save two layouts under different names to switch between your two templates.
Overwriting or updating an existing profile preserves its scope; saving its name through the save form uses
the scope selected there.

| Menu item | What it does |
|---|---|
| A profile name | Opens a current → saved preview. Apply restores every connected display it covers. Displays outside the profile receive no saved settings, though macOS may reposition them when the main display changes. Updates verified per-display reconnect presets after you keep the changes. Choose it again after reconnecting to restore the whole layout and system audio output. |
| **Overwrite with Current Settings ›** | Replaces any profile with what is on screen now. |
| **Favorite Shortcuts ›** | Assign a profile to Favorite 1 or Favorite 2, or remove its favorite assignment. Assigning an occupied slot replaces its previous assignment. |
| **Remove ›** | Deletes one profile. |
| **Update "‹name›" with Current Settings** | Overwrites the profile you last applied or saved with what is on screen now. Appears once you have used one this session. |
| **Load Automatically When Connected ›** | Opt in per profile. Exact, unambiguous display-set matches load at connection or launch, without a confirmation dialog. |
| **Export… ›** | Export one or all profiles as JSON. |
| **Import Profiles…** | Validate and import JSON, mapping missing display/audio identities to this Mac if needed. Existing names are preserved with numbered suffixes. Imports start with automatic loading off and no favorite assignments. |
| **Save Current Setup As…** | Opens a name field. Choose Full setup or Layout only, type the room or purpose, and press Return or Save. Typing an existing name replaces it. |

Favorites appear as two direct buttons beneath the profile row. Clicking one, or pressing **⌘⌥1** / **⌘⌥2**
while DisplayHelp is active, opens its preview. These are app-local shortcuts, not global hotkeys.

The title shows a profile only when every saved setting matches actual readings and the connected display set
matches. Levels, rotation, underscan, position, main display, actual mirror leadership and audio are checked too.
Layout-only matching ignores picture levels and audio. An unreadable saved value cannot be verified and does not count as a match. Status refreshes every five seconds
while the menu is open; “Checking…” appears while hardware operations are pending.

Saving waits for pending slider and rotation changes before reading settings. Restoring temporarily disables display
controls, applies settings in order, then reads them back. The preview identifies disconnected displays; Apply to Connected Displays restores the identifiable subset.
An unavailable saved mirror primary prevents reproducing that mirror group. A failed application or verification
triggers an attempt to restore the previous setup, with remaining mismatches reported. Displays with ambiguous identities are skipped safely.

New profiles record the exact primary of each mirror group, including external-only mirror groups with an
extended laptop. Older profiles remain readable and use their saved Laptop Leads Mirror preference. Update them to capture positions, the main display and system audio output; those
fields were absent from older saves. A saved mirror follower mode can only be restored if macOS offers it under the
saved primary. Incompatible old mirror settings are reported instead of silently replaced by recommendations.

<p align="center">
  <img src="images/restore-preview.png" width="392" alt="Live Demo profile preview proposing a built-in brightness change from 41 to 42, with Cancel and Apply">
</p>

Manual restores show before/after values first in a compact dialog. Its content grows only as needed,
up to a 220-point scrollable area, so short previews do not leave a large empty panel. Missing or ambiguous displays are skipped; unavailable modes and
missing audio devices are identified. Cancel makes no display changes. If the connected display set changes while
the preview is open, open a fresh preview before applying. The Apply button is disabled when no saved display can
be identified. Mode availability can change after rotation or mirroring, so preview warnings are advisory.

Automatic loading is opt-in and bypasses the preview. It waits one second for a matching connection set to settle,
requires exactly one enabled match, and does not retry repeatedly after failure or after manual mode changes.
Enabling it takes effect on the next connection or app launch. Selecting another profile for the same saved set
disables the previous choice. Disable its checkbox to stop automatic loading.

To move a setup to another Mac, export it, then import on the destination. Map the old built-in panel to the new
built-in panel and map any missing external displays/audio devices. Keep a saved identity if that device will be
connected later. Audio mapping updates both the profile's active output and its reconnect preferences. Import
rejects two displays mapped to one device; it never applies settings immediately.

**When to use profiles.** Whenever the same displays are used in more than one way, or the laptop visits more than
one room. One profile per room is the common pattern. A single display you only ever mirror does not need one: the
app already remembers its settings.

## Keep or revert display changes

![DisplayHelp 0.6.1 single Keep/Revert window, captured with an isolated sample confirmation](images/keep-changes.png)

Manual layout changes, resolution/refresh changes, rotation, underscan, Detect Displays and profile applications
capture the previous setup before changing hardware. The current resolution of every connected screen must be
readable before a reversible change can begin. After a successful change, **Keep Changes** and **Revert**
appear with a **20-second** countdown. Keep confirms the observed setup before saving reconnect preferences;
Revert or an expired countdown attempts to restore the previous setup. Sleep does not extend the deadline.
A display connection change during confirmation also triggers recovery.

The confirmation has its own floating window, so closing the menu does not dismiss it. Display controls are
unavailable while an operation or confirmation is in progress. Automatic profiles bypass the preview and timed
confirmation, but still verify the result and attempt rollback on failure. Brightness, contrast, monitor-volume
and audio choices do not use the timed layout confirmation.

Recovery depends on connected hardware and available modes. If some previous settings cannot be restored,
use **Open Display Settings** and the reported details. Rejected changes do not replace working reconnect
preferences. If a profile file cannot load, **Recover Profiles from Backup** is offered when a valid backup exists;
**Archive Unreadable File and Start Fresh…** preserves the original before creating an empty library.
See [data-files.md](data-files.md#profile-file-recovery) for backup details.

## Detect Displays

The blue button. One click does what a helpdesk would do by hand:

1. Rescans all displays.
2. If the built-in panel is on a pixel-exact mode with a tiny UI, puts it back on its saved or default Retina mode.
3. For each external display, if the wrong side is leading the mirror set, re-mirrors it the right way round.
4. Applies **Match Laptop** to mirrored externals and **Best for Display** to extended ones.

Changes use the same Keep Changes / Revert confirmation. Settings that already match are left alone. If only the built-in panel is found, it says
so under the cards: check the cable and the projector's input.

## Display cards

One card per connected display, in the order reported by macOS.

<p align="center">
  <img src="images/menu.png" width="380" alt="Connected Samsung TV and built-in display mirrored at 1920×1080 HiDPI in DisplayHelp 0.5.1">
</p>

In this capture, the TV reports 30 Hz and the built-in panel reports 60 Hz. Mirroring shares a logical
desktop size; each card reports that display’s own mode and refresh rate. The TV’s orange dot flags
a rate below 50 Hz. Rotation is available here, but external brightness, contrast, volume and underscan
are absent because their capabilities or readings are unavailable on this connection. Position controls
are hidden while mirrored.

### Header
- **Symbol.** Laptop for the built-in panel, TV when EDID detailed timings include a 4K-class size, monitor
  otherwise. A 4K TV can show the monitor symbol if its EDID timings are unavailable.
- **Name.** The EDID name, or the name you gave it.
- **Status line.** "Mirrored · 1920×1080 HiDPI · 60 Hz". The first part is one of **Mirrored**, **Extended**,
  **Extended, main** (the display holding the menu bar), or **Only display** when nothing else is connected.
- **Dot.** Green: on a mode DisplayHelp would choose. Orange: not, which means pixel-exact 4K, a size the EDID does
  not guarantee, or a refresh rate below 50 Hz. Hover for the reason.
- **Pencil** (externals only). Rename. Type and press Return; Escape cancels. The name is stored against the
  display's vendor/model/serial identity in this user’s local store. Renaming does not transfer settings to another Mac
  or distinguish devices that report the same identity.
- **ⓘ** opens a details popover: vendor, model, serial, native size, EDID-guaranteed sizes, the current mode, what
  each recommendation would pick, and the identity key. Its **Supported Resolutions** list is every mode macOS
  offers, one line per size with its refresh rates, including the ones the picker hides.

### Arrangement (externals)
**Mirror** and **Extend**. The current one is greyed. The choice is remembered and applied at every reconnect.
Hidden on the built-in panel, which has no arrangement of its own.

### Resolution
One entry per size and scaling, at its best refresh rate. "HiDPI" means the display renders at double resolution
and draws the UI at half, which is what you want on a 4K TV. Only sizes from the display's EDID detailed timings
are listed, because TVs advertise sizes they cannot render. The current size is always listed even if it is not one
of them, so the picker never goes blank. If no EDID detailed timings are readable, the app uses the usable modes
reported by macOS without that additional filter.

### Refresh Rate
Appears when the current size offers more than one rate. Fastest first.

| Rate | When |
|---|---|
| 60 Hz | Default. Smooth mouse and motion. |
| 50 Hz | PAL video content, or a display that only syncs cleanly at 50. |
| 30 Hz | A long or cheap HDMI cable that cannot hold 4K at 60. Motion feels heavier but the link holds. |
| 24 Hz | Film playback without judder. Not for working. |

Recommendations prefer 50 Hz or better. If no filtered mode reaches 50 Hz, Best for Display falls back to
the available filtered modes. The orange dot can remain even when no faster recommendation is available.
The Resolution picker labels each size with its highest offered rate; the status line and Refresh Rate control
show the rate actually in use.

### Match Laptop / Best for Display (externals)
- **Match Laptop.** The laptop's logical size on the external, so mirrored text is not rescaled. If the display
  cannot render that size, the closest guaranteed size at or above it, preferring the HiDPI variant.
- **Best for Display.** The display's native resolution at its best refresh, drawn HiDPI when a HiDPI variant
  exists. On a 4K TV that is 1920×1080 HiDPI, not 3840×2160.

Both grey out when the display is already on the mode they would choose. They also run automatically: change the
laptop's size while mirrored and the external re-matches; if it cannot, the laptop snaps to the external's size.

### Laptop Leads Mirror (externals)
Which display's shape wins in a mirror set.

| Setting | Laptop screen | External screen | Use when |
|---|---|---|---|
| Off (default) | Band top and bottom on a 16:10 panel | Full, one shared size | The audience screen matters most |
| On | Full-screen | Bars on the sides | You work on the laptop; the audience screen is secondary |

Remembered per display and re-applied on every reconnect. Ignored when the lid is closed and there is no laptop
panel to lead.

### Audio (externals)
Which output device plays the Mac's sound whenever this display is connected. The list is every output the Mac has
right now, with the display's own HDMI or DisplayPort audio first and marked "(this display)":

| Choice | Room it fits |
|---|---|
| Don't change (default) | Nothing is switched. A call never jumps to a TV because someone plugged in to charge. |
| ‹TV› (this display) | Sound over the same HDMI cable, the common case. |
| External Headphones | Rooms that take audio on a separate 3.5 mm run to the amp. Appears when the cable is plugged in. |
| A USB dock or wall plate | Rooms whose USB-C connection carries audio. |
| An AirPlay receiver, or Crestron AirMedia / Solstice / ClickShare driver | Wireless rooms. Those senders install their own output device; pick it here. |

Remembered per display and included in full-setup profiles, so "Room 204" can mean video over HDMI and sound over the
3.5 mm cable. A saved choice whose device is absent right now is listed as "‹name› (not connected)" so the selection
stays visible; at connect, sound stays where it is and the log says so. Choosing
"Don't change" while the previous choice is playing sends sound back to the Mac's speakers. macOS itself falls back
to the internal speakers when the display is unplugged. This picks which device plays; a TV's own volume stays on
its remote.

### Rotation (externals)
0°, 90°, 180°, 270°. Shown when the display reports it can rotate. Remembered.

### Brightness, Contrast, Volume
The built-in panel shows Brightness when macOS returns a readable value. External displays get the sliders their hardware answers to over DDC/CI.
On Apple Silicon, USB-C and DisplayPort can carry DDC, but support varies by monitor and adapter. HDMI and
some TVs may not expose usable DDC controls.
An absent slider means there is no usable reading, not necessarily that the monitor can never support it.
The card’s unavailable-control explanations describe known limitations without guessing the cause. DDC is not
implemented on Intel Macs, and ambiguous hardware matches disable DDC to avoid changing the wrong monitor.
Values are remembered per display after readback verification.

### Underscan (externals)
A slider that shrinks the picture for projectors that crop the edges. Shown when the display supports it. Remembered.

### Position (extend mode only)
- **Make Main** moves the menu bar and Dock to that display.
- **Place… › ‹other display› › Left / Right / Above / Below** arranges the desktop. Left/right placement offers
  top, center or bottom alignment; above/below offers left, center or right alignment.

The numbered layout preview above the cards shows screen geometry, the main display and rotation. Use it to
check layouts with different screen sizes; placement is controlled by the menus rather than dragging the preview.

Hidden while mirrored, where position has no meaning.

## When something is refused

If macOS refuses a change, a red line appears under the display cards saying what was asked and the error, for
example "Couldn't set 1920×1080 on SAMSUNG: display configuration failed (CGError 1001)". Next to it, **Open
Display Settings** opens macOS's own Displays pane for the rare cases the app cannot handle. The line clears on the
next successful action, and the same failure is recorded in Recent Events as `applyFailed`.

## Fixes

### Reset Display Preferences 🔒
Deletes `/Library/Preferences/com.apple.windowserver*`, `/private/var/db/WindowServer`, every user's
`ByHost/com.apple.windowserver.displays*`, then restarts WindowServer. ColorSync profile files are preserved. **Everyone is
logged out immediately.** Use it for a Mac whose displays keep coming up wrong no matter what is picked. macOS
rebuilds the database on the next login. Needs an administrator password, asked for by macOS's own dialog.
ColorSync preservation requires 0.5.2 or later; older installers can remove display-profile folders.

![Reset confirmation in 0.5.2: display settings are cleared while ColorSync profiles are preserved](images/reset-confirmation.png)

### Custom Fixes
Buttons the helpdesk adds by dropping scripts into:

```
~/Library/Application Support/DisplayHelp/scripts/
```

This is a local folder, not an upload service. Each script is a plain-text zsh file ending in `.sh`, with
metadata comments within its first 20 lines. The app scans the folder every time the menu opens.
The [custom-fix examples](../examples/custom-fixes/README.txt) include installation steps, a harmless demo and
an optional Dock restart. Install as the current user, without `sudo`, and reopen the menu to see the actions.

![Example scripts installed directly in the user's Custom Fixes folder](images/custom-fixes-folder.png)

The scripts appear under **Custom Fixes** after the menu reopens:

![Custom Fixes menu with the harmless demo and optional Restart Dock action](images/custom-fixes-menu.png)

```zsh
#!/bin/zsh
# name: Demo — Test Custom Fixes
# description: Confirms setup without changing settings.
# admin: false
echo "Demo successful — Custom Fixes is working. No settings were changed."
```

| Header | Effect |
|---|---|
| `name` | The button label. Any number of scripts, listed alphabetically by name. |
| `description` | Tooltip and confirmation text. |
| `admin` | `true` adds the lock symbol and runs the script as root through the macOS administrator dialog. `false` runs it as the logged-in user. |

Clicking a button confirms, runs the script, and shows "exit ‹code›, ‹seconds›s. ‹last line of output›" under
Fixes. A non-zero exit shows the same way so a failure is visible.
Run the demo first: an `exit 0` result and the success message confirm installation. Remove a custom action by
moving its script out of the folder and reopening the menu. Scripts run without an interactive Terminal;
they must not wait for typed input. Administrator scripts run as root and must explicitly target the intended user.

![Confirmation for the harmless Custom Fixes demo](images/custom-fixes-confirmation.png)

![Successful demo result with exit 0 and no settings changed](images/custom-fixes-success.png)

**Safety rules, enforced.** A script is ignored, with the reason in the log, when it is not owned by the current
user, is world-writable, or is a symbolic link. For fleet deployment, MDM can push approved scripts into each user's
folder as long as the files end up owned by that user with mode 0755.

### More › Uninstall DisplayHelp… 🔒
Confirms with an "Also remove saved profiles and settings" checkbox, turns off Start at Login, then an administrator
script removes the app bundle and the package receipt, and the app quits. If anything fails the app stays open and
says why. IT can run the same script without the dialog:

```
sudo /bin/zsh /Applications/DisplayHelp.app/Contents/Resources/DisplayHelp_DisplayHelp.bundle/Contents/Resources/Resources/Uninstall/uninstall.sh \
    /Applications/DisplayHelp.app purge /Users/<name>
```

`keep` in place of `purge` leaves the user's data. The script refuses any path that is not `DisplayHelp.app`.


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

## Recent Events

**Copy Diagnostics** copies app/macOS versions, display identities, modes, layout, available-control explanations
and recent events to the clipboard. Nothing is uploaded; review the report before sharing it.

Collapsed by default. The latest events from the history file, newest first, as
`time  kind  display  (detail)`. See [data-files.md](data-files.md#history-event-kinds) for the vocabulary.
**Clear Connection History** archives the list to a dated file. **Show History File** opens the folder in Finder.

## Start at Login, Quit, About

**Start at Login** is on by default after a packaged install. Off means the app must be opened from Applications.
Greyed when running unbundled from `swift run`. Normally **Quit DisplayHelp** leaves the confirmed setup in place.
Quit is disabled while changes are in progress. A system quit request during confirmation first attempts to revert;
if recovery fails, the app stays open so you can finish recovery. The **Ayala Solutions · v‹version›** link opens the About panel.

## The connect dialog

Appears when a display the app has never seen, or one set to "ask", is connected.

- **Mirror**: same picture on both. Remembered.
- **Extend**: second desktop. Remembered.
- **Not now**: leaves macOS's default and asks again next time.

If the display has no saved preferred mode, the app also applies a recommendation right after: Match Laptop when
mirroring, Best for Display when extending.

## What is remembered, and when it is applied

| Setting | Remembered | Applied |
|---|---|---|
| Arrangement | Per display | At every connect |
| Preferred mode (size, refresh, scaling) | Per display, whenever you change it or apply a profile | At launch, at connect, and once per connection if macOS drifts it |
| Brightness, contrast, volume | Per display | At connect |
| Rotation, underscan | Per display | At connect |
| Laptop Leads Mirror | Per display | Whenever mirroring is applied |
| Name | Per display | Always |
| Audio preference | Per external display | When selected and at connect, if the output is available |
| Profiles | Whole setup, by name | After preview and Apply; at connection or launch when automatic loading is enabled for an exact, unambiguous display set |

A mirror follower's size is never set directly: the primary dictates it. The built-in panel's saved mode can be
restored when extended or when it leads the mirror set. Automatic restoration still avoids pixel-exact Retina
modes; explicitly loading a profile attempts the exact saved mode and verifies the result.

## Keyboard and accessibility

- **⌘⌥1** and **⌘⌥2** preview assigned favorites while DisplayHelp is active.
- In the confirmation window, Return keeps changes and Escape reverts.
- Every control has a name for VoiceOver, including the sliders (with their percentage), the pencil and the ⓘ.
- Tab moves through the controls in reading order; Escape closes the menu and cancels a rename or profile name.
- Colour never carries meaning alone: the green/orange dot has a spoken label and a tooltip.
- The menu respects the system's text size, light and dark appearance, and increased contrast.
