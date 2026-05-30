# Academic Knowledge Manager v3.0

个人学术知识全生命周期管理系统。不是笔记软件，不是 Zotero——是一个**与 AI 协同的知识提取、结构化、分层降冷和 Wiki 式检索的规则引擎**。

## 一句话

你把论文、数据、想法扔给 AI，它按宪法规定的格式提取为结构化知识条目，放入分形 Wiki 编目中。热门条目留在快速索引里，冷门条目按齐夫定律自然下沉。永远不会删除任何东西，但也不会让冷数据撑爆上下文。

## 设计哲学

- **steipete 原则**：每一个进入上下文的 token 必须为自己辩护。启动时只加载目录（~8K tokens），正文按需加载。
- **齐夫降冷**：知识条目按引用排名竞争热索引位置，不按固定时间淘汰。一个被反复引用的五年老条目比一个没人看的上月新条目更"热"。
- **文献半衰期**：理论概念几乎不衰减（α=0.001），工具教程数年衰减（α=0.02），数据源衰减最快（α=0.03）。
- **分形编目**：Registry → Thread → Node 三层结构普适于所有增长型文件——知识条目、会话记录、记忆文件、分析报告。
- **从不删除，只降冷**：每个条目有四态生命周期（活跃→温→冷→墓碑），全程可审计、可逆。

## 目录结构

```
/
├── tools/               管理基础设施
│   ├── CONSTITUTION.md    不可变硬规则（KNID 格式、伦理、预算）
│   ├── WORKFLOW.md        固定操作流程（提取、合并、维护）
│   ├── STRATEGY.md        启发式策略（每一条有激活/失效条件）
│   ├── INDEX.md           知识条目主索引
│   ├── GRAPH.md           Mermaid 知识图谱
│   ├── TAGS.md            标签分类与关联网络
│   └── CACHE.md           状态缓存
│
├── knowledge/           已发布的知识条目（按年/月分文件）
├── work/                草稿区（知识条目草稿 + 图表草稿）
├── conversations/       会话 Wiki 编目（节点~500 tok）
├── baseline/            宪法历史快照
└── scripts/             初始化脚本
```

## 在 Cowork 中安装（3 步）

**前提**：已安装 Claude Cowork 桌面应用。

### 1. 克隆仓库

```bash
git clone https://github.com/YOUR_USER/academic-knowledge-manager.git
cd academic-knowledge-manager
bash scripts/init-directories.sh
```

### 2. 挂载工作区

在 Cowork 中，将此仓库根目录挂载为工作区文件夹。

### 3. 导入 Skill

将 `skill/SKILL.md` 的内容保存为 Cowork skill：

- Skill 名称：`academic-knowledge-manager`
- 触发描述：`v3.0 知识库全生命周期管理`

### 可选：配置定时任务

在 Cowork 中创建两个定时任务：

| 任务 ID | 调度 | 用途 |
|---------|------|------|
| `daily-knowledge-review` | `0 3 * * *` | 每日自动差异分析 |
| `weekly-knowledge-analysis` | `0 10 * * 6` | 每周深度分析 + 齐夫排名 |

## 使用方式

在 Cowork 对话中：

| 你说 | 系统做 |
|------|--------|
| "记录下这个" + 文件/链接 | 一次性完整提取 → 结构化 → 存入草稿区 |
| "检查一下" | 会话复盘 → 草稿审核 → 晋升到知识库 |
| "X 是什么" | Wiki 导航：索引 → 关联链接 → 条目正文 |
| "最近做了什么" | 审计摘要 |

## 当前知识库内容

20 条已发布知识条目，覆盖：

- **地球-经济建模**：GTAP+ES 框架、MAgPIE-SEALS、IEEM+ESM 平台
- **自然资本核算**：WAVES/GPS 项目、CWON 财富报告、Inclusive Wealth 理论
- **气候科学管线**：ECS 气候敏感度、碳预算、MAGICC/IPCC 模拟管线、SCC 社会碳成本谱系
- **方法论与工具**：Ramsey+自然资本扩展、反馈回路分类学、GTAP/GEMPACK 替代方案、核算框架谱系

3 条待审核草稿：Inclusive Wealth 框架详解、数值建模实操指南、SNA/SEEA/HDI/GPI/IW/CWON 核算框架谱系。

## 系统架构

详细设计文档在 `tools/` 下：

| 文档 | 内容 |
|------|------|
| `SYSTEM-DESIGN-v3.0.md` | 总体架构、五原则、演进路线图 |
| `CONVERSATION-WIKI-DESIGN.md` | 会话 Wiki 编目（50 场景分析 → 树形目录设计） |
| `MEMORY-WIKI-DESIGN.md` | 记忆 Wiki 编目（齐夫分层 + 半衰期衰减） |
| `FRACTAL-WIKI-AUDIT.md` | 全文件分形审视（15 种文件类型的编目策略） |

## 不纳入仓库的内容

以下文件是个人运行时数据，已通过 `.gitignore` 排除：

- `memory/` — 个人记忆与偏好
- `conversations/nodes/` `transcripts/` `threads/` — 个人对话记录
- `tools/audit/logs/` `digests/` — 运行时审计
- `tools/analysis/daily/` `weekly/` — 自动生成的日报周报
- `work/papers/` — 论文写作草稿

## 许可

MIT
