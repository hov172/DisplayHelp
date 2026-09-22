# DisplayHelp 0.6.5 (119)

Released 2026-09-21 for macOS 14 or later, on Apple Silicon and Intel. Existing display profiles remain compatible.

## Languages and how to switch

**New in 0.6.5: ten additional languages, for eleven supported languages including English.**

| Language | Name shown in the globe menu |
|---|---|
| English | English |
| German | Deutsch |
| Spanish | Español |
| French | Français |
| Italian | Italiano |
| Japanese | 日本語 |
| Korean | 한국어 |
| Brazilian Portuguese | Português (Brasil) |
| Simplified Chinese | 简体中文 |
| Traditional Chinese | 繁體中文 |
| Arabic | العربية |

### Follow your Mac's language

DisplayHelp follows macOS language preferences by default. If you previously chose an app language, open DisplayHelp, click the **globe** at the top, choose **Follow System**, then **Restart Now**. macOS selects the best available bundled translation from your preferred languages; English is the final fallback.

For example, a Mac set to Italian uses Italian when DisplayHelp follows the system. An unsupported first language can fall back to another supported language in your preferred list.

### Choose a language inside DisplayHelp

1. Click the DisplayHelp icon in the macOS menu bar.
2. Click the **globe** at the top of the app menu.
3. Select your language by its native name.
4. Choose **Restart Now**, or **Later** to apply the choice the next time the app opens.

This changes only DisplayHelp for the current macOS user. For example, you can use DisplayHelp in Spanish on an English-language shared Mac without changing the Mac's language or other apps. The selection persists until changed; choose **Follow System** to return to the Mac's preferences. The globe is temporarily unavailable while display changes, profile checks or fixes are running.

### macOS settings versus the in-app globe

| Where you choose | What it does |
|---|---|
| **System Settings → General → Language & Region → Preferred Languages** | Sets the Mac's language preferences, which DisplayHelp follows when it has no app-specific override. |
| **System Settings → General → Language & Region → Applications → DisplayHelp** | Sets a language specifically for DisplayHelp. Relaunch the app to apply it. |
| **DisplayHelp → globe → a language** | Sets the same native per-app language preference from inside the app, with a restart prompt. |
| **DisplayHelp → globe → Follow System** | Removes the app-specific override so macOS chooses from your preferred languages again. |

**Both routes use Apple's native localization system and the same bundled translations.** The globe is a convenient selector, not a separate translation engine. An app-specific choice takes precedence over the Mac's preferred languages until removed. No online translation service is used, and macOS does not generate missing translations.

Language is separate from display profiles: loading or importing a profile does not change it. User-entered profile/display names, device names, custom script descriptions/output and historical diagnostics keep their original text. Longer interface labels wrap or stack; Arabic uses right-to-left presentation while the display diagram preserves physical screen positions.

## Other changes

- All 374 app-owned strings have bundled translations in the eleven languages listed above.
- The globe at the top of the menu offers an app-only language choice and **Follow System**. Restart to apply a choice. macOS selects bundled translations using its preferred-language matching; it does not generate translations. Language is a per-user preference, independent of display profiles.
- Longer labels wrap or move controls into vertical layouts. Arabic uses right-to-left presentation while screen geometry and technical values retain their intended direction.
- Native confirmation dialogs and the Keep/Revert window remain above the app and receive keyboard focus.
- The latest four languages were checked against Apple's localized documentation; 36 translated entries were corrected for consistent terminology.
- Fixed an import-mapping crash by attaching display and audio menus before activating their layout constraints.
- Refreshed screenshots, user/helpdesk instructions, Word/PDF guides and downloadable examples accompany this release. The updated gallery includes the globe menu, restart confirmation, Traditional Chinese and Arabic examples. Guides explain macOS versus in-app language selection.

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
