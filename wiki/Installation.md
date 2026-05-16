# Installation

Tech Skills can be installed **via your AI agent** (recommended), **shell script**, or **manually**. The source of truth in the repository is [`INSTALL.md`](https://raw.githubusercontent.com/sarathsomana/tech-skills/main/INSTALL.md).

## Option A — Via your coding agent (recommended)

Instruct the agent:

```text
Install skills from https://raw.githubusercontent.com/sarathsomana/tech-skills/main/INSTALL.md
```

The agent should:

1. Clone or update `https://github.com/sarathsomana/tech-skills.git` (default clone path: `~/.tech-skills`).
2. Ask for **scope** (global vs project) and **which skills** (all vs subset).
3. Create symlinks from `~/.tech-skills/skills/<name>` into the correct **discovery path** for your tool.

### Agent → install path (summary)

| Agent | Global path | Project path |
| --- | --- | --- |
| Claude Code | `~/.claude/skills` | `.claude/skills` |
| Gemini CLI | `~/.gemini/skills` | `.gemini/skills` |
| Antigravity | `~/.gemini/antigravity/skills` | `.agents/skills` |
| Cursor | _(none)_ | `.cursor/rules` |
| Windsurf | `~/.windsurf/rules` | `.windsurf/rules` |
| Cline | _(none)_ | `.clinerules` |
| GitHub Copilot | _(none)_ | `.github/instructions` |
| Other / generic | `~/.agents/skills` | `.agents/skills` |

Default when unsure: **generic** (`~/.agents/skills` or `.agents/skills`).

## Option B — `install.sh`

From the [install script](https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh) in the repo:

```bash
curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash
```

Agent-specific examples:

```bash
curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash -s -- --agent claude
curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash -s -- --agent gemini --scope project
```

Run `install.sh --help` for all flags. Supported `--agent` values include: `claude`, `gemini`, `antigravity`, `cursor`, `windsurf`, `cline`, `copilot`, `generic`.

## Option C — Manual clone and symlink

```bash
git clone https://github.com/sarathsomana/tech-skills.git ~/.tech-skills
ln -s ~/.tech-skills/skills/* ~/.agents/skills/
```

Adjust the target directory to match your agent (see table above).

## Local development (this repository)

If you cloned **tech-skills** and want skills available for testing inside the clone:

```bash
./install-local.sh
```

This symlinks `skills/` into `.agents/skills/` within the repository.

## Canonical skill IDs

When installing a subset, directory names under `skills/` are the skill IDs, for example: `base-state-machine-runtime`, `first-principles-design`, `implementation-engineer`, `root-cause-isolator`, and others listed on [Skills catalog](Skills-Catalog).
