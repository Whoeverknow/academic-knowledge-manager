# Academic Knowledge Manager — GitHub Release Manifest

> 在全新电脑上重建此系统所需的最小文件集合。
> 详见 `tools/FRACTAL-WIKI-AUDIT.md` 了解各文件的分形编目角色。

---

## 一、必须纳入 Git 的文件（按目录树）

```
academic-knowledge-manager/
│
├── README.md                          # 安装说明（见下方模板）
├── .gitkeep                           # 确保空目录被 Git 追踪
│
├── skill/
│   └── SKILL.md                       # skill 入口（55 行轻量版）
│
├── tools/                             # 管理基础设施
│   ├── CONSTITUTION.md                # v3.0 不可变硬规则（~220 行）
│   ├── WORKFLOW.md                    # 固定操作流程（~120 行）
│   ├── STRATEGY.md                    # 启发式与策略（~120 行）
│   ├── INDEX.md                       # 知识条目主索引
│   ├── CACHE.md                       # 状态缓存（3 行）
│   ├── TAGS.md                        # 标签分类与关联图
│   ├── GRAPH.md                       # Mermaid 知识图谱
│   ├── SYSTEM-DESIGN-v3.0.md          # 系统架构设计文档
│   ├── CONVERSATION-WIKI-DESIGN.md    # 会话 Wiki 设计
│   ├── MEMORY-WIKI-DESIGN.md          # 记忆 Wiki 设计
│   ├── FRACTAL-WIKI-AUDIT.md          # 全文件分形审视
│   ├── analysis/
│   │   ├── daily/
│   │   │   └── .gitkeep               # 空目录占位
│   │   └── weekly/
│   │       └── .gitkeep
│   └── audit/
│       ├── INDEX.md                   # 审计注册表（初始空）
│       └── .gitkeep
│
├── knowledge/                         # 已发布知识条目
│   └── 2026/
│       └── 05.md                      # 20 条知识条目（~1,500 行）
│
├── work/                              # 草稿区
│   ├── INDEX.md                       # 知识条目草稿注册表
│   └── 2026/
│       └── 05.md                      # 3 条待处理知识草稿
│   # work/papers/ — 论文写作草稿，不纳入 Git（见 .gitignore）
│   # work/figures/ — 图表草稿，纳入 Git
│
├── conversations/                     # 会话 Wiki 编目（初始空）
│   ├── INDEX.md
│   └── .gitkeep
│
├── baseline/                          # 宪法历史快照
│   ├── README.md
│   └── CONSTITUTION-v2.9.md
│
└── scripts/
    └── init-directories.sh            # 一键创建空目录结构
```

---

## 二、不纳入 Git 的文件（运行时生成 / 个人信息）

| 文件/目录 | 原因 |
|----------|------|
| `memory/` 下所有文件 | 个人记忆，含用户偏好和项目信息 |
| `conversations/nodes/` 下所有文件 | 个人对话记录 |
| `conversations/transcripts/` 下所有文件 | 完整对话文本 |
| `tools/audit/logs/` 下所有文件 | 运行时审计日志 |
| `tools/audit/digests/` 下所有文件 | 个人操作摘要 |
| `tools/analysis/daily/` 下除 `.gitkeep` 外的文件 | 个人每日报告 |
| `tools/analysis/weekly/` 下除 `.gitkeep` 外的文件 | 个人每周报告 |
| `tools/analysis/daily/summaries/` | 运行时生成 |
| `tools/analysis/weekly/summaries/` | 运行时生成 |

---

## 三、README.md 模板

```markdown
# Academic Knowledge Manager v3.0

个人学术知识管理系统：提取 → 分层 → 降冷 → 检索。
基于分形 Wiki 编目 + 齐夫排名生命周期 + 上下文预算架构。

## 设计哲学

- **steipete 原则**: 每一个进入上下文的 token 必须为自己辩护
- **齐夫降冷**: 知识条目按引用排名竞争热索引位置，不按固定时间淘汰
- **文献半衰期**: 理论概念衰减极慢 (α=0.001)，工具教程衰减较快 (α=0.02)
- **分形编目**: Registry → Thread → Node 三层结构适用于所有增长型文件
- **启动预算**: ~8K tokens，全文按需加载

## 在 Cowork 中安装

1. 将此仓库克隆到本地
2. 在 Cowork 中，将仓库根目录挂载为工作区文件夹
3. 导入 skill：将 `skill/SKILL.md` 的内容保存为 Cowork skill（名称: `academic-knowledge-manager`）
4. 配置两个定时任务：
   - `daily-knowledge-review` — cron: `0 3 * * *`
   - `weekly-knowledge-analysis` — cron: `0 10 * * 6`
5. 运行 `bash scripts/init-directories.sh` 创建运行时目录

## 知识库结构

| 目录 | 用途 |
|------|------|
| `tools/` | 管理基础设施（宪法、工作流、策略、索引） |
| `knowledge/` | 已发布的知识条目 |
| `work/` | 待审查的草稿 |
| `conversations/` | 会话 Wiki 编目 |
| `baseline/` | 宪法历史版本 |

## 当前状态

- 已发布条目: 20
- 涉及主题: 地球-经济建模、自然资本核算、气候科学、IAM
- 待处理草稿: 3

## 系统架构

详见:
- `tools/SYSTEM-DESIGN-v3.0.md` — 总体架构
- `tools/FRACTAL-WIKI-AUDIT.md` — 分形编目普适性
- `tools/CONVERSATION-WIKI-DESIGN.md` — 会话继承设计
- `tools/MEMORY-WIKI-DESIGN.md` — 记忆管理设计

## 许可

[你的许可]
```

---

## 四、`scripts/init-directories.sh`

```bash
#!/bin/bash
# 创建运行时所需的空目录结构
# 在全新克隆后运行一次

BASE="${1:-.}"

mkdir -p "$BASE/conversations/nodes"
mkdir -p "$BASE/conversations/threads"
mkdir -p "$BASE/conversations/transcripts"
mkdir -p "$BASE/tools/audit/logs"
mkdir -p "$BASE/tools/audit/digests"
mkdir -p "$BASE/tools/analysis/daily/summaries"
mkdir -p "$BASE/tools/analysis/weekly/summaries"
mkdir -p "$BASE/tools/analysis/daily/2026/05"
mkdir -p "$BASE/tools/analysis/weekly/2026"
mkdir -p "$BASE/knowledge/figures"
mkdir -p "$BASE/work/figures"
mkdir -p "$BASE/baseline"

echo "Runtime directories created at $BASE"
```

---

## 五、`.gitignore`

```
# Personal data
memory/
conversations/nodes/
conversations/transcripts/
conversations/threads/

# Runtime logs
tools/audit/logs/
tools/audit/digests/

# Generated reports
tools/analysis/daily/20*/
tools/analysis/weekly/20*/
!tools/analysis/daily/.gitkeep
!tools/analysis/weekly/.gitkeep

# OS files
.DS_Store
Thumbs.db
```
