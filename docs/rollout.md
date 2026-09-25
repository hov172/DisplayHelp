# DisplayHelp rollout checklist

For IT admins deploying to a fleet. Users do not need this: the README covers install for one Mac.

Release notes for 0.6.7 (122) are in [release-0.6.7.md](release-0.6.7.md); release validation for 0.6.6 (120) is recorded in [release-0.6.6.md](release-0.6.6.md). Prior live built-in speaker volume/mute validation remains in [release-0.6.3.md](release-0.6.3.md). This does not complete the checklist below: room hardware checks, MDM deployment,
ticket baselines and the two-week/semester observations must be recorded by the deploying team.

## 0. Requirements
- macOS 14 Sonoma or later. Apple Silicon or Intel; the package is universal.
- An MDM that can push a `.pkg` (Jamf, Kandji, Mosyle, Intune, Addigy all work). Ad-hoc signed builds are fine on managed Macs.
- For unmanaged or BYOD Macs: a Developer ID and notarization, see step 4.

## 1. Baseline (before any install)
- [ ] Export ticket counts tagged projector/display for the last two semesters. Record totals per month in this file.
- [ ] Note the median time-to-close for those tickets.
- [ ] Confirm the fleet is on macOS 14 or later and which MDM will push the pkg.

## 2. Build
```bash
./scripts/package.sh                                    # ad-hoc signed, fine for MDM-managed Macs
SIGN_IDENTITY="Developer ID Application: School (TEAMID)" \
INSTALLER_IDENTITY="Developer ID Installer: School (TEAMID)" ./scripts/package.sh
```
Outputs `build/DisplayHelp.app` and `build/DisplayHelp-<version>.pkg`.

## 3. Pilot (3–5 rooms, two weeks)
- [ ] Install the pkg on pilot Macs with the MDM. The postinstall opens the app; "Start at Login" is on by default.
- [ ] In each room: plug into the projector, answer Mirror in the prompt, unplug, replug, confirm it mirrors on its own.
- [ ] Rename the projector in the menu to the room name, then **Profile › Save Current Setup As…** with the same name.
- [ ] When upgrading from a version before 0.4.0, re-save pilot profiles to capture positions, main display and system audio. Change the setup, recall the profile, and confirm verification succeeds.
- [ ] In 0.5.0 or later, review a profile preview and cancel it; confirm the display settings stay unchanged.
- [ ] Opt one profile into automatic loading, reconnect its exact display set, and confirm it restores once.
- [ ] Export and import a profile; check device mapping, preservation of existing profiles and automatic loading disabled on the import.
- [ ] Test a missing display or unavailable audio output and confirm the restore reports a partial result.
- [ ] On a 4K TV press **Best for Display** and check the selected mode. Expect 1920×1080 HiDPI when a suitable native HiDPI mode is offered; record the actual refresh rate and connection. Use the [current screenshot guide](README.md#screenshots) to locate controls; its sample values are not a hardware target.
- [ ] In Extend mode verify **Place… → Make [display name] Main** and relative placement; return to the intended room arrangement before saving its profile.
- [ ] Try the brightness slider on the projector. No slider means no usable DDC reading was available; monitor settings, adapter and connection support can affect it. Nothing else changes.
- [ ] Helpdesk-only: create `~/Library/Application Support/DisplayHelp/scripts/` and drop a test `.sh` (owned by the user, mode 0755) to confirm "Custom fixes" appears.
- [ ] After two weeks collect `~/Library/Application Support/DisplayHelp/history.jsonl` from each pilot Mac and count `connected` vs `applyFailed`.
- [ ] On one pilot Mac run **Troubleshooting → More → Uninstall DisplayHelp…** and confirm the app, login item and receipt are gone, then reinstall.

- [ ] Save one full profile and one layout-only profile, assign favorites 1 and 2, and confirm the latter leaves picture levels and audio unchanged.
- [ ] Change a resolution, allow the 20-second countdown to expire, and check the previous setup returns; repeat and choose Keep Changes.
- [ ] Test relative placement with edge and center alignment, and verify the numbered layout against the physical screens.
- [ ] Copy Diagnostics and review identifiers before sharing with helpdesk.

- [ ] On a test account, clear connection history and confirm saved profiles and monitor preferences remain.
- [ ] Forget a test monitor and reconnect with automatic profiles disabled; confirm it asks again and the saved profile library remains available.
- [ ] Confirm Turn Off All Automatic Profiles preserves favorites and manual profile loading.
- [ ] On a test account with backed-up data, run Reset All DisplayHelp Data and verify the backup exists, custom fixes/login setting remain, and current hardware settings do not change.
- [ ] Upgrade while DisplayHelp is running; verify the new version appears after the installer closes and relaunches the app.

## 4. Fleet
- [ ] Use the signed and notarized pkg from the GitHub release (0.2.1 onwards). Unmanaged and BYOD Macs open it without Gatekeeper prompts. The exact commands are in CONTRIBUTING.md › Releasing.
- [ ] Push the pkg fleet-wide. Optional: push approved custom scripts to each user's scripts folder via MDM (must be owned by that user).
- [ ] Compare ticket counts to the baseline after one semester. Target: -50%.

## Where things live on a Mac
| Item | Path |
|---|---|
| App | `/Applications/DisplayHelp.app` |
| Connection history | `~/Library/Application Support/DisplayHelp/history.jsonl` |
| Known displays and presets | `~/Library/Application Support/DisplayHelp/known-displays.json` |
| Profiles | `~/Library/Application Support/DisplayHelp/profiles.json` |
| Custom fix scripts | `~/Library/Application Support/DisplayHelp/scripts/*.sh` |
| Logs | `log show --predicate 'subsystem == "DisplayHelp"' --last 1h` |

## Removing it
From the app: **Troubleshooting → More → Uninstall DisplayHelp…**. From MDM, as root:

    /bin/zsh /Applications/DisplayHelp.app/Contents/Resources/DisplayHelp_DisplayHelp.bundle/Contents/Resources/uninstall.sh \
        /Applications/DisplayHelp.app purge /Users/<name>

`keep` instead of `purge` leaves the user's profiles and history in place. The script refuses any path that is not `DisplayHelp.app`.

## Deploying profiles with MDM

The exported JSON array is also the on-disk format. Seed it at
`~/Library/Application Support/DisplayHelp/profiles.json` for each target user while DisplayHelp is closed, then
launch the app as that user. Use the actual home directory from your MDM inventory, not a literal `~` in a root
script. The file must be readable and writable by that user; use mode `0600` and a user-owned directory.

1. Configure a pilot Mac, save its setups, and export them using **Profile › Export… › All Profiles…**.
2. On a destination Mac, use **Import Profiles…** to map display and audio identities, then export the adapted file.
   Identity keys include vendor, model and serial; built-in panels and audio devices often differ between Macs.
   Do not copy one laptop's identities fleet-wide and expect them to match another laptop.
3. For each destination user, back up an existing `profiles.json`. Deployment replaces that file; use the app's
   Import command instead when existing user profiles should be merged and retained.
4. Stage the JSON beside the destination and rename it atomically after setting ownership and permissions. Restart
   DisplayHelp to read it. A malformed file is rejected and logged; keep the backup for rollback.
5. To enable a managed automatic choice, set `"autoApply": true` on exactly one profile for each display set.
   Omitted/false means manual only. The interactive Import command always resets this flag to false, so enable it
   on the destination before exporting an automatic deployment template.
6. Test with all expected displays connected, then with one absent. Only an exact, unambiguous match should load
   automatically. Review the restore result; unavailable modes and missing audio devices remain hardware limits.

Exports contain display and audio identifiers. Distribute them through the same controlled MDM channels as other
per-user settings. Files are limited to 2 MB, 200 profiles and 16 displays per profile. Deployment is a seeded
configuration, not an enforced managed preference: users can subsequently edit their profiles.

- [ ] Confirm Identify Displays numbering matches each room’s extended and mirrored layouts, including three or more screens where available.

- [ ] Verify Output Volume follows built-in speakers, USB audio and HDMI switches; unsupported outputs should show an explanation. Check external changes made with volume keys and Control Center. Confirm profile restoration does not alter live system volume/mute.

## Language pilot checks

- [ ] Verify Follow System and an explicit globe selection on a separate test account; restart and confirm the chosen language.
- [ ] Test longer translations, Arabic direction, keyboard navigation and VoiceOver in representative rooms.
- [ ] Have native speakers review the warnings and terminology before broad multilingual deployment. Automated coverage and online terminology checks do not establish native fluency.
