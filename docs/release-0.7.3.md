# DisplayHelp 0.7.3 (153)

DisplayHelp 0.7.3 makes the EDID Cap step easier to find.

### What's new

- With a Signal Cap set and the EDID Cap off, the display card now says "Optional: turn on Enforce at EDID level if the display still reports a higher input." under the toggle, in all 11 languages. The toggle is greyed out while the cap's own Keep/Revert countdown runs, so it could be mistaken for missing.
- The README and user guide explain why the cap and the EDID step are two separate Keep/Revert changes: each trial records one "before" state for Revert, a failed revert must never leave two changes stacked on an unreadable screen, and keeping the plain cap first tells you which half broke the picture.

The release includes the signed universal macOS installer, user guides, screenshots, example fixes, the MDM profile, and checksums.
