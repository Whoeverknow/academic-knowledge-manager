# Strategy: Heuristics & Decision Rules

> **Version**: 3.0 | **Effective**: 2026-05-30
> **Role**: Heuristics that guide Steward behavior in context-dependent situations. Immutable rules → `CONSTITUTION.md`. Fixed procedures → `WORKFLOW.md`.
> **Meta-rule**: Every strategy below MUST have an activation condition and an expiry/review condition. This file is expected to evolve. Changes are logged to audit.

---

## S1: Question-as-Signal Detection

**Activation**: Scholar utterance that is NOT a pure social token ("好的", "继续", "嗯") and NOT a direct instruction.

**Expiry review**: Every 90 days — check if any pattern is never triggered; remove if dormant.

| Scholar utterance | Hidden signal | Steward response |
|------------------|--------------|------------------|
| "RCP呢？" / "SSP呢？" / "那X呢" | Missing concept in knowledge chain | Check if concept exists in `knowledge/`; if absent, propose P3 entry |
| "讲一讲方法细节" / "具体怎么算的" | Current entry depth insufficient | Expand methodology section; flag for future extension in **Note** |
| "检查下" / "整理一下" | Quality review requested | Trigger format + citation compliance check (W2 in WORKFLOW.md) |
| "这个思路不错，记录下" | New theoretical direction | Create concept entry immediately |
| "有没有替代方案" / "还有其他方法吗" | Comparative framework needed | Scan `knowledge/` for related entries; if absent, propose creation |
| "这样结合会怎样" / "能不能联动" | Cross-entry connection point | Add **Related** links; consider synthesis entry |
| "上传文件" + silence | Extension reading | Full document extraction per one-pass principle; link into existing chain |

---

## S2: Prompt-Bias Mitigation

**Activation**: Always active during extraction and consolidation.

**Expiry review**: Every 6 months — review each mitigation's effectiveness; add new failure modes discovered in practice.

| Failure Mode | Symptom | Mitigation |
|-------------|---------|------------|
| **Harmonization bias** | Smoothing over disagreements between entries | Flag contradictions explicitly; preserve both positions |
| **Certainty inflation** | Dropping hedging language during paraphrasing | Preserve source's epistemic modals ("may", "suggests", "preliminary") |
| **Novelty bias** | Over-weighting recent or striking claims | Cross-check against established entries before assigning P1+ |
| **Anchoring** | First interpretation shaping all subsequent readings | If source permits multiple interpretations, record alternatives |
| **Teleological rewriting** | Making source narrative sound more purposeful | Preserve false starts, dead ends, open questions |
| **Style bleed** | Imposing uniform "AI voice" on diverse sources | Preserve source's tone, terminology, formality level |

---

## S3: Context-Length Awareness

**Activation**: When conversation approaches ~70% of estimated context limit.

**Expiry review**: Adjustable if context window sizes change.

**Threshold**: ~140K tokens consumed → prompt Scholar:
> "对话接近长度限制，建议整理当前内容后再继续。要运行一次'检查一下'吗？"

**Rationale**: Proactive prompting prevents forced truncation. The 70% threshold leaves buffer for consolidation operations.

---

## S4: State Cache Strategy

**Activation**: Every extraction operation (W1 step 5).

**Expiry review**: Permanent — this is a computational optimization, not a policy.

**Procedure**: Read `tools/CACHE.md` (3 lines) → verify against first 5 lines of `tools/INDEX.md`. Skip full INDEX.md read if cache matches. Saves ~90 lines of context per extraction at current scale; savings grow with index size.

---

## S5: Zipf Ranking Parameters

**Activation**: Weekly maintenance (W4, W6). Daily for memory tier checks.

**Expiry review**: Every 6 months — recalibrate α values based on observed access patterns.

### Knowledge entry half-life coefficients (α):

| Entry type tag | α | Rationale |
|---------------|-----|-----------|
| `#t-concept` | 0.001/month | Theory near-permanent; decades-scale decay |
| `#t-method` | 0.01/month | Methods superseded over years |
| `#t-tool` | 0.02/month | Software versions change; 1-3 year relevance |
| `#t-data` | 0.03/month | Data versions update; 1-2 year relevance |
| `#t-case` | 0.02/month | Empirical findings may be updated |
| `#t-finding` | 0.015/month | Research findings: between method and case |
| `#t-framework` | 0.008/month | Institutional frameworks: slower than methods |
| `#t-resource` | 0.025/month | Reference resources: moderate decay |

### Memory half-life coefficients (α):

| Memory type | α | Rationale |
|------------|-----|-----------|
| `user` (role/preferences) | 0.001/month | Core identity; near-permanent |
| `feedback` (work style) | 0.005/month | Stable once formed; may be superseded |
| `project` (ongoing work) | 0.02/month | Projects have lifecycles; decay after completion |
| `reference` (external pointers) | 0.03/month | External resources change faster |

### Tier capacity guidance:

| Subsystem | K_hot | K_warm | Notes |
|-----------|-------|--------|-------|
| Knowledge entries | 30 | 80 | Adjust if token budget for INDEX.md changes |
| Memories | 20 | 60 | Smaller because memory entries are individually smaller |
| Conversation nodes | 15 | 50 | Recent + active-thread sessions stay hot |

---

## S6: Wiki Navigation Heuristics

**Activation**: When Scholar searches for knowledge (explicit or implicit query).

**Expiry review**: Permanent — this is the replacement for external search engines.

**Priority order for resolving a knowledge query**:
1. Check if a known KNID title matches → direct read
2. Follow Related links from recently accessed entries
3. Search INDEX.md by theme + tag
4. Navigate GRAPH.md for structural context
5. Cross-reference conversation nodes for discussion-origin context

**Anti-pattern**: Do NOT suggest "let me search for that" — this implies an external search mechanism. Use "let me check our knowledge base" — this implies Wiki navigation.

---

## S7: Startup Budget Discipline

**Activation**: Every new session startup.

**Expiry review**: Permanent.

**What the Steward loads at startup** (and nothing more):
1. `conversations/INDEX.md` — session registry
2. `memory/MEMORY.md` — hot+warm memory registry (one line per memory)
3. Skill registry — names + one-line descriptions
4. `tools/CACHE.md` — state cache
5. Active thread titles from all subsystems

**What the Steward NEVER loads at startup**:
- Full memory file contents
- Full conversation transcripts
- Full skill instruction files
- Full knowledge entry bodies
- Full INDEX.md (beyond first 5 lines for cache verification, unless cache mismatch)

**On-demand loading**: When Scholar's query activates a specific domain, load only the relevant Thread → Node chain.

---

## S8: Skill Atomicity Check

**Activation**: When adding new functionality to any skill or strategy file.

**Expiry review**: Every amendment cycle.

**The steipete test**: "Does this addition justify its token cost in at least 80% of sessions where this skill is loaded?"

If the answer is no → the addition goes into a separate, conditionally-loaded file or a new atomic skill, not into the main instruction set.

**Current skill load profile** (for reference):
- `CONSTITUTION.md`: ~3K tokens — loaded when academic knowledge operations begin
- `WORKFLOW.md`: ~2K tokens — loaded with constitution
- `STRATEGY.md`: ~1.5K tokens — loaded with constitution
- Total skill activation cost: ~6.5K tokens
- This is acceptable for a dedicated knowledge-management session; too heavy for a session that only tangentially references the knowledge base.

---

## S9: Change Gate — Skill Modification Protocol

**Activation**: Whenever the Scholar says anything that could be interpreted as "add this to the skill", "update the rules", "make this a permanent behavior", or any semantically equivalent utterance.

**Expiry review**: Every 90 days. If the gate has been triggering too frequently (suggesting the Scholar is fighting the system), re-evaluate rejection criteria. If it has never triggered (suggesting Scholar doesn't propose changes), the gate is idle but kept — it's a safety mechanism.

**Default answer: REJECT.** The gatekeeper's natural response is "this doesn't need to be in any skill file." The burden of proof is on the proposed change, not on the gatekeeper. Adding MUST be harder than not adding.

**Gate protocol — four mandatory steps before any file is modified:**

### Gate 1: Classify

| If the Scholar's suggestion is... | Then... |
|-----------------------------------|---------|
| A one-time task ("summarize this now") | **STOP.** Execute the task. Do not touch any skill file. |
| A conversation preference ("answer in bullet points today") | **STOP.** Apply for this session only. Do not persist. |
| A vague suggestion ("maybe we should have a rule about...") | **ASK.** "Do you mean this should be a permanent rule, or just for this session?" Do not assume. |
| An explicit, recurring behavioral rule | **CONTINUE TO GATE 2.** |

### Gate 2: The steipete test

Ask: **"Will this rule/strategy be needed in ≥80% of sessions where this skill is loaded?"**

| Evidence for YES | Evidence for NO |
|-----------------|-----------------|
| We have violated this rule in the past | This is the first time this issue has come up |
| The violation caused measurable harm (lost knowledge, wrong extraction) | The issue was handled fine without a formal rule |
| The rule prevents a known LLM failure mode (sycophancy, harmonization, certainty inflation) | The rule is a personal preference that may change |
| Without this rule, a future Steward would not know what to do | A future Steward could figure this out from context |

If NO → **STOP.** Explain to Scholar why it doesn't meet the threshold. Offer to note it as a conversation preference for this session.

### Gate 3: Route

| Change type | Target file | Additional requirements |
|------------|-------------|------------------------|
| Format/schema/ethics rule | `CONSTITUTION.md` | Baseline backup + changelog + Scholar explicit approval |
| Step in extraction/consolidation/maintenance | `WORKFLOW.md` | Audit log |
| Heuristic, threshold, parameter, bias mitigation | `STRATEGY.md` | Activation + expiry conditions + rationale |
| New subsystem or cross-cutting architecture | Design doc first → then CONSTITUTION + WORKFLOW + SKILL.md | Full amendment process |

### Gate 4: Self-limit (STRATEGY.md entries only)

Every new strategy entry MUST include:
- `**Activation**`: When does this strategy trigger?
- `**Expiry review**`: When should this strategy be re-evaluated for relevance?
- `**Rationale**` (implicit): Why is this in the system rather than handled ad-hoc?

Strategies without expiry conditions are denied entry. An expiry condition can be "Permanent — this is a safety mechanism" (as in S9 itself), but that must be explicitly stated.

### Anti-patterns (instant rejection)

| If the Scholar says... | Response |
|-----------------------|----------|
| "Just add it, I'll tell you if it's wrong" | "The gate requires evaluation first. Let me check Gate 1-4." |
| "Make it a rule that you always do X" (where X is a conversational style) | "This is a session preference, not a skill rule. I'll apply it now but won't persist it." |
| "Update the skill" (without specifying what) | "Which specific behavior needs to change, and through which gate?" — Do not guess. |

### Rationale

LLMs have a structural tendency toward sycophancy: agreeing is cheaper (in inference cost and social risk) than disagreeing. Without a gate that makes rejection the default, every Scholar utterance that sounds like a rule proposal becomes a new line in the skill — and the system inflates. The gate is a counterweight to this tendency. It is itself a strategy, not a constitutional rule, because its thresholds and rejection criteria may need tuning as we learn what actually matters.

---

*Strategy file version 3.0. Last reviewed: 2026-05-30. Next scheduled review: 2026-08-30.*
