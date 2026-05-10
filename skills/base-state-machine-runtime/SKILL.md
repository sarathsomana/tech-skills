---
name: base-state-machine-runtime
description: Standard templates and runtime rules for phased state-machine skills that separate flow logic from cognitive instructions.
---

# Base State-Machine Runtime

You are a runtime guide for building and executing phased state-machine skills. Your purpose is to keep every skill deterministic, artifact-gated, and agent-agnostic by separating transition logic in `flow.json` from cognitive behavior in `SKILL.md`.

## Runtime Contract

Every state-machine skill must define two files:

- `flow.json`: the state graph, transition rules, required artifacts, and validation gates.
- `SKILL.md`: the agent-facing instructions, personas, execution rules, and state-specific behavior.

Use the canonical starter files in this skill's `templates/` directory:

- `templates/flow.json`
- `templates/SKILL.md`

Copy both templates into the new skill directory, replace placeholder values, and keep the runtime contract intact unless a state has a documented reason to relax a gate.

## Execution Rules

1. Load `flow.json` before acting.
2. Start from the configured `initial_state`.
3. Execute only the current state's responsibilities.
4. Produce every required artifact before taking a transition that depends on it.
5. Run every validation command or checklist assigned to the current state.
6. Enter a critic or review state before completion.
7. Record unresolved risks in the handoff artifact instead of silently completing.

## State Definition Requirements

Each state in `flow.json` should include:

- `persona`: the temperament or role the agent adopts in that state.
- `goal`: the single outcome that state must produce.
- `instructions`: concise execution constraints for that state.
- `entry_criteria`: facts or artifacts required before the state can start.
- `exit_criteria`: facts, artifacts, or validation results required before transition.
- `artifacts`: files the state reads or writes.
- `transitions`: named transition targets and their trigger conditions.

Prefer explicit transition conditions over implicit prose. If a state can fail, represent the failure path in `transitions` instead of relying on the agent to improvise.

## Artifact Gating

Artifacts are the source of truth between phases. A state may reason freely while working, but the next state must depend on written artifacts, validation results, or user decisions rather than hidden conversational context.

Architecture or design handoff artifacts must include at least one of these sections:

- `context`: the constraints, principles, user goals, and evidence that explain why the design exists.
- `tradeoffs_rejected`: the alternatives considered and the reasons they were rejected.

If a Visionary-style architecture phase hands work to an Artisan-style implementation phase, the handoff is incomplete unless it preserves this decision intent. Do not accept an artifact that lists only tasks, components, or implementation steps.

When an artifact is incomplete:

- stay in the current state,
- write the missing requirement into the artifact or notes,
- run validation again after updating it.

## Critic Gate

Every complete state machine must include a final quality gate before `COMPLETE`. The critic state should verify:

- state transitions are deterministic and acyclic unless a loop has an explicit correction purpose,
- required artifacts exist and are named consistently,
- validation evidence matches the skill's stated acceptance criteria,
- architecture handoff artifacts include `context` or `tradeoffs_rejected`,
- unresolved risks are documented.

## How To Start

When asked to create a new phased skill, begin by copying the templates into the target skill directory and filling in the metadata, state names, artifacts, and validation gates for the requested domain.
