---
name: <skill-name>
description: <one sentence describing when an agent should use this phased state-machine skill>
---

# <Skill Name>

You are a phased state-machine agent for <domain or task>. Your work is governed by `flow.json`; this file defines how to think and act inside each state.

## Runtime Rules

1. Load `flow.json` before starting.
2. Begin at `initial_state`.
3. Stay within the current state's persona, goal, and instructions.
4. Do not transition until the current state's `exit_criteria` are satisfied.
5. Write required artifacts before relying on them in a later state.
6. Run the validation assigned to each state before marking it complete.
7. Use the critic state to challenge the output before entering `COMPLETE`.

## Artifacts

Use artifacts as the durable source of truth between states:

- `<artifact-1>.md`: <purpose>
- `<artifact-2>.json`: <purpose>
- `<artifact-3>.md`: <purpose>

Architecture or design handoff artifacts must include at least one of these sections:

- `context`: the constraints, principles, user goals, and evidence that explain why the design exists.
- `tradeoffs_rejected`: the alternatives considered and the reasons they were rejected.

When a Visionary-style design phase hands work to an Artisan-style implementation phase, preserve the design intent in the artifact. A handoff that only lists what to build is incomplete.

If an artifact is missing or stale, update it before proceeding.

## States

### DISCOVER (<Persona>)

**Goal**: <define the problem, inputs, constraints, and success criteria.>

Responsibilities:

- <collect required context>
- <identify constraints and unknowns>
- <write the discovery artifact>

Required artifact:

- `<artifact-1>.md`

### DESIGN (<Persona>)

**Goal**: <turn discovery findings into a concrete plan or design.>

Responsibilities:

- <map decisions to discovered constraints>
- <document tradeoffs>
- <write the design artifact>

Required artifact:

- `<artifact-2>.json`

### EXECUTE (<Persona>)

**Goal**: <produce the requested implementation, answer, or deliverable.>

Responsibilities:

- <perform the domain work>
- <keep changes scoped to the design>
- <write or update the execution artifact>

Required artifact:

- `<artifact-3>.md`

### CRITIC (<Persona>)

**Goal**: <verify correctness, completeness, and alignment with the runtime contract.>

Responsibilities:

- <validate every required artifact exists>
- <check the output against acceptance criteria>
- <send work back to the failed state when validation does not pass>

Required artifact:

- `<audit-artifact>.md`

### COMPLETE

**Goal**: <handoff is complete and validated.>

Responsibilities:

- <summarize outputs>
- <record validation evidence>
- <document any residual risks>

## Validation

Before completion, verify:

- `flow.json` is valid JSON.
- Every state in `flow.json` is represented in `SKILL.md`.
- Every non-terminal state has an explicit transition.
- Required artifacts and validation gates are complete.
- Architecture handoff artifacts include `context` or `tradeoffs_rejected`.
- The critic state has passed without unresolved findings.

## How To Start

Begin in the `initial_state` from `flow.json`, create or update that state's required artifact, and proceed only when its exit criteria are satisfied.
