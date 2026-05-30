# Baseline Archive

> Governing policy: See [CONSTITUTION.md](../tools/CONSTITUTION.md) Article IX.4
> This directory stores versioned backups of governance files before each amendment.

## Purpose
Every time `CONSTITUTION.md` is amended, the **pre-amendment version** is archived here before the new version takes effect. This provides:
- Full traceability of rule evolution
- Ability to roll back if needed
- Reference for version-specific behavior

## Index
| File | Version Saved | Date |
|------|---------------|------|
| [CONSTITUTION-v2.10.md](CONSTITUTION-v2.10.md) | v2.10 | 2026-05-27 |

## Naming Convention
`{DOCUMENT}-v{major}.{minor}.md`

- Documents: `CONSTITUTION`, `TAGS` (if tagged), `INDEX` (if versioned)
- Version matches the document's own version number at time of archiving

## Restoration
To restore a previous version, copy the baseline file back to `tools/CONSTITUTION.md` and update the changelog accordingly.
