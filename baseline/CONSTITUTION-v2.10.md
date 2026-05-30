# Constitution of the Academic Knowledge Management System

> **Version**: 2.11 | **Effective**: 2026-05-27
> This document governs the structure, encoding, and maintenance of the personal academic knowledge base.
> All management rules are defined herein. Amendments follow Article IX.

---

## Article I: Purpose and Scope

**I.1** This knowledge management system (hereinafter "the System") exists to capture, structure, preserve, and interconnect knowledge acquired through conversation, reading, experimentation, and research.

**I.2** The System is designed for a single user ("the Scholar"). All entries are curated by an AI assistant ("the Steward") under the Scholar's direction.

**I.3** The knowledge base resides at a single root directory on the Scholar's local filesystem. All paths in this document are relative to that root.

---

## Article II: Repository Structure

**II.1** The root directory SHALL contain exactly four subdirectories:

```
/
├── tools/                       # Management infrastructure — NEVER place knowledge entries here
│   ├── CONSTITUTION.md          # This document — governance & encoding rules
│   ├── INDEX.md                 # Multi-dimensional entry index (indexes only knowledge/ content)
│   ├── CACHE.md                 # State cache: last_hex_serial, total_entries, timestamp (avoids redundant INDEX.md reads)
│   ├── TAGS.md                  # Tag taxonomy, definition, and relationship graph
│   ├── GRAPH.md                 # Mermaid knowledge-graph (concept nodes + edges)
│   └── analysis/
│       ├── weekly/              # Weekly deep-analysis reports
│       ├── daily/               # Daily automated review logs ({YYYY}-{MM}-{DD}.md)
│       └── special/             # Ad-hoc special-topic analyses
├── work/                        # Staging area — new entries land here first
│   ├── {YYYY}/                  # Year directories
│   │   └── {MM}.md             # Draft monthly entries (incoming, unprocessed)
│   └── figures/
│       └── {YYYY}-{MM}/        # Draft figure entries
├── knowledge/                   # Published library — reviewed, finalized entries
│   ├── {YYYY}/                  # Year directories
│   │   └── {MM}.md             # Published monthly entries
│   └── figures/                 # Published figure registry
│       ├── README.md            # Figure classification policy summary
│       └── {YYYY}-{MM}/        # Published figure entries
└── baseline/                    # Versioned governance-file archives
    ├── README.md                # What baseline/ is for
    └── CONSTITUTION-v{VER}.md  # Pre-amendment snapshots
```

**II.2** No file or directory outside this structure SHALL be created within the root without an amendment to this constitution. Tools, work, knowledge, and baseline content MUST NEVER share a file.

**II.3** The lifecycle of a knowledge entry is:
```
Scholar signals "save" → work/{YYYY}/{MM}.md (draft)
                    → daily consolidation promotes to knowledge/{YYYY}/{MM}.md (published)
```
INDEX.md, TAGS.md, and GRAPH.md index only **knowledge/** content (published entries). Work entries are not indexed until promoted.

**II.4** When a monthly file exceeds 500 entries or 200 KB, the Steward SHALL split it into fortnightly files (`{MM}-01.md` and `{MM}-02.md`). The INDEX.md SHALL reflect this split.

---

## Article III: Knowledge Identifier System

**III.1** Every knowledge entry MUST be assigned a globally unique, immutable identifier (KNID) upon creation.

**III.2** The KNID format SHALL be:

```
P{p}-{THEME}-{TAG}-{XXXXXXXXXX}
```

Where:

| Component | Length | Domain | Description |
|-----------|--------|--------|-------------|
| `P{p}` | 2 | `P0`–`P3` | Priority tier |
| `{THEME}` | 2–4 | A–Z uppercase | Theme abbreviation |
| `{TAG}` | 2–6 | A–Z uppercase | Core-tag abbreviation |
| `{XXXXXXXXXX}` | 10 | `0–9a–f` hex | Monotonically increasing hex serial |

**III.3** PRIORITY TIERS:

| Tier | Label | Definition |
|------|-------|------------|
| P0 | **Core** | Foundational concept; pillar of the knowledge edifice |
| P1 | **Important** | Frequently used knowledge, key methodology |
| P2 | **Reference** | Occasional reference; useful but non-essential |
| P3 | **Archived** | Mastered, deprecated, or superseded content |

**III.4** THEMATIC ABBREVIATIONS (controlled vocabulary, extensible by amendment):

| Abbr | Full Name | Abbr | Full Name |
|------|-----------|------|-----------|
| PY | Python | DS | Data Science |
| ML | Machine Learning | DL | Deep Learning |
| LLM | LLM / AI | ALGO | Algorithm |
| SYS | System Design | DB | Database |
| WEB | Web Development | MATH | Mathematics |
| STAT | Statistics | PROB | Probability |
| TOOL | Tooling / DevOps | IDEA | Conceptual / General |
| ACAD | Academic Research | SEC | Security |
| PROD | Product / Design | MISC | Miscellaneous |
| PHYS | Physics | BIO | Biology |
| CHEM | Chemistry | ENG | Engineering |

**III.5** TAG ABBREVIATIONS follow the same uppercase-dash convention. Examples:

| Full Form | Abbreviation |
|-----------|-------------|
| Async/Await | AASY |
| Event Loop | EVLP |
| Pandas | PAND |
| NumPy | NUMP |
| PyTorch | TORC |
| Linear Algebra | LIAL |
| Attention Mechanism | ATTN |
| Dynamic Programming | DYPR |
| Prompt Engineering | PROE |
| Retrieval-Augmented Generation | RAG |
| Transformer | TRFM |
| Differential Equations | DIFEQ |
| Microservices | MISE |

**III.6** The hex serial SHALL begin at `0000000001` (hexadecimal 1) and increment by exactly 1 for each new entry. The serial is global across all themes and tags — never reset or reused.

**III.7** A KNID, once assigned, SHALL NEVER be reassigned. If an entry is deleted, its KNID is retired permanently.

---

## Article IV: Entry Format and Encoding

**IV.1** Every knowledge entry MUST conform to the following schema:

```markdown
### {KNID} | {Title}

**Created**: {YYYY-MM-DD} | **Updated**: {YYYY-MM-DD}
**Priority**: {P0–P3} | **Tags**: `#tag1` `#tag2` `#tag3` `#status-tag`
**Sources**:
  └ [{Source-Type}] {Source description} ({date}) {optional: → URL}

**Cite**: (GB/T 7714-2015 format — required for all formal literature/document sources)
- AUTHOR(S). Title[Type]. Journal/Publisher, Year, Volume(Issue): Pages.

> {One-sentence abstract — the essence of the entry}

**Core Points**:
- {Point one}
- {Point two}
- {Point three}

**Related**: [[{KNID}]] · [[{KNID}]] · [[{KNID}]]

---
```

**IV.2** SOURCE CITATION FORMATS:

| Source Type | Format |
|-------------|--------|
| Conversation | `[Conversation] Speaker ({YYYY-MM-DD}): "Quote"` |
| Published Article / Paper | `[Literature] Author(s) ({YYYY}). *Title*. *Journal*, Vol(Issue), Pages. DOI: xxx` |
| Web Page | `[Web] Page Title → URL ({access-date})` |
| Uploaded File | `[File] Filename.ext ({upload-date})` |
| Code | `[Code] Description → path/URL ({date})` |
| AI Knowledge | `[AI] Model Name - {training/internal/web-resolved} ({date})` |
| Book | `[Book] Author(s) ({Year}). *Title* (Edition). Publisher. ISBN: xxx` |

**IV.3** MATHEMATICAL FORMULAS — LaTeX encoding:

- Inline formulas MUST use `$...$` delimiters.
- Display (block) formulas MUST use `$$...$$` delimiters.
- All LaTeX MUST be semantically valid and compilable by standard LaTeX engines.

*Examples:*
- `$E = mc^2$`
- `$$\int_{-\infty}^{\infty} e^{-x^2}\,dx = \sqrt{\pi}$$`
- `$\frac{\partial L}{\partial w} = \frac{1}{m} X^T(Xw - y)$`
- Matrix: `$\begin{bmatrix} a & b \\ c & d \end{bmatrix}$`

**IV.4** TABLES — dual-format support:

Tables MAY be encoded in either of two formats, chosen for readability:

*Option A — Markdown table (preferred for simple tables):*
```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| $a_{11}$ | $a_{12}$ | $a_{13}$ |
| $a_{21}$ | $a_{22}$ | $a_{23}$ |
```

*Option B — LaTeX tabular within display math (preferred for complex or multi-page tables):*
```latex
$$
\begin{array}{l|c|r}
\text{Column 1} & \text{Column 2} & \text{Column 3} \\ \hline
\text{Data}_1 & \text{Data}_2 & \text{Data}_3 \\
\end{array}
$$
```

**IV.5** Language policy:

- Entry titles: English or Chinese, whichever is more precise.
- Core Points: Chinese preferred, English for technical terms.
- Tags: English-only, lowercase, no spaces (e.g., `#machine-learning`).
- Sources: Preserve original language.
- Abstracts (`>` line): Scholar's preference, be consistent per entry.
- Formulas and tables: LaTeX-only regardless of language.

**IV.6** **GB/T 7714-2015 bibliographic citations.** Every entry that references a formal literature source (journal article, book, report, conference paper) MUST include a `**Cite**` field containing the reference formatted in GB/T 7714-2015 national standard.

The `**Cite**` field SHALL appear immediately after `**Sources**` in the entry schema.

**GB/T 7714-2015 basic formats** (Chinese national standard for bibliographic references):

| Source Type | Format | Example |
|-------------|--------|---------|
| Journal article `[J]` | AUTHOR(S). Title[J]. Journal Name, Year, Volume(Issue): Page range. | CORONG E L, et al. The standard GTAP model, version 7[J]. Journal of Global Economic Analysis, 2017, 2(1): 1-119. |
| Book `[M]` | AUTHOR(S). Title[M]. Place: Publisher, Year. | NORDHAUS W. The climate casino[M]. New Haven: Yale University Press, 2013. |
| Report `[R]` | AUTHOR(S). Title[R]. Place: Publisher, Year. | JOHNSON J A, et al. The economic case for nature[R]. Washington, D.C.: World Bank, 2021. |
| Conference `[C]` | AUTHOR(S). Title[C]. Conference Name, Location, Date. | — |
| Web `[EB/OL]` | AUTHOR(S). Title[EB/OL]. (Date)[Access Date]. URL. | — |

**Rules:**
- Author names: SURNAME Initials, uppercase, comma-separated. Use "et al." for more than 3 authors.
- Title case: Sentence case (first word + proper nouns capitalized) for English titles.
- Every `**Cite**` entry MUST have a corresponding source in `**Sources**`.
- If bibliographic information is incomplete, append a `**Note**: 引文残缺 — {specific missing details}` field after `**Cite**`.

**IV.7** Every entry MUST have at least one source. An entry with zero sources SHALL be flagged as `#unverified` and MAY be pruned after 90 days without remediation.

---

## Article V: Figure and Image Policy

**V.1** Figures are classified into two categories for storage decisions:

### Class A — Stable Academic References (Store link only)

**Criteria:** Published in a peer-reviewed venue with a persistent identifier (DOI, ISBN, arXiv ID, PubMed ID). The figure is expected to remain accessible indefinitely through institutional or public archives.

**Action:** Record the source metadata and figure location only. Do NOT store the image file.

**Format in knowledge entry:**
```markdown
**Sources**:
  └ [Figure] Author(s) ({Year}). *Title*. *Journal*, {Vol}(Issue), {Pages}. DOI: {doi}
    → Figure {N}: {brief description of what the figure demonstrates}
```

*Example:*
```markdown
**Sources**:
  └ [Figure] Vaswani et al. (2017). "Attention Is All You Need." *NeurIPS 2017*. DOI: 10.48550/arXiv.1706.03762
    → Figure 2: Scaled Dot-Product Attention and Multi-Head Attention architecture
```

### Class B — Ephemeral Sources (Register in the figures directory)

**Criteria:** Web images without permanent URL, screenshots, social-media posts, personal photographs, rare/out-of-print books without ISBN, whiteboard photos, hand-drawn diagrams, or any figure whose long-term availability cannot be assured.

**Action:** Create a figure entry in `work/figures/{YYYY}-{MM}/` first. On promotion (daily consolidation), the entry moves to `knowledge/figures/{YYYY}-{MM}/`.

**Figure entry format:**
```markdown
### FIG-{XXXXXXXXXX} | {Short descriptive title}

**Date**: {YYYY-MM-DD}
**Status**: `#figure` `#ephemeral` `#{topic-tag}`
**Acquired**: {source description — URL, screenshot, photo, etc.}

**Description**:
{What this figure depicts — be as specific as necessary}

**Relevance**:
{Why it was saved; which knowledge entries it connects to}

**Related**: [[{KNID}]] · [[{KNID}]]

---
```

**V.3** Every figure entry, regardless of class, MUST carry at least two tags: one `#figure` tag and one or more content tags describing the subject matter.

**V.4** The Steward SHALL record figure references in the relevant knowledge entry's `**Sources**` field using the formats above.

**V.5** When referencing a Class-A figure from within a knowledge entry's body, use the inline notation: `[Fig: AuthorYear:FigN]`.

**V.6** When referencing a Class-B figure from within a knowledge entry's body, use: `[Fig: FIG-XXXXXXXXXX]`.

---

## Article VI: Tag Taxonomy

**VI.1** Every knowledge entry MUST carry at least one tag. Entries with zero tags SHALL be flagged during daily maintenance.

**VI.2** Tag categories:

| Category | Convention | Examples | Assignment |
|----------|-----------|----------|------------|
| **Content** | lowercase, hyphenated | `#python`, `#async-programming`, `#linear-algebra` | AI auto-generated, Scholar-verified |
| **Status** | lowercase, prefixed `st-` | `#st-new`, `#st-mastered`, `#st-unverified` | AI-assigned, auto-evolved |
| **Type** | lowercase, prefixed `t-` | `#t-concept`, `#t-method`, `#t-tool`, `#t-case`, `#t-data`, `#t-opinion` | AI-assigned |
| **Figure** | reserved | `#figure`, `#ephemeral` | Auto-assigned for figure entries |

**VI.3** Status lifecycle:

```
#st-new (30 days) → reviewed → #st-mastered or #st-unverified
#st-unverified (90 days) → pruned if still unsourced
```

**VI.4** Tag relationships (stored in TAGS.md):

- `A → B` (A is-a-subtopic-of B)
- `A — B` (A is-related-to B) with optional `[weight: N]`
- `A ⇄ B` (A and B are mutually-referencing)

**VI.5** Tags SHALL be normalized: synonyms merged, case lowered, hyphens preferred over underscores.

---

## Article VII: Knowledge Quality Standards

**VII.1** Every entry MUST, at minimum, satisfy the "Three-S Rule":
- **Sourced**: Traceable origin
- **Specific**: Precise, actionable content; no vague generalities
- **Structured**: Follows the mandated schema

**VII.2** Accuracy expectation: The Steward SHALL cross-reference factual claims against the sources cited. When internal knowledge or web search reveals a contradiction, the entry SHALL note both positions and flag `#st-unverified`.

**VII.3** Entries SHALL NOT contain:
- Personally Identifiable Information (passwords, API keys, SSN, addresses)
- Confidential code or proprietary data
- Hateful or abusive content
- Malware or exploit instructions for active vulnerabilities

**VII.4** The Steward MAY merge two entries that cover substantially the same knowledge. The merged entry retains the older KNID; the younger KNID is retired with a redirect note in the original monthly file.

---

## Article VIII: Maintenance Workflows

**VIII.1** **Extraction (real-time):** When the Scholar signals "save this", uploads a document, or the Steward detects a knowledge-worthy passage during conversation:

**One-pass exhaustive extraction principle:** Material appears only once. The Steward MUST extract as completely as possible in this single pass — structure, data, methods, sources, and cross-connections. Reliance on future re-reading is NOT permitted. Token cost is high; storage is cheap; the material will not return.

**Question-as-signal detection:** The Scholar's questions are not merely conversational — each question type signals a distinct knowledge-management need. The Steward SHALL classify Scholar utterances during extraction and respond accordingly:

| Scholar utterance | Hidden signal | Steward response |
|------------------|--------------|------------------|
| "RCP呢？" / "SSP呢？" / "那X呢" | Missing concept in knowledge chain | Check if concept exists in `knowledge/`; if absent, propose creating a P3 entry linked to the chain |
| "讲一讲方法细节" / "具体怎么算的" | Current entry depth insufficient | Expand methodology section, or flag for future extension in **Note** |
| "检查下" / "整理一下" | Quality review requested | Trigger format + citation compliance check per Art. IV / Art. VII |
| "这个思路不错，记录下" | New theoretical direction | Create concept entry immediately |
| "有没有替代方案" / "还有其他方法吗" | Comparative framework needed | Scan `knowledge/` for related entries; if absent, propose creation |
| "这样结合会怎样" / "能不能联动" | Cross-entry connection point | Add **Related** links; consider a synthesis entry |
| "上传文件" + silence | Extension reading | Full document extraction per one-pass principle; link into existing knowledge chain |

Pure social tokens ("好的", "有意思", "继续", "嗯") are NOT signals. Only utterances indicating a knowledge gap, connection, or depth requirement trigger a response.

Extraction procedure:
1. Confirm intent with the Scholar.
2. For uploaded files: read the full document; do NOT skim or sample.
3. Extract comprehensively: problem framing / model architecture / data sources / key equations / quantitative results / limitations / connections to existing knowledge.
4. If bibliographic information is incomplete, note it (`**Note**: 引文残缺`) but extract the content anyway.
5. **Determine the next hex serial via state cache:**
   a. Read `tools/CACHE.md` → extract `last_hex_serial` and `last_total_entries`.
   b. Read only the first 5 lines of `tools/INDEX.md` → extract `Total entries`.
   c. **If** the total entries count matches the cache → use cached `last_hex_serial` + 1 as the new KNID hex serial (skip full INDEX.md read).
   d. **If** the count does NOT match (another session added entries) → do a full INDEX.md read to find the actual latest KNID; note the discrepancy in the cache.
6. Assign priority, tags, and sources.
7. Scan existing entries in `knowledge/` for relationships (check TAGS.md and GRAPH.md headers for last-updated timestamps; only re-read if stale).
8. Write full entry to `work/{YYYY}/{MM}.md` (draft — not yet indexed).
9. If figure cited and Class B, create entry in `work/figures/{YYYY}-{MM}/`.
10. **Update state cache:** Update `tools/CACHE.md` with the new `last_hex_serial`, new `total_entries`, and current timestamp.

**VIII.2** **Session-end review & daily consolidation:** At the end of each conversation session — or when the Scholar signals readiness (e.g., "检查一下", "整理一下", "回顾") — the Steward SHALL perform a session review BEFORE consolidation.

**Phase A — Session knowledge review (confirmation, not gap-filling):**
The purpose of session review is NOT to compensate for incomplete extraction (materials do not repeat). Instead, it serves to:
- Confirm that all extracted content matches the Scholar's intent and interpretation
- Identify any understanding deviations between Steward and Scholar
- Catch meta-insights from the conversation itself (methodological critiques, cross-domain connections, research directions)
1. Scan the current conversation for **meta-knowledge** — insights about the knowledge itself, connections between entries, critiques, and research directions.
2. Note any items where material was presented but extraction encountered uncertainty; flag these for Scholar correction.
3. Present findings to the Scholar for confirmation.
4. For confirmed items, execute the standard extraction procedure (VIII.1) to produce draft entries in `work/`.

**Phase B — Daily consolidation (existing):**
5. Read all draft entries from `work/{YYYY}/{MM}.md`.
6. Verify format compliance, including GB/T 7714-2015 citation completeness (Art. IV.6).
7. Fill missing relational links against published entries in `knowledge/`.
8. Merge near-duplicates.
9. **Promote**: append verified entries to `knowledge/{YYYY}/{MM}.md`.
10. Remove promoted entries from `work/{YYYY}/{MM}.md`.
11. Promote figure entries: move from `work/figures/` to `knowledge/figures/`.
12. Update INDEX.md statistics, TAGS.md, GRAPH.md.

**VIII.3** **Weekly deep analysis (every Saturday, 10:00 local):**
1. Trend analysis: new-entry count (work/ + knowledge/), priority distribution, top-5 tags.
2. Relationship discovery: find unlinked entries with overlapping tags (across both work/ and knowledge/).
3. Graph reconstruction: add new concept nodes and edges to GRAPH.md.
4. Gap analysis: infer missing prerequisite concepts.
5. Deep insight: synthesize 2–3 cross-domain connections.
6. Publish report to `tools/analysis/weekly/{YYYY}-W{WW}-analysis.md`.

**VIII.4** **Retrieval (on-demand):**
1. Parse the Scholar's query.
2. Search INDEX.md by tag, priority, and theme.
3. Read relevant entries, following `**Related**:` links.
4. Present synthesized answer with source citations.

**VIII.5** **Daily automated review (03:00 local, unattended):** A scheduled task (`daily-knowledge-review`) runs every day at 03:00 to perform an unattended gap analysis on the day's content.

The task SHALL:
1. Scan all draft entries in `work/` and all entries added to `knowledge/` since the previous review.
2. For each entry, identify:
   - Referenced concepts that do not have their own entry in `knowledge/`
   - Referenced literature that does not have a corresponding source entry
   - Cross-connections between today's entries that are not yet linked
3. **Append-only policy**: The task MUST NOT delete, modify, or overwrite any existing entry. It MAY create new draft entries in `work/` for high-confidence gaps.
4. Write a daily review log to `tools/analysis/daily/{YYYY}-{MM}-{DD}.md` containing:
   - Summary of today's entries (count, themes, priorities)
   - Identified gaps and suggested actions
   - Cross-connections found
5. If no activity detected, log "No activity" and exit.
6. The review is fully automated — no Scholar confirmation required for the review log itself. New draft entries created for gap items SHALL be reviewed during the next regular consolidation.

**VIII.6** **Context-length awareness & consolidation prompting.** The Steward SHALL monitor the current conversation's length relative to the model's context window. When the conversation approaches the context limit (estimated from message count, file attachments, and output length), the Steward SHALL proactively prompt the Scholar to run a session-end review and consolidation:

> "对话接近长度限制，建议整理当前内容后再继续。要运行一次'检查一下'吗？"

This prompt SHALL be issued when the Steward estimates the conversation has reached approximately 70% of the effective context capacity. The Scholar's response (consolidate now, defer, or ignore) SHALL be respected without repeated prompting for the remainder of that session.

---

## Article IX: Amendment Procedure

**IX.1** This constitution MAY be amended by:
1. The Scholar issuing a directive to update.
2. The Steward identifying an ambiguity or gap and proposing an amendment for Scholar approval.

**IX.2** Amendments take effect immediately upon Scholar approval. The `## Changelog` section below SHALL record each amendment.

**IX.3** The constitution file itself SHALL be updated atomically — the old version is replaced in full by the new, never patched.

**IX.4** **Baseline backup:** BEFORE any amendment takes effect, the Steward SHALL:
1. Copy the current `tools/CONSTITUTION.md` to `baseline/CONSTITUTION-v{old-version}.md`.
2. Update `baseline/README.md` to include the new archive entry.
3. Only then apply the amendment to `tools/CONSTITUTION.md`.