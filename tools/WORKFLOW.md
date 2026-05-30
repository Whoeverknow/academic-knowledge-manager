# Workflow: Operational Procedures

> **Version**: 3.0 | **Effective**: 2026-05-30
> **Role**: Fixed operational procedures for the Steward. Immutable governance rules → `CONSTITUTION.md`. Heuristics → `STRATEGY.md`.
> This document SHALL NOT contain strategy tables, heuristics, or context-dependent decision rules.

---

## W1: Extraction (Real-Time)

**Trigger**: Scholar signals "save this", uploads a document, or Steward detects knowledge-worthy passage.

**One-pass exhaustive extraction principle**: Material appears only once. Extract fully in this single pass — structure, data, methods, sources, cross-connections. Token cost is high; storage is cheap; material will not return.

**Procedure**:

1. **Confirm intent** with the Scholar.

2. **For uploaded files**: read the full document; do NOT skim or sample.

3. **Extract comprehensively**: problem framing, model architecture, data sources, key equations, quantitative results, limitations, connections to existing knowledge.

4. **If bibliographic information is incomplete**: note it (`**Note**: 引文残缺 — {details}`) but extract content anyway.

5. **Determine next hex serial via state cache**:
   a. Read `tools/CACHE.md` → extract `last_hex_serial`.
   b. Read first 5 lines of `tools/INDEX.md` → verify `total_entries`.
   c. If cache matches → use `last_hex_serial + 1`.
   d. If cache does NOT match → full INDEX.md read to find actual latest KNID.

6. **Assign priority, tags, sources**.

7. **Scan existing entries** for relationships (check TAGS.md and GRAPH.md timestamps; re-read only if stale).

8. **Write full entry** to `work/{YYYY}/{MM}.md` (draft).

9. **Register in `work/INDEX.md`** — add one line: `KNID | Title | #status | date`.

10. **If figure cited and Class B**: create entry in `work/figures/{YYYY}-{MM}/`.

11. **Update `tools/CACHE.md`**: new `last_hex_serial`, new `total_entries`, current timestamp.

12. **Log to audit**: write one line to `tools/audit/logs/{YYYY}-{MM}-audit.log`.

---

## W2: Session-End Review & Consolidation

**Trigger**: Scholar says "检查一下", "整理一下", "回顾", or session naturally concludes.

**Phase A — Session knowledge review (confirmation, not gap-filling)**:
1. Scan the current conversation for **meta-knowledge** — insights about the knowledge itself, connections between entries, critiques, research directions.
2. Note items where extraction encountered uncertainty; flag for Scholar correction.
3. Present findings to Scholar for confirmation.

**Phase B — Daily consolidation**:
1. Read all draft entries from `work/{YYYY}/{MM}.md`.
2. Verify format compliance (Art. IV), including GB/T 7714-2015 citation completeness.
3. Fill missing relational links against published entries in `knowledge/`.
4. Merge near-duplicates (older KNID retained; younger retired with tombstone).
5. **Promote**: append verified entries to `knowledge/{YYYY}/{MM}.md`.
6. Remove promoted entries from `work/{YYYY}/{MM}.md`.
7. Update `work/INDEX.md` — remove promoted entries, mark merged entries.
8. Promote figure entries from `work/figures/` to `knowledge/figures/`.
9. Update `tools/INDEX.md` statistics, `tools/TAGS.md`, `tools/GRAPH.md`.
10. Log consolidation to audit.

---

## W3: Daily Automated Review (03:00)

**Procedure**:
1. Scan draft entries in `work/` and entries added to `knowledge/` since previous review.
2. For each entry, identify: referenced concepts without own entry, referenced literature without source entry, unlinked cross-connections.
3. **Append-only policy**: NEVER delete, modify, or overwrite any existing entry. MAY create new draft entries for high-confidence gaps.
4. Write daily review log to `tools/analysis/daily/{YYYY}/{MM}/{YYYY}-{MM}-{DD}.md`.
5. If no activity detected, log "No activity" and exit.

---

## W4: Weekly Deep Analysis (Saturday 10:00)

**Procedure**:
1. Trend analysis: new-entry count, priority distribution, top-5 tags.
2. Relationship discovery: find unlinked entries with overlapping tags.
3. Graph reconstruction: update `tools/GRAPH.md` with new nodes and edges.
4. Gap analysis: infer missing prerequisite concepts.
5. Deep insight: synthesize 2–3 cross-domain connections.
6. Monthly report aggregation: at month end, aggregate daily reports → `tools/analysis/daily/summaries/{YYYY}-{MM}-summary.md`.
7. Publish weekly report to `tools/analysis/weekly/{YYYY}/{YYYY}-W{WW}-analysis.md`.
8. Log weekly maintenance to audit.

---

## W5: Session Node Generation (Session End)

**Trigger**: Each session end, automatically.

**Procedure**:
1. Generate session node (~500 tokens) with metadata, topic tags, key conclusions, created KNIDs, unresolved questions, related session links.
2. Write to `conversations/nodes/{YYYY}/{MM}/{SESSION-ID}.md`.
3. Register in `conversations/INDEX.md` (one line).
4. If this session continues an active thread, update that thread in `conversations/threads/`.
5. Full transcript already exists in cold storage; do NOT load or reference.

---

## W6: Memory Maintenance (Daily + Weekly)

**Daily**:
1. Check `memory/MEMORY.md` — any memory >90 days unreferenced in hot tier → mark #warm.
2. Check `memory/archive/INDEX.md` — any memory explicitly referenced by Scholar → flag for resurrection.

**Weekly**:
1. Calculate effective ranks for all memories (reference_count × half-life decay).
2. Output: memory tier change candidates (hot→warm, warm→cold, cold→resurrect).
3. Scan for semantic overlap in memory content → merge candidates.
4. Detect feedback memories superseded by system default behavior → cold candidate.
5. Update memory threads.

---

## W7: Audit Logging

**Format** (one JSON line per event):
```json
{"ts":"ISO8601","type":"extract|consolidate|merge|amend|decommission","target":"KNID or file","actor":"Scholar|Steward","detail":"..."}
```

**Rotation**: Daily maintenance appends to `tools/audit/logs/{YYYY}-{MM}-audit.log`. Monthly: generate digest in `tools/audit/digests/{YYYY}-{MM}-digest.md`, update `tools/audit/INDEX.md`. Raw logs >12 months old → cold storage.

---

## Quick Reference: Source Citation Formats

| Source Type | Format |
|-------------|--------|
| Conversation | `[Conversation] Speaker ({YYYY-MM-DD}): "Quote"` |
| Published Article | `[Literature] Author(s) ({YYYY}). *Title*. *Journal*, Vol(Issue), Pages. DOI: xxx` |
| Web Page | `[Web] Page Title → URL ({access-date})` |
| Uploaded File | `[File] Filename.ext ({upload-date})` |
| Code | `[Code] Description → path/URL ({date})` |
| AI Knowledge | `[AI] Model Name - {source} ({date})` |
| Book | `[Book] Author(s) ({Year}). *Title* (Edition). Publisher. ISBN: xxx` |
| Session Node | `[Session] SESSION-{ID} ({date})` |

## Quick Reference: GB/T 7714-2015

| Type | Format |
|------|--------|
| Journal `[J]` | AUTHOR(S). Title[J]. Journal Name, Year, Volume(Issue): Pages. |
| Book `[M]` | AUTHOR(S). Title[M]. Place: Publisher, Year. |
| Report `[R]` | AUTHOR(S). Title[R]. Place: Publisher, Year. |
| Web `[EB/OL]` | AUTHOR(S). Title[EB/OL]. (Date)[Access Date]. URL. |

Rules: Author names SURNAME Initials. "et al." for >3 authors. Sentence case for English titles. Every `**Cite**` must have corresponding `**Sources**` entry.
