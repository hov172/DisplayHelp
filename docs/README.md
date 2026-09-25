# DisplayHelp documentation

| Document | Audience | What it covers |
|---|---|---|
| [../README.md](../README.md) | Everyone | Why the app exists, install, everyday use |
| [user-guide.md](user-guide.md) | Users, helpdesk | Every control, what it does, when it appears |
| [troubleshooting.md](troubleshooting.md) | Helpdesk | Symptom → action → cause, collecting diagnostics |
| [rollout.md](rollout.md) | IT admins | Build, sign, notarize, pilot, fleet push, removal |
| [data-files.md](data-files.md) | Helpdesk, developers | JSON formats, identity keys, history event kinds |
| [faq.md](faq.md) | Everyone | Short answers |
| [../CHANGELOG.md](../CHANGELOG.md) | Everyone | Release history |

[0.6.7 release notes](release-0.6.7.md) · [0.6.6 release notes](release-0.6.6.md) · [0.6.0 hardware validation](release-0.6.0.md).


## Screenshots

**The current English screenshot gallery below shows DisplayHelp 0.6.6 (120)**, captured on 2026-09-23. Historical release and design-review documents retain their original evidence.
The Finder example-folder image is retained from 0.6.5; its folder name is illustrative. The video thumbnail depicts an earlier interface.
The localized examples use the same production views and 0.6.6 (120) metadata.
Menus and dialogs are rendered from the current production controls using isolated sample displays, profiles,
audio devices and history. They are native UI captures, not drawn mockups or live desktop thumbnails. Picker screenshots isolate the open native menu so choices remain readable.

Capture-only copies may expose private view types or set an initial expanded/editing state so a control can be
photographed. The displayed controls and text retain the production implementation. The file-browser capture shows an
isolated examples folder for this release. No real display settings, audio volume/routing, saved profiles or user history were changed for screenshots. Reset, uninstall,
profile restore and import dialogs were canceled; only the harmless Custom Fixes demo was executed.

Sample modes, refresh rates, identities and DDC sliders demonstrate the interface; availability depends on the
actual monitor, adapter and connection. The independent real-hardware validation is recorded in the release notes.

Screenshots preserve their native aspect ratios. Inline previews are capped at 440 pixels wide and 660 pixels tall; small menus are never enlarged. Click a preview to view the original capture. The [video thumbnail](images/video-guide.jpg) is hosted here for reliable loading and depicts the earlier interface shown in the video.

| Image | Localized capture |
|---|---|
| [Language menu](images/language-menu.png) | Globe menu with Follow System and all eleven native language names. |
| [Arabic](images/language-ar.png) | Right-to-left production menu with physical display geometry preserved. |
| [Language restart confirmation](images/language-confirmation.png) | Native restart confirmation for an app language change. |
| [Traditional Chinese](images/language-zh-Hant.png) | Localized production menu using sample data. |

| Image | Current capture |
|---|---|
| [Output Volume](images/output-volume.png) | Sample built-in speaker volume and mute controls using the production audio view. |
| [Unavailable output volume](images/output-volume-unavailable.png) | Explanation for a sample fixed-volume HDMI output. |
| [Identify Displays](images/identify-displays.png) | Actual temporary identification panel using sample names; no screen settings changed. |
| [Taller menu](images/menu-viewport.png) | Compact native menu viewport, up to 900 points high; remaining content scrolls. |
| [Layout and favorites](images/layout-profiles.png) | Full scroll content with Quick Switch Profiles expanded, two favorite templates, Previous/Default recovery and sample extended displays. |
| [Menu overview](images/menu.png) | Current display cards and controls using sample hardware. |
| [Extended displays](images/extend.png) | Separate desktops and position controls. |
| [Resolution](images/resolution.png) | Open size picker with sample offered modes. |
| [Refresh rate](images/refresh-rate.png) | Open rate picker for the sample current mode. |
| [Audio](images/audio.png) | Sample output choices for a connected display. |
| [Rotation](images/rotation.png) | Supported angle picker; no rotation applied. |
| [Position](images/position.png) | Relative placement and alignment choices in Extend mode. |
| [Position alignment](images/position-alignment.png) | Edge or center alignment submenu for a relative placement. |
| [Rename](images/rename.png) | Editable external-display nickname. |
| [Display details](images/display-details.png) | Sample identity, modes and capabilities. |
| [Profile menu](images/profiles.png) | Current profile actions and import/export; favorites are assigned in Quick Switch Profiles. |
| [Save profile](images/save-profile.png) | Name entry and Full setup/Layout only scope selection. |
| [Automatic profiles](images/automatic-profile.png) | Optional automatic loading controls. |
| [Restore preview](images/restore-preview.png) | Current-to-saved comparison with sample settings; canceled before applying. |
| [Import mapping](images/import-mapping.png) | Sample saved identities awaiting a mapping choice. |
| [Import display choices](images/import-display-choices.png) | Sample destination displays selected in the mapping controls; no user profiles imported. |
| [First connection](images/first-connect.png) | Mirror, Extend and Not now prompt for a sample external screen. |
| [Keep changes](images/keep-changes.png) | One native countdown window with Keep/Revert actions. |
| [Mirrored layout](images/mirrored-layout.png) | A mirror group represented together with combined screen numbers. |
| [Data actions](images/data-actions.png) | Troubleshooting, More and Recent Events expanded, with separate full-reset and history-only actions. |
| [Fixes](images/fixes.png) | Current reset, custom-fix and More controls. |
| [Reset warning](images/reset-confirmation.png) | Current ColorSync-preserving reset warning; canceled. |
| [Uninstall warning](images/uninstall-confirmation.png) | Current uninstall confirmation; canceled without removing anything. |
| [Recent Events](images/recent-events.png) | Sample activity log and Clear Connection History action. |
| [About](images/about.png) | Current version 0.6.5 and build 119 with credits. |
| [Custom scripts folder](images/custom-fixes-folder.png) | Example script files in an isolated capture folder. |
| [Custom Fixes](images/custom-fixes-menu.png) | Demo and optional Dock restart actions in the current interface. |
| [Demo confirmation](images/custom-fixes-confirmation.png) | Actual confirmation for the harmless example demo. |
| [Demo result](images/custom-fixes-success.png) | Harmless demo executed against isolated fixture data, with exit 0. |

