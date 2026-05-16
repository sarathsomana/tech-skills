# Philosophy and architecture

Tech Skills treats each skill as a **constrained state machine**, not a long prompt. The full narrative lives in the repo as [Philosophy: Phased State Machines](https://github.com/sarathsomana/tech-skills/blob/main/docs/PHILOSOPHY.md). This page summarizes the ideas.

## Skills as state machines

- **Soft vs hard states**: Plain prompting drifts; skills use transitions gated by **physical artifacts** (files, test output, exit codes).
- **Deterministic transitions**: A phase advances when concrete conditions hold (e.g. tests pass, artifact exists), not when the model “feels done.”

## Composite personas

Phases rotate **personas** (cognitive roles) so one mode of thinking does not dominate:

- **Scout (librarian)**: Read-only discovery — maps context before design.
- **Visionary (auteur)**: Architecture and creative direction.
- **Pragmatist (artisan)**: Implementation and pragmatism.
- **Critic (auditor)**: Hard validation before the next phase.

## Artifact-gated handovers

- Every phase should produce a **tangible artifact** (Markdown, JSON, code, CLI output).
- Artifacts should preserve **why** as well as **what** (e.g. context, rejected tradeoffs) to avoid lossy compression between phases.
- Failed tooling can surface **stderr** as the artifact for the next step.

## Resilience and human-in-the-loop

- **Loop breakers**: Bounded retries (e.g. max retries) avoid “implement–audit” death spirals.
- **Human-in-the-loop**: Escalation is a first-class outcome when tradeoffs or blockers need a person.
- **Environment**: Hooks and feature flags document what the host must provide (MCP, tools); fail fast when missing.

## Single-file format

- **`SKILL.md`**: YAML frontmatter (metadata, routing) + Markdown body (instructions, phases).
- **Stateless file**: The skill file does not store runtime memory; the host injects state, history, and environment.

For deeper reading, see [docs/PHILOSOPHY.md](https://github.com/sarathsomana/tech-skills/blob/main/docs/PHILOSOPHY.md) in the repository.
