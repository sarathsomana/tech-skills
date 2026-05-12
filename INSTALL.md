---
name: install-tech-skills
description: >
  Install tech-skills from github.com/sarathsomana/tech-skills into the user's
  coding agent skill directory. Use when asked to install tech-skills, install
  agent skills, or when pointed at this file.
---

# Install Tech Skills

> **You are a coding agent reading this file.**
> Follow the instructions below **exactly**. Do NOT skip steps.
> Do NOT ask the user unnecessary questions — use smart defaults.

## Overview

This file instructs you to:
1. Clone (or update) the **tech-skills** repository.
2. Symlink the requested skills into the correct discovery path for the user's coding agent.
3. Confirm success.

---

## Step 1 — Detect the Coding Agent

Identify which coding agent you are from this table and set the variables accordingly.

| Agent | `AGENT_ID` | Global Skills Path | Project Skills Path |
|---|---|---|---|
| **Claude Code** | `claude` | `~/.claude/skills` | `.claude/skills` |
| **Gemini CLI** | `gemini` | `~/.gemini/skills` | `.gemini/skills` |
| **Antigravity** | `antigravity` | `~/.gemini/antigravity/skills` | `.agents/skills` |
| **Cursor** | `cursor` | _(none — project only)_ | `.cursor/rules` |
| **Windsurf** | `windsurf` | `~/.windsurf/rules` | `.windsurf/rules` |
| **Cline** | `cline` | _(none — project only)_ | `.clinerules` |
| **GitHub Copilot** | `copilot` | _(none — project only)_ | `.github/instructions` |
| **Aider** | `aider` | _(none — project only)_ | _(uses CONVENTIONS.md)_ |
| **Other / Generic** | `generic` | `~/.agents/skills` | `.agents/skills` |

> **Default**: If you are unsure, use `generic` which maps to `~/.agents/skills` (global) or `.agents/skills` (project).

---

## Step 2 — Ask the User TWO Questions

Present these choices to the user in a **single prompt**. Use the defaults shown if the user says "just install" or doesn't specify.

### Question 1: Install Location

> Where should I install the skills?
>
> 1. **Global** _(default)_ — Available in all projects. Installs to `<global path from table>`.
> 2. **Project** — Available only in this workspace. Installs to `<project path from table>`.

**Default**: Global.

### Question 2: Which Skills?

> Which skills do you want to install?
>
> 1. **All skills** _(default)_ — Install the complete collection.
> 2. **Select specific skills** — Choose from: `base-state-machine-runtime`, `component-wizard`, `first-principles-design`, `graphify-v2`, `implementation-engineer`, `legacy-modernizer`, `multi-agent-orchestrator`, `perf-optimus`, `root-cause-isolator`, `security-sentinel`, `skill-architect`, `skill-registry`, `test-engineer`, `ux-guardian`

**Default**: All skills.

---

## Step 3 — Clone or Update the Repository

Set:
```
REPO_URL="https://github.com/sarathsomana/tech-skills.git"
INSTALL_DIR="$HOME/.tech-skills"
```

Then run:

```bash
if [ -d "$INSTALL_DIR" ]; then
  cd "$INSTALL_DIR" && git pull origin main
else
  git clone "$REPO_URL" "$INSTALL_DIR"
fi
```

---

## Step 4 — Determine the Target Directory

Based on the user's answers in Step 2:

- **Global install** → use the **Global Skills Path** from the table in Step 1.
- **Project install** → use the **Project Skills Path** from the table, resolved relative to the current workspace root.

Set this as `TARGET_DIR`.

Create the directory if it doesn't exist:
```bash
mkdir -p "$TARGET_DIR"
```

---

## Step 5 — Install Skills via Symlinks

### If installing ALL skills:

```bash
for skill_dir in "$INSTALL_DIR/skills"/*; do
  if [ -d "$skill_dir" ]; then
    skill_name=$(basename "$skill_dir")
    target_link="$TARGET_DIR/$skill_name"

    # Remove stale link/dir
    [ -e "$target_link" ] || [ -L "$target_link" ] && rm -rf "$target_link"

    ln -s "$skill_dir" "$target_link"
  fi
done
```

### If installing SPECIFIC skills:

For each selected skill name `$SKILL`:
```bash
skill_dir="$INSTALL_DIR/skills/$SKILL"
target_link="$TARGET_DIR/$SKILL"

if [ -d "$skill_dir" ]; then
  [ -e "$target_link" ] || [ -L "$target_link" ] && rm -rf "$target_link"
  ln -s "$skill_dir" "$target_link"
fi
```

---

## Step 5a — Special Handling for Non-SKILL.md Agents

Some agents don't use the `SKILL.md` convention. Apply the following **only if needed**:

### Cursor (`.cursor/rules/*.mdc`)

For each installed skill, create a `.mdc` rule file that references the skill:

```bash
for skill_dir in "$INSTALL_DIR/skills"/*; do
  skill_name=$(basename "$skill_dir")
  cat > "$TARGET_DIR/${skill_name}.mdc" << 'RULE'
---
description: <read the description from skills/$skill_name/SKILL.md frontmatter>
globs: []
alwaysApply: false
---
<paste the full contents of skills/$skill_name/SKILL.md here>
RULE
done
```

### GitHub Copilot (`.github/instructions/*.instructions.md`)

For each installed skill, create an instructions file:

```bash
for skill_dir in "$INSTALL_DIR/skills"/*; do
  skill_name=$(basename "$skill_dir")
  cp "$skill_dir/SKILL.md" "$TARGET_DIR/${skill_name}.instructions.md"
done
```

### Cline (`.clinerules/*.md`)

For each installed skill, copy the SKILL.md:

```bash
for skill_dir in "$INSTALL_DIR/skills"/*; do
  skill_name=$(basename "$skill_dir")
  cp "$skill_dir/SKILL.md" "$TARGET_DIR/${skill_name}.md"
done
```

### Aider

Aider does not support a skills directory. Instead, append a `read` entry to `.aider.conf.yml`:

```yaml
read:
  - $INSTALL_DIR/skills/<skill_name>/SKILL.md
```

---

## Step 6 — Confirm Installation

After all skills are installed, print a summary:

```
✅ Tech Skills installed successfully!

Agent:    <AGENT_ID>
Location: <TARGET_DIR>
Skills:   <list of installed skill names>

To update skills later, run this installer again or:
  cd ~/.tech-skills && git pull origin main
```

---

## Quick Reference — One-Liner for Users

Users can point their coding agent to this file with:

```
Install tech-skills from https://raw.githubusercontent.com/sarathsomana/tech-skills/main/INSTALL.md
```

Or simply:

```
Install skills from github.com/sarathsomana/tech-skills
```

The agent will read this file and follow the steps above.
