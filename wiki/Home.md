# Tech Skills Wiki

Welcome to the **Tech Skills** wiki — structured, agent-agnostic skills that turn AI coding assistants into repeatable engineering workflows.

This wiki mirrors the main repository at [github.com/sarathsomana/tech-skills](https://github.com/sarathsomana/tech-skills) and is meant for contributors and users who prefer wiki navigation over the repo README alone.

## What is a skill?

A **skill** is a reusable instruction set (typically a single `SKILL.md` with YAML frontmatter) that guides an agent through **phased execution** — specialized personas, concrete artifacts between phases, and quality gates — instead of one-shot free-form generation.

## Quick links

| Topic | Page |
| --- | --- |
| Install or syndicate skills | [Installation](Installation) |
| Design principles (phased state machines) | [Philosophy and architecture](Philosophy-and-Architecture) |
| All skills, grouped by category | [Skills catalog](Skills-Catalog) |
| How to contribute and run local checks | [Contributing](Contributing) |
| CI jobs and validation | [CI, validation, and quality](CI-Validation-and-Quality) |
| Project roadmap | [Roadmap](Roadmap) |
| Publish updates to this GitHub Wiki | [Publishing the wiki](Publishing-the-Wiki) |

## One-line install (for agents)

Paste into your coding agent:

```text
Install skills from https://raw.githubusercontent.com/sarathsomana/tech-skills/main/INSTALL.md
```

The agent reads [`INSTALL.md`](https://github.com/sarathsomana/tech-skills/blob/main/INSTALL.md) in the repo, detects the environment, and symlinks skills into the correct discovery path.

## License

[MIT](https://github.com/sarathsomana/tech-skills/blob/main/LICENSE).
