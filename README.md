# 🧠 Academic Knowledge Manager v3.0

> **你的终身学术知识引擎** — AI 驱动的提取 · 分层 · 降冷 · 检索
> 不删任何东西。不让冷数据撑爆上下文。用齐夫定律决定什么留在热层。

---

## 💡 一句话

把论文、数据、想法扔给 AI → 结构化知识条目 → 热门自动靠前，冷门自然下沉。**永远不删，但也永不爆炸。**

---

## 🎯 核心理念

| 🔑 | 原则 | 含义 |
|----|------|------|
| ⚡ | **steipete 法则** | 每个 token 必须为自己辩护。启动只加载目录（~8K），正文按需 |
| 📊 | **齐夫降冷** | 引用排名定冷热，不是天数。五年老将常被引用 > 上月新兵无人问津 |
| ⏳ | **半衰期衰减** | 理论概念几乎永存（α=0.001），工具教程数年更新（α=0.02） |
| 🔁 | **分形编目** | Registry → Thread → Node，三层吃遍所有文件类型 |
| 🪦 | **只降冷不删除** | 活跃 → 温 → 冷 → 墓碑。全程可审计，全程可逆 |

---

## 🏗️ 三层架构

```
CONSTITUTION.md    →  不可变硬规则（格式、伦理、预算）
WORKFLOW.md        →  固定操作流程（提取、合并、维护）
STRATEGY.md        →  启发式策略（追问信号、偏差防护、变更闸门）
```

每个文件独立演进，不会一个膨胀拖垮全家。

---

## 📦 一键安装

```bash
git clone https://github.com/Whoeverknow/academic-knowledge-manager.git
cd academic-knowledge-manager
bash scripts/init-directories.sh
```

然后在 [Claude Cowork](https://claude.ai) 中挂载目录 + 导入 `skill/SKILL.md`。三步，三分钟。

---

## 🗣️ 对话即操作

| 你说 | 它做 |
|------|------|
| 🗂️ "记录下这个" | 一次性完整提取 → 结构化 → 存入草稿 |
| ✅ "检查一下" | 会话复盘 → 审核 → 晋升到知识库 |
| 🔍 "X 是什么" | Wiki 导航：索引 → 关联链 → 条目正文 |
| 📋 "最近做了什么" | 审计摘要 |

---

## 📚 当前知识库

**20 条已发布 + 3 条草稿**

🌍 地球-经济建模 · 🌿 自然资本核算 · 🌡️ 气候科学管线 · 🧮 Ramsey+自然资本 · 📐 CGE/IAM 方法论

涵盖 GTAP、MAgPIE、IEEM、GreenDICE、SCC 谱系、GWSP、CWON、Inclusive Wealth 等核心框架。

---

## 🧩 设计文档

| 📄 | 内容 |
|----|------|
| `SYSTEM-DESIGN-v3.0.md` | 总体架构 + 路线图 |
| `CONVERSATION-WIKI-DESIGN.md` | 50 场景 → 会话 Wiki 编目 |
| `MEMORY-WIKI-DESIGN.md` | 记忆齐夫分层 + 半衰期 |
| `FRACTAL-WIKI-AUDIT.md` | 15 种文件类型的分形审视 |

---

## 🔒 隐私设计

个人记忆、对话记录、审计日志、论文草稿全部 `.gitignore` — **仓库里只有规则和知识，没有你的私人数据。**

---

<p align="center">MIT · Built with Claude Cowork · 终身积累，永不爆炸</p>
