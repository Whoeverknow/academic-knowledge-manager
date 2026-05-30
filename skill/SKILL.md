---
name: "academic-knowledge-manager"
description: "v3.0 知识库全生命周期管理：提取→分层→降冷→检索，分形 Wiki 编目 + 齐夫排名 + 上下文预算意识"
---

# Academic Knowledge Manager (v3.0)

**steipete principle**: Every token in context must justify itself. If 80% of sessions don't need a rule, that rule doesn't belong here.

## Architecture

This skill is split into three files, loaded together on invocation (~6.5K tokens):

| File | Role | Stability |
|------|------|-----------|
| `tools/CONSTITUTION.md` | Immutable rules (KNID, format, ethics, budget) | Near-permanent |
| `tools/WORKFLOW.md` | Fixed procedures (extract, consolidate, maintain) | Low-frequency revision |
| `tools/STRATEGY.md` | Heuristics (signals, bias, Zipf params, thresholds) | Continuously evolving |

## Subsystems (Fractal Registry → Thread → Node)

| Subsystem | Registry (L1) | Thread (L2) | Node (L3) | Cold |
|-----------|--------------|-------------|-----------|------|
| Knowledge | `tools/INDEX.md` | Theme pages + TAGS + GRAPH | KNID entries in `knowledge/` | P3 archive |
| Conversations | `conversations/INDEX.md` | `conversations/threads/` | `conversations/nodes/` (~500 tok) | Full transcripts |
| Memory | `memory/MEMORY.md` | `memory/threads/` | Individual memory files | `memory/archive/` |
| Analysis | `analysis/*/INDEX.md` | Monthly/quarterly summaries | Individual reports | Cold archive |
| Audit | `audit/INDEX.md` | Monthly digests | Raw audit logs | >12 month logs |

## Core Principles

1. **One-pass extraction** — material appears once; extract fully or lose it
2. **Zipf-tiered lifecycle** — rank-driven hot/warm/cold, not time-threshold-driven
3. **Half-life decay** — theory decays slower than tools (α: 0.001 vs 0.03)
4. **Wiki navigation** — Related links + Tags + Graph > external search
5. **Startup minimization** — ~8K tokens at startup; full content only on demand
6. **Audit everything** — every extract/consolidate/amend logged, reversible

## Quick Operations

| Scholar says | Action |
|-------------|--------|
| "记录下这个" | Extract → `work/` draft → `work/INDEX.md` |
| "检查一下" | Session review → consolidate → `knowledge/` |
| "X是什么" | Wiki-navigate: INDEX → Related → entry |
| "X和Y的关系" | Follow GRAPH.md + cross-references |
| "整理知识库" | Trigger W4 (weekly deep analysis) |
| "最近做了什么" | Read `audit/INDEX.md` digest |

## Scheduled Tasks

- `daily-knowledge-review` — 03:00 daily, automated gap analysis
- `weekly-knowledge-analysis` — Saturday 10:00, full analysis + Zipf ranking

## Session End Checklist

- [ ] Generate session node → `conversations/nodes/`
- [ ] Update active threads if this session is a continuation
- [ ] Register new memories in `memory/MEMORY.md`
- [ ] Prompt Scholar for "检查一下" if drafts exist
- [ ] Log session to audit
