# DisplayHelp documentation

| Document | Audience | What it covers |
|---|---|---|
| [../README.md](../README.md) | Everyone | Why the app exists, install, everyday use |
| [user-guide.md](user-guide.md) | Users, helpdesk | Every control, what it does, when it appears |
| [troubleshooting.md](troubleshooting.md) | Helpdesk | Symptom → action → cause, collecting diagnostics |
| [rollout.md](rollout.md) | IT admins | Pilot, fleet push, removal |
| [data-files.md](data-files.md) | Helpdesk | JSON formats, identity keys, history event kinds |
| [faq.md](faq.md) | Everyone | Short answers |
| [../CHANGELOG.md](../CHANGELOG.md) | Everyone | Release history |

[0.6.1 release notes](release-0.6.1.md) · [0.6.0 hardware validation](release-0.6.0.md).

## Screenshots

The guide and current screenshots are from **0.6.1 (89)**. New screenshots captured on **2026-09-20** use
sample display/profile data rendered through the production SwiftUI views. They show the updated layout,
favorites and single Keep/Revert window; they are not live desktop thumbnails. No hardware changes were made
for these screenshots. Different resolutions and rotation are illustrative, not a capability guarantee.

| Current image | What it shows |
|---|---|
| [Taller menu](images/menu-viewport.png) | Actual visible menu viewport, capped at 900 points and scrollable. |
| [Layout and favorites](images/layout-profiles.png) | Full scrollable menu content, two favorite templates and extended screens with independent modes and rotation. |
| [Keep changes](images/keep-changes.png) | One native confirmation with countdown and Keep/Revert actions. |
| [Mirrored layout](images/mirrored-layout.png) | Mirrored screens represented together with combined numbers. |

The older captures below document earlier controls and are retained as historical step-by-step references;
they do not show the new profile commands, alignment choices, layout or confirmation UI. The reset warning
shows 0.5.2. Custom Fixes captures show the supplied demo; only the harmless demo was run.

Captured from the built DisplayHelp **0.5.1 (84)** app on **2026-09-18**, with a MacBook’s built-in panel
connected to a Samsung 4K TV. The main capture is mirrored; the Extend and position captures show an extended
desktop. These are actual UI captures at 2x, not mockups. Import dialogs use sample profile data.

| Image | What it shows |
|---|---|
| [Menu](images/menu.png) | Both display cards at 1920×1080 HiDPI; Samsung reports 30 Hz, built-in reports 60 Hz. Arrangement, refresh rate, audio, rotation and built-in brightness are visible. |
| [Profile menu](images/profiles.png) | Existing Demo profile, overwrite, remove, automatic loading, export, save and import. |
| [Restore preview](images/restore-preview.png) | Live Demo preview proposing built-in brightness 41 → 42. Cancel was used; the profile was not applied. |
| [First connection](images/first-connect.png) | Mirror, Extend and Not now choices for the Samsung display. |
| [Resolution](images/resolution.png) | Available logical sizes and scaling choices. |
| [Refresh rate](images/refresh-rate.png) | Rates offered for the current size on this connection. |
| [Audio](images/audio.png) | Per-display audio output selection. |
| [Rotation](images/rotation.png) | Rotation choices; opening the menu does not apply a rotation. |
| [Rename](images/rename.png) | Editing the external display's local nickname. |
| [Display details](images/display-details.png) | Identity, native size, recommendations and supported modes. |
| [Extend](images/extend.png) | Separate desktops with main-display and position controls. |
| [Position](images/position.png) | Relative placement choices in Extend mode. |
| [Save profile](images/save-profile.png) | Naming a new setup before saving. |
| [Automatic profile](images/automatic-profile.png) | Choosing a profile for automatic loading. |
| [Import mapping](images/import-mapping.png) | Sample profile with saved display and audio identities to map. |
| [Import display choices](images/import-display-choices.png) | Mapping a sample projector identity to the connected Samsung. |
| [Fixes](images/fixes.png) | Reset and uninstall commands. |
| [Reset confirmation](images/reset-confirmation.png) | 0.5.2 warning: clears display settings while preserving ColorSync profiles. Cancel was used. |
| [Uninstall confirmation](images/uninstall-confirmation.png) | Confirmation for the local build, with optional removal of saved settings. |
| [Recent events](images/recent-events.png) | Connection and setting history. |
| [About](images/about.png) | App version, build number and credits. |
| [Custom scripts folder](images/custom-fixes-folder.png) | The example scripts placed directly in the current user's scripts folder. |
| [Custom Fixes menu](images/custom-fixes-menu.png) | Demo and Restart Dock actions after reopening the menu. |
| [Demo confirmation](images/custom-fixes-confirmation.png) | Confirmation before running the harmless demo. |
| [Demo success](images/custom-fixes-success.png) | The actual exit 0 result after running the supplied demo. |

The orange Samsung dot reflects a refresh rate below 50 Hz. Unsupported controls are omitted; this capture
has no external DDC sliders or underscan. See the [display-card guide](user-guide.md#display-cards) for the
controls that appear on other hardware or in Extend mode. The screenshots document the observed setup;
they do not establish that 30 Hz is the best rate this TV or cable can support.
