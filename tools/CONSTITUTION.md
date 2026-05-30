# Constitution of the Academic Knowledge Management System

> **Version**: 3.0 | **Effective**: 2026-05-30
> **Role**: Immutable governance rules. Operational procedures → `WORKFLOW.md`. Heuristics → `STRATEGY.md`.
> This document SHALL NOT contain workflow steps, strategy tables, or heuristic guidance.

---

## Article I: Purpose and Scope

**I.1** This knowledge management system ("the System") exists to capture, structure, preserve, and interconnect knowledge acquired through conversation, reading, experimentation, and research.

**I.2** The System serves a single user ("the Scholar"). All entries are curated by an AI assistant ("the Steward") under the Scholar's direction.

**I.3** The knowledge base resides at `F:\8-ClaudeKnowlegeBase\1-AcademicKnowledge\`. All paths herein are relative to that root.

---

## Article II: Repository Structure

**II.1** The root directory SHALL contain these subdirectories:

```
/
├── tools/                       # Management infrastructure
│   ├── CONSTITUTION.md          # This document — immutable governance rules
│   ├── WORKFLOW.md              # Operational procedures (extraction, consolidation, maintenance)
│   ├── STRATEGY.md              # Heuristics & strategies (with activation/expiry conditions)
│   ├── INDEX.md                 # Multi-dimensional entry index (knowledge/ only)
│   ├── CACHE.md                 # State cache: last_hex_serial, total_entries, timestamp
│   ├── TAGS.md                  # Tag taxonomy, definitions, relationship graph
│   ├── GRAPH.md                 # Mermaid knowledge-graph
│   ├── audit/                   # Audit logs & digests
│   │   ├── INDEX.md             # Monthly audit summaries
│   │   ├── digests/             # Monthly audit digests
│   │   └── logs/                # Raw audit logs (cold storage)
│   ├── design/                  # System design documents (threshold: create INDEX.md when >10 docs)
│   └── analysis/
│       ├── daily/               # Daily review logs → monthly summaries → archive
│       │   ├── INDEX.md         # Registry of daily reports
│       │   ├── summaries/       # Monthly aggregations
│       │   └── {YYYY}/{MM}/     # Individual daily reports (cold after monthly summary)
│       ├── weekly/              # Weekly deep-analysis → quarterly summaries → archive
│       │   ├── INDEX.md
│       │   ├── summaries/       # Quarterly aggregations
│       │   └── {YYYY}/          # Individual weekly reports
│       └── special/             # Ad-hoc analyses
├── work/                        # Staging area — new entries land here first
│   ├── INDEX.md                 # Draft registry (all pending drafts, one line each)
│   ├── {YYYY}/{MM}.md           # Draft monthly entries
│   └── figures/{YYYY}-{MM}/     # Draft figure entries
├── knowledge/                   # Published library
│   ├── {YYYY}/{MM}.md           # Published monthly entries
│   └── figures/                 # Published figure registry
│       ├── README.md
│       └── {YYYY}-{MM}/
├── conversations/               # Session Wiki catalog (see CONVERSATION-WIKI-DESIGN.md)
│   ├── INDEX.md                 # Session registry (startup-loaded)
│   ├── nodes/{YYYY}/{MM}/       # Individual session nodes (~500 tokens each)
│   ├── threads/                 # Cross-session topic aggregators
│   ├── transcripts/{YYYY}/{MM}/ # Full transcripts (cold storage — never preloaded)
│   └── ARCHIVE.md               # Retired session nodes
├── memory/                      # Persistent memory (see MEMORY-WIKI-DESIGN.md)
│   ├── MEMORY.md                # Hot + warm memory registry (startup-loaded)
│   ├── threads/                 # Cross-memory topic aggregators
│   ├── archive/                 # Cold memories (INDEX.md + files)
│   └── audit/                   # Memory change audit log
└── baseline/                    # Versioned governance-file archives
    ├── README.md
    └── CONSTITUTION-v{VER}.md   # Pre-amendment snapshots
```

**II.2** No file or directory outside this structure SHALL be created without an amendment to this constitution.

**II.3** The lifecycle of a knowledge entry:
```
Scholar signals "save" → work/{YYYY}/{MM}.md (draft, registered in work/INDEX.md)
                    → daily/weekly consolidation → knowledge/{YYYY}/{MM}.md (published)
                    → Zipf-rank drop below K_hot → #st-archived (stays in knowledge/, off hot index)
                    → continued disuse → archived to tombstone
```

**II.4** When a monthly file exceeds 500 entries or 200 KB, split into fortnightly files (`{MM}-01.md`, `{MM}-02.md`).

---

## Article III: Knowledge Identifier System

**III.1** Every knowledge entry MUST be assigned a globally unique, immutable identifier (KNID) upon creation.

**III.2** KNID format:
```
P{p}-{THEME}-{TAG}-{XXXXXXXXXX}
```
| Component | Length | Domain | Description |
|-----------|--------|--------|-------------|
| `P{p}` | 2 | `P0`–`P3` | Priority tier |
| `{THEME}` | 2–4 | A–Z uppercase | Theme abbreviation |
| `{TAG}` | 2–6 | A–Z uppercase | Core-tag abbreviation |
| `{XXXXXXXXXX}` | 10 | `0–9a–f` hex | Monotonically increasing hex serial |

**III.3** PRIORITY TIERS:

| Tier | Label | Definition |
|------|-------|------------|
| P0 | Core | Foundational concept; pillar of the knowledge edifice |
| P1 | Important | Frequently used knowledge, key methodology |
| P2 | Reference | Occasional reference; useful but non-essential |
| P3 | Archived | Mastered, deprecated, or superseded content |

**III.4** THEMATIC ABBREVIATIONS (controlled vocabulary): PY (Python), DS (Data Science), ML (Machine Learning), DL (Deep Learning), LLM (LLM/AI), ALGO (Algorithm), SYS (System Design), DB (Database), WEB (Web), MATH (Mathematics), STAT (Statistics), PROB (Probability), TOOL (Tooling/DevOps), IDEA (Conceptual/General), ACAD (Academic Research), SEC (Security), PROD (Product/Design), MISC (Miscellaneous), PHYS (Physics), BIO (Biology), CHEM (Chemistry), ENG (Engineering).

**III.5** TAG ABBREVIATIONS follow uppercase-dash convention (e.g., `AASY` for Async/Await, `TRFM` for Transformer).

**III.6** Hex serial begins at `0000000001`, increments by 1 for each new entry. Global across all themes — never reset or reused. A KNID, once assigned, SHALL NEVER be reassigned.

---

## Article IV: Entry Format and Encoding

**IV.1** Every knowledge entry MUST conform to:
```markdown
### {KNID} | {Title}

**Created**: {YYYY-MM-DD} | **Updated**: {YYYY-MM-DD}
**Priority**: {P0–P3} | **Tags**: `#tag1` `#tag2` `#status-tag`
**Sources**:
  └ [{Source-Type}] {Source description} ({date}) {→ URL}

**Cite**: (GB/T 7714-2015 format — required for all formal literature/document sources)
- AUTHOR(S). Title[Type]. Journal/Publisher, Year, Volume(Issue): Pages.

> {One-sentence abstract}

**Core Points**:
- {Point one}
- {Point two}

**Related**: [[{KNID}]] · [[{KNID}]]

---
```

**IV.2** SOURCE CITATION FORMATS: [Conversation], [Literature], [Web], [File], [Code], [AI], [Book] — see `WORKFLOW.md` for complete format reference.

**IV.3** MATHEMATICAL FORMULAS: Inline `$...$`, display `$$...$$`. All LaTeX must be semantically valid.

**IV.4** TABLES: Markdown for simple tables, LaTeX `\begin{array}` within `$$...$$` for complex tables.

**IV.5** LANGUAGE: Titles in English or Chinese (whichever more precise). Core Points in Chinese preferred, English for technical terms. Tags in English-only, lowercase, hyphens. Sources preserve original language.

**IV.6** GB/T 7714-2015 BIBLIOGRAPHIC CITATIONS required for all formal literature sources. Incomplete citations marked `**Note**: 引文残缺 — {details}`.

**IV.7** Every entry MUST have at least one source. Zero-source entries flagged `#st-unverified`, prunable after 90 days.

---

## Article V: Figure and Image Policy

**V.1** Class A (stable academic references with persistent identifier): record source metadata and figure location only. Do NOT store image file.

**V.2** Class B (ephemeral sources without permanent URL): create figure entry in `work/figures/`, promote to `knowledge/figures/` on consolidation.

**V.3** Every figure entry carries at least `#figure` tag plus content tags.

---

## Article VI: Tag Taxonomy

**VI.1** Every entry MUST carry at least one content tag and one status tag.

**VI.2** Tag categories:

| Category | Convention | Examples |
|----------|-----------|----------|
| Content | lowercase, hyphenated | `#python`, `#natural-capital` |
| Status | `st-` prefixed | `#st-new`, `#st-mastered`, `#st-unverified`, `#st-archived` |
| Type | `t-` prefixed | `#t-concept`, `#t-method`, `#t-tool`, `#t-case`, `#t-data`, `#t-finding` |
| Figure | reserved | `#figure`, `#ephemeral` |

**VI.3** Status lifecycle: `#st-new` (30 days) → reviewed → `#st-mastered` or `#st-unverified`. `#st-unverified` (90 days) → pruned if unsourced. `#st-archived` for dormant entries.

---

## Article VII: Knowledge Quality Standards

**VII.1** Three-S Rule: **Sourced** (traceable origin), **Specific** (precise, actionable content), **Structured** (follows mandated schema).

**VII.2** Accuracy: Cross-reference factual claims against sources. Contradictions flagged `#st-unverified` with both positions noted.

**VII.3** Entries SHALL NOT contain: PII, confidential code, hateful content, malware/exploit instructions.

---

## Article VIII: Amendment Procedure

**VIII.1** This constitution MAY be amended by explicit Scholar directive naming the target and the intended change.

**VIII.2** Amendments take effect immediately upon Scholar approval.

**VIII.3** BEFORE any amendment: copy current `tools/CONSTITUTION.md` to `baseline/CONSTITUTION-v{old-version}.md`, update `baseline/README.md`, then apply amendment.

**VIII.4** Conversational contamination barrier: Ordinary knowledge-management discussion does NOT constitute an amendment request. Only explicit directives naming the constitution or its articles qualify.

---

## Article IX: Epistemological Standards

**IX.1** Source fidelity: Represent every source faithfully. No adding claims, removing qualifying language, restructuring to appear more definitive, or harmonizing contradictory sources.

**IX.2** Signal vs. inference separation — three categories:

| Category | Marking | Example |
|----------|---------|---------|
| Source statement | Direct citation or `>` block | `> The model projects −2.3% GDP by 2030.` |
| Steward synthesis | `*(Steward synthesis)*` prefix | Explicitly labeled |
| Steward inference | `(inferred)` inline | `URL: https://... (inferred)` |

**IX.3** Source hierarchy: `[Primary]` (original data/first-hand), `[Secondary]` (analysis/summary), `[Meta]` (commentary on literature). Default to `[Primary]`.

**IX.4** Critical cross-examination: Compare new entries against existing entries for factual contradictions. Flag unresolved contradictions with `#st-unverified` on BOTH entries. Never suppress a well-sourced finding.

**IX.5** Constructive framing: "This entry lacks a methodological appendix" not "This entry is incomplete". Always propose a remediation path when flagging a problem.

**IX.6** Provenance chain (six dimensions): **Who** (Scholar/source author/Steward), **What** (exact claim or paraphrase), **When** (source date + entry date), **Where** (URL/DOI/file path), **Why** (context that prompted capture), **How** (extraction method). Missing any dimension → flag `#st-unverified`.

---

## Article X: System Architecture — Context Budget

**X.1** Context budget as architectural constraint: Every subsystem that loads content into the AI's context window SHALL have an explicit token budget.

**X.2** Startup budget allocation (target totals):

| Subsystem | Startup load | Budget |
|-----------|-------------|--------|
| Conversations | `conversations/INDEX.md` | ~2K tokens |
| Memory | `memory/MEMORY.md` (hot+warm registry) | ~2K tokens |
| Skills | Skill registry (names + one-line descriptions) | ~1K tokens |
| Knowledge base | `tools/INDEX.md` | ~2K tokens |
| Active threads | Thread index from all subsystems | ~1K tokens |
| **Total startup** | | **~8K tokens** |

**X.3** No full transcript, no full memory file, no full skill instruction SHALL be preloaded at startup. All are loaded on demand.

**X.4** Fractal Registry→Thread→Node pattern applies uniformly to all growing file types. Three layers of abstraction provide ~20-50× context compression.

---

## Article XI: Knowledge Lifecycle — Zipf-Based Tiering

**XI.1** Knowledge entries, memory files, and conversation nodes SHALL be tiered by access frequency, not by fixed time thresholds.

**XI.2** The hot tier capacity $K_\text{hot}$ is determined by the subsystem's context budget divided by average entry index size. Entries compete for hot-tier positions by effective rank:

$$\text{effective\_rank} = \text{reference\_count} \times \frac{1}{1 + \alpha \cdot \text{age\_in\_months}}$$

**XI.3** Half-life decay coefficient $\alpha$ by knowledge type:

| Type | α | Rationale |
|------|---|-----------|
| Theory/concept (`#t-concept`) | 0.001 | Near-permanent; decays over decades |
| Method (`#t-method`) | 0.01 | Superseded by newer methods over years |
| Tool (`#t-tool`) | 0.02 | Software versions change; decays in 1-3 years |
| Data (`#t-data`) | 0.03 | Data versions update; decays in 1-2 years |
| Case study (`#t-case`) | 0.02 | Empirical findings may be updated |

**XI.4** Lifecycle states: **active** (hot tier, top $K_\text{hot}$ by effective rank) → **warm** (indexed but not in hot tier, top $K_\text{warm}$) → **cold** (off primary registry, in archive INDEX) → **tombstone** (metadata-only pointer to original).

**XI.5** Any entry explicitly referenced by the Scholar in conversation SHALL be resurrected to hot tier regardless of current state.

---

## Changelog

| Date | Version | Summary |
|------|---------|---------|
| 2026-05-30 | 3.0 | Major restructure: extracted workflow to WORKFLOW.md, strategies to STRATEGY.md. Added Article X (Context Budget), Article XI (Zipf Lifecycle). Added conversations/ and memory/ to directory structure. |
| 2026-05-27 | 2.12 | Context-length awareness, SUMMARIES.md |
| 2026-05-27 | 2.10 | Question-as-signal detection |
