# DisplayHelp 0.6.5 (119)

Released 2026-09-21 for macOS 14 or later, on Apple Silicon and Intel. Existing display profiles remain compatible.

## What changed

- All 374 app-owned strings now have native bundled translations in English, German, Spanish, French, Italian, Japanese, Korean, Brazilian Portuguese, Simplified Chinese, Traditional Chinese and Arabic.
- The globe at the top of the menu offers an app-only language choice and **Follow System**. Restart to apply a choice. macOS selects bundled translations using its preferred-language matching; it does not generate translations. Language is a per-user preference, independent of display profiles.
- Longer labels wrap or move controls into vertical layouts. Arabic uses right-to-left presentation while screen geometry and technical values retain their intended direction.
- Native confirmation dialogs and the Keep/Revert window remain above the app and receive keyboard focus.
- The latest four languages were checked against Apple's localized documentation; 36 translated entries were corrected for consistent terminology.
- Fixed an import-mapping crash by attaching display and audio menus before activating their layout constraints.
- Refreshed screenshots, user/helpdesk instructions, Word/PDF guides and downloadable examples accompany this release.

## Validation and limits

- The universal installer is Developer ID signed, notarized by Apple, stapled and accepted by Gatekeeper.
- 150 Swift tests and all 6 installer lifecycle checks pass.
- Catalog validation checks all eleven languages, interpolation placeholders and required plural categories; 22 compiled native localization resources match the catalog.
- Native bundle probes cover all eleven languages, regional matching, per-app overrides and English fallback.
- Fixture previews cover light/dark appearance, small screens, four displays, mirroring, long names, empty states, countdown button sizing and foreground confirmation order/focus.
- The locally installed 0.6.5 (118) translation build was verified before release packaging. Build 119 is the signed release build.

The translations have not had independent native-speaker review. Online Apple terminology checks and automated tests do not certify every sentence. User-entered names, device names, custom script output and historical diagnostics retain their original content. Traditional Chinese uses Taiwan terminology; Hong Kong regional wording may differ.

Screenshots use production controls with isolated sample data. They do not establish hardware compatibility. Room-specific hardware, VoiceOver and native-speaker walkthroughs remain deployment checks. Previous hardware and audio results remain in the historical release notes.

## Downloads

- `DisplayHelp-0.6.5.pkg` — universal installer.
- `DisplayHelp-0.6.5-User-Guide.docx` and `.pdf` — English user/helpdesk guides.
- `DisplayHelp-0.6.5-Custom-Fixes.zip` — example scripts and setup instructions.
- `DisplayHelp-0.6.5-Screenshots.zip` — documentation screenshots, including localized examples.
- `SHA256SUMS.txt` — checksums of the release assets.
