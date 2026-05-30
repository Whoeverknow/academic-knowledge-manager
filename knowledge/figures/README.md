# Figures Registry

> Governing policy: See Article V of [CONSTITUTION.md](../../tools/CONSTITUTION.md)
> All figure entries are knowledge entities stored in `knowledge/figures/`.

## Figure Classification

| Class | Origin | Storage Decision | Citation Format |
|-------|--------|-----------------|-----------------|
| **A — Stable** | Published papers (DOI/ISBN/arXiv), institutional archives | Record source + figure location only; no image stored | `[Figure] Author (Year). Title. Journal. DOI → Figure N` |
| **B — Ephemeral** | Web images, screenshots, whiteboard photos, rare books, social media | Create figure entry with `FIG-{XXXXXXXXXX}` in monthly batch | `[Figure: FIG-XXXXXXXXXX]` in knowledge entries |

## Directory Layout

```
figures/
├── README.md
├── 2026-05/
│   ├── FIG-0000000001.md
│   └── FIG-0000000002.md
└── 2026-06/
```

## Figure Entry Template

```markdown
### FIG-{XXXXXXXXXX} | {Short descriptive title}

**Date**: {YYYY-MM-DD}
**Tags**: `#figure` `#ephemeral` `#{topic-tag}`

**Acquired**: {source URL, screenshot description, photo context, etc.}

**Description**:
{What this figure depicts — specific and detailed}

**Relevance**:
{Why it was saved; which knowledge entries it connects to}

**Related**: [[{KNID}]] · [[{KNID}]]

---
```
