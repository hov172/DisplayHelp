# Data files

Everything DisplayHelp remembers lives in `~/Library/Application Support/DisplayHelp/`, as plain JSON you can read,
back up, or edit with the app quit. Dates are ISO 8601 in UTC. Profile exports are written to a location you
choose, and diagnostics also go to the macOS unified log. The app does not transmit these files.

| File | Purpose | Written when |
|---|---|---|
| `known-displays.json` | One entry per display ever seen: its live presets | Any setting changes, a display is renamed, a profile is applied |
| `profiles.json` | Named whole-setup snapshots | A profile is saved, updated, removed or imported, or automatic loading/favorite assignments are changed |
| `profiles.json.backup` | Previous valid profile-library version; first save seeds a backup | Before a profile-library save |
| `profiles.json.unreadable-<UUID>` | Original library preserved during explicit recovery or reset | Recover from backup or archive/start fresh |
| `history.jsonl` | Append-only event log | Every connect, disconnect, change, failure, script run |
| `history-<date>.jsonl` | Archived log | **Recent Events › Clear Connection History** |
| `scripts/*.sh` | Custom fixes | By the helpdesk, never by the app |

## Identity keys

Displays are recognised by an identity key built from the EDID: `VENDOR-model-serial`, for example
`SAM-d42-16777216`. Vendor is the three-letter PNP code, model is hexadecimal, serial is decimal. The built-in panel
has no EDID and uses CoreGraphics values, for example `APP-a049-4251086178`. Older versions wrote `cg-model-serial`
before the EDID arrived; those keys are still read and migrated on the next save.

Because the key comes from the display, it can remain stable across ports and adapters that preserve its identity.
Names and presets live in the local user’s store; they do not sync across Macs. Export/import moves profiles,
with device mapping where identities differ, but does not transfer the known-display nickname store.

Two displays with identical vendor, model and serial values share an identity. Renaming them does not distinguish
them. Saving a profile with duplicate connected identities is refused, and restoration skips ambiguous matches.
Do not rely on separate room names to distinguish hardware that reports the same key.

## known-displays.json

An array of entries. Every field except `key`, `name`, `arrangement` and `lastSeen` is optional and means "no
preference" when absent.

```json
[
  {
    "key": "SAM-d42-16777216",
    "name": "Room 204",
    "arrangement": "mirror",
    "lastSeen": "2026-09-18T03:52:21Z",
    "preferredMode": { "width": 1920, "height": 1080, "refresh": 60, "isHiDPI": true },
    "brightness": 70,
    "contrast": 50,
    "volume": 30,
    "rotation": 0,
    "underscan": 0,
    "laptopLeads": false
  },
  {
    "key": "APP-a049-4251086178",
    "name": "Built-in Display",
    "arrangement": "ask",
    "lastSeen": "2026-09-18T03:52:21Z",
    "preferredMode": { "width": 1920, "height": 1080, "refresh": 60, "isHiDPI": true }
  }
]
```

| Field | Values | Notes |
|---|---|---|
| `arrangement` | `mirror`, `extend`, `ask` | `ask` shows the connect dialog next time. The built-in panel is always `ask`. |
| `preferredMode.isHiDPI` | boolean | True when the display renders at double the logical size. |
| `laptopLeads` | boolean | Absent or false: the external leads the mirror set. |
| `audioOutput` | `{ "uid": …, "name": … }` | Output device made the system default at connect. `uid` is the CoreAudio device UID; `name` is shown when the device is absent. |
| `brightness`, `contrast`, `volume` | 0 to 100 | Contrast and volume only on displays that answer DDC/CI. |
| `rotation` | 0, 90, 180, 270 | |
| `underscan` | display-specific range | |

## profiles.json

An array of named setups. Each maps identity keys to that display's settings. A display absent from a profile is
not assigned saved settings, although macOS may reposition it when the main display changes.

```json
[
  {
    "name": "Room 204",
    "displays": {
      "SAM-d42-16777216": {
        "arrangement": "mirror",
        "mode": {
          "width": 1920,
          "height": 1080,
          "refresh": 60,
          "isHiDPI": true
        },
        "brightness": 70,
        "rotation": 0,
        "laptopLeads": false,
        "mirrorPrimaryIdentity": "SAM-d42-16777216",
        "audioOutput": {
          "uid": "BuiltInHeadphoneOutputDevice",
          "name": "External Headphones"
        },
        "displayName": "Room 204",
        "isBuiltin": false,
        "origin": [
          0,
          0
        ],
        "isMain": true
      },
      "APP-a049-4251086178": {
        "arrangement": "ask",
        "mode": {
          "width": 1920,
          "height": 1080,
          "refresh": 60,
          "isHiDPI": true
        },
        "brightness": 89,
        "displayName": "Built-in Display",
        "isBuiltin": true,
        "origin": [
          0,
          0
        ],
        "isMain": false,
        "mirrorPrimaryIdentity": "SAM-d42-16777216"
      }
    },
    "scope": "full",
    "favoriteSlot": 1,
    "autoApply": false,
    "audioOutput": {
      "uid": "BuiltInHeadphoneOutputDevice",
      "name": "External Headphones"
    }
  }
]
```

New snapshots include optional `displayName` and `isBuiltin` metadata for import mapping. Profile-level
`autoApply` opts into automatic loading for an exact display set; omitted/false remains manual. Export and import
use this same JSON array. Import disables automatic loading, clears favorite assignments, validates values, and renames name conflicts.
Display identity mapping also updates each saved mirror-primary identity.

| Profile metadata | Meaning |
|---|---|
| `scope` | `full` or `layout`. Omitted in older files means `full`. |
| `favoriteSlot` | Optional `1` or `2`, unique across the library. Imports clear this field. |
| Per-display `mirrorPrimaryIdentity` | Identity key of the exact mirror primary, including on the primary itself. Absent for extended displays; older profiles fall back to `laptopLeads`. |

Layout-only snapshots omit brightness, contrast, volume, underscan and audio fields. These fields are also ignored
when applying or matching a layout profile, even if a hand-edited file contains them. Resolution, refresh rate,
rotation, origins, main-display state and mirror topology remain included.

New snapshots also store each display's `origin` (CoreGraphics x/y coordinates, encoded as a two-element array)
and `isMain`, plus a top-level `audioOutput` for the active system output. Per-display `audioOutput` remains the
reconnect preference. Missing optional fields in older profiles are left unspecified; re-save to capture them.

A profile is shown as current only when its display set and every saved setting match hardware readings, including
levels, rotation, underscan, position, main display, mirror leadership and audio output. Unreadable saved values do
not match. Follower modes are verified but not set directly, because macOS derives them from the mirror primary.
Save refuses duplicate display identities rather than merging settings for indistinguishable panels.

## Profile-file recovery

Loading errors are surfaced in the app. A save refuses to overwrite an unreadable `profiles.json`, and the original
remains intact. Every successful save retains the previous valid library in `profiles.json.backup`; the first save
seeds it with that first library. The backup may therefore be one edit behind the current file.

**Recover Profiles from Backup** validates the backup, archives the original as `profiles.json.unreadable-<UUID>`,
and restores the backup. If no valid backup is available, **Archive Unreadable File and Start Fresh…** confirms
before archiving the original and writing an empty library. This reset preserves any existing backup. Neither
operation replaces the original if its archival fails. Archived files are retained for manual inspection.

Known-display writes likewise reject unreadable originals. Verified reconnect settings for a complete operation
are committed in one atomic batch, so a storage failure cannot leave only part of that batch saved. There is no
in-app backup recovery for `known-displays.json`; quit, preserve a copy, then repair or move that file if necessary.

Profile imports are limited to 2 MB and 200 uniquely named profiles, with at most 16 displays per profile.
Invalid values, duplicate favorite slots and conflicting display mappings are rejected before saving.

## history.jsonl

One JSON object per line, appended. `mode` is the display's mode **before** the event; `detail` is the target, the
error text, or the script result.

```jsonl
{"timestamp":"2026-09-18T03:52:21Z","kind":"connected","displayID":2,"vendor":"SAM","model":3394,"serial":16777216,"name":"SAMSUNG","mode":"1920x1080@60"}
{"timestamp":"2026-09-18T03:52:21Z","kind":"mirrored","displayID":2,"vendor":"SAM","model":3394,"serial":16777216,"name":"SAMSUNG","mode":"1920x1080@60"}
{"timestamp":"2026-09-18T03:55:02Z","kind":"modeChanged","displayID":2,"vendor":"SAM","model":3394,"serial":16777216,"name":"SAMSUNG","mode":"1920x1080@60","detail":"1920x1080 HiDPI@60"}
{"timestamp":"2026-09-18T03:58:40Z","kind":"applyFailed","displayID":1,"vendor":"APP","model":41033,"serial":4251086178,"name":"Built-in Display","mode":"2560x1600@60","detail":"mode 1920x1080@60: display configuration failed (CGError 1001)"}
```

### History event kinds

| Kind | When | `detail` |
|---|---|---|
| `present` | The app launched and found the display already connected | |
| `connected` | The display appeared | |
| `disconnected` | The display went away | |
| `mirrored` | Mirror applied, by the user, a preset or a profile | |
| `extended` | Extend applied | |
| `modeChanged` | Size, scaling or refresh changed by the app | The new mode |
| `brightnessChanged`, `contrastChanged`, `volumeChanged` | A display level set (volume is monitor DDC volume) | New value |
| `rotated` | Rotation verified after applying | Requested angle, before/actual layout and verification |
| `moved` | Make Main or Place applied | Placement target, reference, alignment, before/requested/actual bounds and verification |
| `changeStarted` | A display change with a Keep/Revert trial begins | Change ID, scope and before layout |
| `changeRequested` | Placement or rotation requested | Target and requested geometry or angle |
| `changePending` | Waiting for Keep Changes | Countdown and observed layout |
| `changesKept` | User keeps the setup | Observed layout and preference-save result |
| `changesReverted` | User, timeout, disconnect or quit triggers recovery | Reason, before/actual layout and recovery result |
| `underscanChanged` | Underscan set | New value |
| `audioRouted` | System audio output switched by the app | The audio device now playing |
| `applyFailed` | macOS refused a change | What was asked and the error |
| `scriptRan` | A fix script exited 0 | Script name and last output line |
| `scriptFailed` | A fix script exited non-zero | Script name, exit code, last output line |

Related operation entries share a `change=` identifier in `detail`. Layout snapshots include display IDs and identities, x/y, width/height, rotation, main-display and mirror state. Copy Diagnostics and Recent Events include up to 20 events; the JSONL file retains the longer history. These are app operation traces, not a complete audit of every change made by other software.

A malformed line is skipped with a warning in the unified log; the rest of the file still loads.

## Unified log

Diagnostics that are too noisy for the history go to the macOS unified log, subsystem `DisplayHelp`, with these
categories: `monitor`, `edid`, `ddc`, `audio`, `monitorpanel`, `history`, `scripts`, `fixes`, `known`, `profiles`, `login`, `uninstall`.

```
log show --last 1h --info --predicate 'subsystem == "DisplayHelp"'
log stream --level info --predicate 'subsystem == "DisplayHelp"'
```

## Editing by hand

Quit the app before editing. Known-display lookups read their store from disk, but profiles are loaded at launch
and held in memory; an in-app save can overwrite external edits. Restart after editing to load the new profiles.
Delete `known-displays.json` to make the app treat every display as new. Delete `profiles.json` to remove all profiles. The history can be deleted at any time.

## Forgetting displays and resetting app data

**Forget This Display…** atomically removes matching current and legacy identity records from `known-displays.json`.
It does not alter profile or history files. Unreadable data and ambiguous connected identities are refused.
**Turn Off All Automatic Profiles** saves `autoApply: false` for every profile and cancels pending automatic loading.

**Reset All DisplayHelp Data…** stages a fresh support directory containing only a copy of `scripts/`, archives the
original as sibling `DisplayHelp-backup-<UUID>/`, then installs the fresh directory. Script symlinks are copied as
links without modifying their targets. Staging failure leaves the original in place; if the final rename fails,
restoration is attempted and any preserved backup path is reported. Login settings, current hardware configuration
and separately exported profiles are unchanged. Old data remains in the backup; this is not secure erasure.

## Temporary identification labels

Identify Displays (0.6.2) creates temporary on-screen labels only. It adds no stored preferences or profile fields and writes no display settings. The labels use the same ordering and mirrored groups as Screen Layout.

## Live system output volume

Output Volume and mute (0.6.3) are read from and written to the active CoreAudio output. They add no fields to known-displays.json or profiles.json and do not change stored monitor-volume values. A full profile can still route audio to its saved output; its volume field remains the external display’s DDC volume. Copy Diagnostics reports active system output volume and mute separately from Monitor Volume.
