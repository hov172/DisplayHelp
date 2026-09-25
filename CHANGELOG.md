# Changelog

All notable changes to DisplayHelp. The format follows Keep a Changelog; versions follow Semantic Versioning.

## [0.6.7] - 2026-09-25

- Added the HDCP state macOS reports to each external display’s status line, read once per connection (including displays present at launch) and never on the periodic refresh. Shows the protocol family when protected, or HDCP Unprotected / HDCP Negotiating; nothing when it could not be read. Read-only: DisplayHelp never changes or negotiates protection.
- Added Check HDCP under More Controls to read the state again, with the protection and encryption state and the time of the check. When the DisplayPort receiver reports it, the result states whether a repeater is present, the reported device count and depth, and any topology limit flags; an unreadable capability register is reported as unknown rather than as a result.
- Added the HDCP state and topology to Display Info and, with raw register values, to Copy Diagnostics.
- Added a one-click hint under the status line when a display runs below 50 Hz and the same size is offered at a smoother rate, such as 60 Hz at 1920×1080 without HiDPI.
- Fixed brightness, contrast and monitor volume on macOS 26, where the display service moved in the system registry. Ports that refuse DDC/CI, such as the built-in HDMI port on Apple silicon laptops, still report those controls as unavailable.
- Localized the new strings in all eleven supported languages.

## [0.6.6] - 2026-09-23

- Kept the active profile label and language control stable during periodic read-only hardware checks; pending settings changes still invalidate the label and block language restarts.
- Added Restore Previous Setup after a successful profile switch and an explicitly saved Default Setup. Both persist across restarts and restore through preview and Keep/Revert; a failed undo-snapshot save rolls back the profile switch. Defaults are never inferred from an earlier first connection.
- Added macOS UUID disambiguation for profiles and reversible changes on displays with identical hardware identities. Missing or duplicate UUIDs remain blocked; UUID-based profiles require manual preview and do not auto-load.
- Prevented identical monitors from reading or overwriting shared reconnect preferences. Separate nicknames and DDC controls remain unavailable for ambiguous hardware identities.
- Replaced nested favorite assignment menus with two Favorite rows inside a collapsible Quick Switch Profiles section: choose a profile directly, then use the separate Preview button. The section explains that these shortcuts remain available across profile changes. Empty slots offer profile creation. Expansion is remembered; Save Current Setup as Default is inside, while both restore buttons remain visible outside.
- Added system-wide Favorite 1/2 shortcuts using native hotkey registration. Assigned favorites open the existing preview; removing a favorite releases its shortcut. Conflicts are reported below the affected slot, with local shortcuts retained as a fallback.
- Added display UUIDs to Copy Diagnostics and localized the new profile and shortcut messages in all eleven supported languages. Native-speaker review remains pending.

## [0.6.5] - 2026-09-21

- Added native macOS localization for all 374 app-owned strings in eleven languages: English, German, Spanish, French, Italian, Japanese, Korean, Brazilian Portuguese, Simplified Chinese, Traditional Chinese and Arabic.
- Added a globe menu using the native per-app language preference, with Follow System and a restart confirmation. Language is independent of saved display profiles.
- Adapted controls and recovery buttons to longer translations; added Arabic right-to-left presentation while preserving physical display geometry and technical values.
- Fixed confirmation dialogs appearing behind the app; native alerts and the Keep/Revert panel retain foreground visibility and keyboard focus.
- Checked the newest four languages against Apple terminology and corrected 36 entries. Independent native-speaker review remains pending.
- Fixed an import-mapping crash by attaching display and audio menus before activating their layout constraints.
- Updated user/helpdesk documentation, screenshots, downloadable guides and release assets. Existing profile data remains compatible.

## [0.6.4] - 2026-09-21

Full release. Compact menu, visible placement/rotation, and detailed troubleshooting traces. Existing audio behavior is retained.

- Each display card now shows its detected side/alignment and rotation beside an always-visible Place menu. Placement actions name both screens; nonstandard layouts show Custom position. Make Main is available in Place.

- Diagnostics now include up to 20 recent events with linked change IDs, before/requested/readback layout details, verified rotation results, and explicit Keep/Revert/timeout/disconnect/quit/failure outcomes. Full history remains local.

- Fixed placement of the main display: normalize the full desktop around the existing primary display, preserving its role and requested edge/center alignment. Placement events now include the chosen alignment.

- Compact screen layout and audio controls; advanced per-display controls expand under More Controls.
- Detect Displays, fixes, connection history and diagnostics are grouped under Troubleshooting.
- Menu height follows its content within the available display height; longer configurations scroll.
- Added an isolated native preview and refreshed documentation screenshots and downloadable guides. Profile storage remains compatible.

## [0.6.3] - 2026-09-20

Full release. Feedback and suggestions are welcome.

### Added
- Output Volume follows the active macOS audio device, including built-in speakers, with supported volume and mute controls and live audio-device/property updates. Unsupported fixed-volume outputs explain the limitation.
- Monitor Volume now explicitly labels the separate external-monitor DDC control. Diagnostics distinguish system output volume/mute from monitor volume. Output volume and mute do not change saved display/profile preferences.

## [0.6.2] - 2026-09-20

Testing release. Feedback and suggestions are welcome.

### Added
- Identify Displays shows temporary numbers and names matching Screen Layout on each connected desktop. Mirrored screens share a group; labels disappear after five seconds or a display-configuration change without intercepting clicks or changing settings.

### Documentation
- Refreshed all current UI captures for 0.6.2, including Identify Displays, and clarified main-display selection and profile saving. Updated downloadable guides and testing-release assets.

## [0.6.1] - 2026-09-20

### Added
- **Forget This Display…** removes one external display's remembered name and reconnect preferences, preserving saved profiles and connection history. The confirmation warns when enabled automatic profiles include the display.
- **Turn Off All Automatic Profiles**, alongside existing optional per-profile automatic-loading toggles. Saved and imported profiles default to manual loading.
- **Reset All DisplayHelp Data…** offers a separate, confirmed fresh start with a recoverable backup. It clears active preferences/profiles/history while preserving current hardware settings, custom fixes and Start at Login.

### Changed
- Completed data-management instructions and replaced every earlier-version screenshot with 0.6.1 captures; refreshed downloadable guides and the complete screenshot archive.
- Renamed the history action to **Clear Connection History** and clarified that it preserves profiles and display preferences.

### Fixed
- Installer now asks the running app to quit normally before replacing it, waits for rollback/exit, and refuses the upgrade if the app remains active. It launches the new version after installation instead of reopening the old process.
- Installer scripts leave other boot volumes alone and skip launching at the login/setup screen.
- Menu now requests an explicit height of up to 900 points, limited by available screen space, instead of accepting macOS's short default popover. Additional controls remain scrollable.
- Added six installer lifecycle regression checks covering upgrades, refused quits, fresh installs, other volumes and console sessions.

## [0.6.0] - 2026-09-20

### Added
- Full and layout-only profiles, two favorite slots, and app-local Command–Option–1/2 shortcuts.
- Compact numbered screen diagram with combined mirrored labels, main display and rotation indicators; relative placement with edge or center alignment.
- One floating 20-second Keep/Revert confirmation for manual display changes, verified readback, timed rollback and rollback on normal Quit.
- Copy Diagnostics, explanations for unavailable controls, and explicit recovery from damaged profile files with a last-good backup.

### Fixed
- Save known settings only after verified success and confirmation; failed changes cannot become remembered preferences.
- Preserve exact mirror leaders and partial mirror groups when restoring profiles.
- Require unique EDID/DDC identity matches and readable DDC limits before sending writes.
- Restore layout without changing unrelated picture levels; use fresh level reads after full display reconfiguration.
- Keep the selected profile name unchanged until its restore is confirmed.

### Changed
- Polished spacing, layout labels and progress messages; removed duplicate confirmation actions.
- Packaging preserves installers from previous releases.
- Updated guides, screenshots and release assets. Hardware testing covered the connected Samsung and built-in display; availability on other connections remains hardware dependent.

## [0.5.2] - 2026-09-18

### Fixed
- Reset Display Preferences preserves ColorSync profile files while clearing WindowServer display settings.
- Added a regression check that intercepts deletion and restart commands without resetting a real display session.

### Documentation
- Reduced screenshot file sizes without changing pixels, added compact clickable README previews, and refined the public guide’s typography, tables and page layout.
- Added installable custom-fix examples: a harmless setup demo and an optional Dock restart, with local installation and usage instructions.
- Replaced menu and restore-preview images with live 0.5.1 captures with a Samsung external display connected; added an indexed gallery of display controls, profiles, import mapping and confirmations.
- Updated screenshot captions, user guide, FAQ, troubleshooting, rollout and capture instructions for the observed mirrored setup and 30 Hz status.
- Corrected identity portability, duplicate-display limitations, EDID and refresh-rate fallbacks, profile loading and data-file guidance.
- Updated the public how-to guide with screenshots beside the relevant steps, including Custom Fixes installation, confirmation and the successful demo result.
- Brought the README into line with the public guide, including all 24 UI screenshots, installation instructions and both example scripts.

## [0.5.1] - 2026-09-18

### Changed
- Simplified display copying, level readback updates, audio refresh and refresh-rate formatting without changing user-facing behavior.
- Reused the app's history store and removed unused icon-script variables.

## [0.5.0] - 2026-09-18

### Added
- Manual profile restore preview with current → saved values and missing-display, unavailable-mode and audio warnings.
  The native dialog fits short messages and scrolls longer lists without becoming oversized.
- Opt-in automatic profile loading at launch or when the exact display set connects, with debounce and conflict rejection.
- JSON export/import for one or all profiles, explicit display/audio mapping between Macs, validated values and conflict-safe names.
- MDM deployment instructions for per-user profile files. Imports preserve existing profiles and disable automatic loading until opted in.

### Documentation
- Refreshed README menu and compact restore-preview screenshots, profile workflow guides and MDM deployment notes.
- Minimum requirement remains macOS 14 Sonoma; universal builds support Apple Silicon and Intel.

## [0.4.0] - 2026-09-18

### Added
- Profiles capture display positions, main display and the active system audio output, alongside per-display audio preferences.
- Profile restore progress and hardware readback report partial restores, missing displays and unreadable settings.

### Fixed
- Profiles restore arrangements before exact saved modes, including refresh rates omitted from the size picker and
  the built-in panel when it leads a mirror set. Restoring saved modes no longer runs mirror recommendations.
- Saving waits for pending hardware writes and reads actual settings; rotation completes before mode and layout restoration.
- Current-profile status compares all saved fields against actual readings and refreshes while the menu is open.
- Old profile files remain compatible; ambiguous display identities are skipped rather than restored to the wrong panel.
- DDC percentage conversion rounds consistently to avoid losing a brightness step on save/restore.
- Reconnect restoration uses the refreshed arrangement and clears enforcement state for disconnected displays.

## [0.3.4] - 2026-09-18

### Fixed
- A pixel-exact (non-HiDPI) saved mode is no longer enforced on the Retina built-in panel at launch or connect; it
  is the tiny-UI state Detect Displays exists to rescue. HiDPI presets still apply.

## [0.3.3] - 2026-09-18

### Fixed
- A mirror set found split at launch or reconnect (laptop on 2560×1600 under a 1920×1080 TV, typically after Laptop
  Leads Mirror was switched off while the app was not running) is repaired by re-mirroring, since a follower cannot be
  set directly (CGError 1001). The same fallback now covers the follow-along after a TV mode change.

## [0.3.2] - 2026-09-18

### Added
- **Overwrite with Current Settings** submenu in the Profile menu, listing every profile. The Update shortcut still
  appears for the profile last applied or saved this session.

## [0.3.1] - 2026-09-18

### Fixed
- Save Current Setup As… showed no name field: the field sat in the header row where it had no width. It now
  appears on its own row with focus, Save and Cancel.
- After an uninstall that kept data, a reinstall did not turn Start at Login back on. The uninstaller now clears the
  first-launch flag.

## [0.3.0] - 2026-09-18

### Added
- **Audio** picker per display: which output device becomes the system default whenever the display connects. Lists
  every output the Mac has (the display's own HDMI audio, a 3.5 mm run, a USB dock, an AirPlay receiver, a
  presentation gateway's driver). Remembered and included in profiles. Public CoreAudio only.

## [0.2.1] - 2026-09-18

### Fixed
- The installer could "relocate" the app onto another copy found by Spotlight instead of installing to
  /Applications, leaving the receipt written and the app missing. The bundle is now marked non-relocatable in the
  package's component plist. 0.2.0's pkg is superseded.

## [0.2.0] - 2026-09-18

Validated on a MacBook Pro (16:10 Retina panel) mirrored to a Samsung 4K TV over HDMI. Every default below that
mentions a display came from that session.

### Versioning
- `VERSION` file is the single source of the marketing version; `CFBundleVersion` is the git commit count, so two
  builds of the same version are distinguishable. About and the footer show "0.2.0 (build)".

### Displays
- Menu bar app that identifies displays from their EDID and remembers each one by vendor, model and serial.
- One-time Mirror / Extend prompt per display; the choice is re-applied at every reconnect.
- Preferred mode, brightness, contrast, volume, rotation and underscan remembered per display and re-applied at
  launch and at connect; once per connection if macOS drifts the mode.
- The external display leads the mirror set by default so both share one logical size; **Laptop Leads Mirror**
  toggle per display for a full-screen laptop instead.
- A mirror set is kept on one size in both directions: change either side and the other follows, or the laptop
  snaps to the external's size when the external cannot render the laptop's.
- Detect Displays: rescan, fix a wrong mirror lead, rescue a pixel-exact laptop mode, apply recommendations.
- Match Laptop and Best for Display recommendations, restricted to EDID-guaranteed sizes, preferring the HiDPI
  mode at native pixels over pixel-exact 4K.
- Resolution picker lists only EDID-guaranteed sizes plus the current one; refresh rate picker per size.
- Rotation, underscan, Make Main and Place for extended displays.
- Dock restarted after display changes that end mirrored, debounced across a burst of changes.

### Profiles
- Named whole-setup profiles: save, apply, update, remove. The menu shows the profile currently in effect.

### Fixes
- Reset Display Preferences (admin): clears WindowServer's display database and restarts it.
- Custom fix scripts from the user's scripts folder, with ownership and permission checks, rescanned on menu open.
- Uninstall from the app: login item, bundle, receipt, optional data purge. Same script usable from MDM.

### Interface
- Grouped card per display with an aligned label column, plain status line, state dot and display-type symbol.
- Menu bar icon reflects mirrored / extended / alone.
- Title-style labels, SF Symbol lock for admin actions, accessibility labels on every icon-only control.
- About panel and footer with Ayala Solutions branding; version from the bundle.

### Packaging
- `scripts/package.sh` builds a universal, signed `.app` and `.pkg`; login item registered on first bundled launch.

### Fixed during validation (since 0.1.0)
- Best for Display chose pixel-exact 3840×2160 on a 4K TV and saved it as the preset.
- 1680×1050, advertised by the TV but unrenderable, could be picked and produced snow.
- A late EDID name left a "Display N" placeholder saved as the display's name.
- The Laptop Leads Mirror checkbox did not redraw after a profile changed it.
- Ghost known-display entries created when the EDID arrived after the display.
- Mirror requests on an already-mirrored set failed with CGError 1007.
- DDC writes retried forever on ports that refuse them (Apple Silicon HDMI).

## [0.1.0] - 2026-09-17

Milestone build: menu bar monitor with EDID identity and history, one-click Mirror/Extend remembered per display,
resolution picker, built-in and DDC brightness, bundled and custom fix scripts, app bundle and pkg installer with
login item, rotation, underscan, Make Main and Place, DDC contrast and volume, preset enforcement, native size and
recommendations from EDID, Detect Displays, Dock restart after mirror changes.
