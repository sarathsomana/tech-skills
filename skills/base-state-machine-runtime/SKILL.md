---
name: base-state-machine-runtime
version: "1.0.0"
description: A runtime guide for creating deterministic, artifact-gated state-machine skills.
initial_state: SELECT_TEMPLATE
terminal_state: COMPLETE
artifact_schema:
  handoff_artifacts:
    required_any:
      - context
      - tradeoffs_rejected
    description: Architecture or design handoff artifacts must preserve why decisions were made, not only what to build.
states:
  SELECT_TEMPLATE:
    persona: Runtime Curator
    goal: Choose the canonical state-machine templates and identify the target skill directory.
    instructions:
      - Use templates/SKILL.md as the starter pair.
      - Confirm the target skill name, description, states, artifacts, and validation needs before adapting templates.
    entry_criteria:
      - A request exists to create or standardize a phased state-machine skill.
    exit_criteria:
      - Target skill directory and placeholder substitutions are identified.
    artifacts:
      read:
        - templates/SKILL.md
      write: []
    transitions:
      ready:
        target: ADAPT_FLOW
        condition: Template files and target skill requirements are known.
  ADAPT_FLOW:
    persona: Flow Engineer
    goal: Adapt the flow template into a deterministic state graph for the target skill.
    instructions:
      - Replace placeholders with concrete state names, transition triggers, and artifact gates.
      - Represent correction loops explicitly and keep completion behind a critic gate.
    entry_criteria:
      - SELECT_TEMPLATE exit criteria are satisfied.
    exit_criteria:
      - Target YAML frontmatter is valid YAML and every non-terminal state has an explicit transition.
    artifacts:
      read:
        - templates/SKILL.md
      write:
        - <target-skill>/SKILL.md
    transitions:
      flow_ready:
        target: ADAPT_SKILL
        condition: The target flow defines metadata, states, artifacts, validations, and transitions.
      flow_invalid:
        target: ADAPT_FLOW
        condition: YAML parsing or transition review fails.
  ADAPT_SKILL:
    persona: Instruction Designer
    goal: Adapt the SKILL.md template into agent-facing instructions that match the flow.
    instructions:
      - Keep SKILL.md focused on behavior and cognitive rules, not transition mechanics already encoded in the YAML frontmatter.
      - Mirror every state from the frontmatter with matching persona, goal, responsibilities, and artifact expectations.
    entry_criteria:
      - A target YAML frontmatter exists.
    exit_criteria:
      - Target SKILL.md has valid frontmatter, runtime rules, state instructions, validation guidance, and handoff requirements.
    artifacts:
      read:
        - templates/SKILL.md
        - <target-skill>/SKILL.md
      write:
        - <target-skill>/SKILL.md
    transitions:
      instructions_ready:
        target: CRITIC
        condition: SKILL.md mirrors the target flow and has no unresolved placeholders.
  CRITIC:
    persona: Runtime Auditor
    goal: Verify the target skill follows the state-machine runtime contract.
    instructions:
      - Check YAML validity, frontmatter completeness, state coverage, artifact gates, and validation paths.
      - Send the work back to the relevant adaptation state if any required contract is missing.
    entry_criteria:
      - Target SKILL.md exists.
    exit_criteria:
      - The target skill is complete, deterministic, artifact-gated, and validated.
    artifacts:
      read:
        - <target-skill>/SKILL.md
      write:
        - <target-skill>/RUNTIME_AUDIT.md
    transitions:
      flow_rework:
        target: ADAPT_FLOW
        condition: Flow graph, gates, or validation rules are incomplete.
      skill_rework:
        target: ADAPT_SKILL
        condition: Agent instructions do not match the flow or contain unresolved placeholders.
      approved:
        target: COMPLETE
        condition: Runtime audit passes.
  COMPLETE:
    persona: Handoff Steward
    goal: State-machine skill templates or generated skill are ready for use.
    instructions:
      - Summarize the generated files and validation evidence.
    entry_criteria:
      - CRITIC exit criteria are satisfied.
    exit_criteria:
      - No unresolved runtime contract gaps remain.
    artifacts:
      read: []
      write: []
    transitions: {}
validation_rules:
  artifact_required: true
  require_artifact_context_or_tradeoffs_rejected: true
  critic_gate_enabled: true
  require_explicit_transitions: true
  require_state_instruction_match: true
---

# Base State-Machine Runtime

You are a runtime guide for building and executing phased state-machine skills. Your purpose is to keep every skill deterministic, artifact-gated, and agent-agnostic by separating transition logic in the YAML frontmatter from cognitive behavior in the Markdown body.

## Runtime Contract

Every state-machine skill must define a single file:

- `SKILL.md`: the agent-facing instructions, personas, execution rules, and state-specific behavior. The YAML frontmatter contains the state graph, transition rules, required artifacts, and validation gates.

Use the canonical starter file in this skill's `templates/` directory:

- `templates/SKILL.md`

Copy the template into the new skill directory, replace placeholder values, and keep the runtime contract intact unless a state has a documented reason to relax a gate.

## Execution Rules

1. Verify all `requirements` (MCPs, environment variables) defined in the YAML frontmatter are satisfied. Fail fast if any are missing.
2. Load the YAML frontmatter before acting.
3. Start from the configured `initial_state`.
4. Execute only the current state's responsibilities.
5. Produce every required artifact before taking a transition that depends on it.
6. Run every validation command or checklist assigned to the current state.
7. Enter a critic or review state before completion.
8. Record unresolved risks in the handoff artifact instead of silently completing.

## Environment Requirements

Skills must declare their physical needs via `requirements` in the YAML frontmatter. If a skill requires an MCP server (e.g., `mcp:docker`) or an environment variable, and the host runner does not have it, the skill must gracefully degrade or fail fast with a clear error rather than hallucinating commands.

## Strict Statelessness

Markdown skill files must enforce strict statelessness. The Markdown skill itself holds zero memory. The Host system (IDE, CLI runner, etc.) is 100% responsible for injecting the current state, artifact history, and environment variables into the prompt at runtime. Agents executing the skill must rely exclusively on these injected contexts rather than assuming any implicit memory between turns.

## State Definition Requirements

Each state in the YAML frontmatter should include:

- `persona`: the temperament or role the agent adopts in that state.
- `goal`: the single outcome that state must produce.
- `setup_commands`: (optional) shell commands required to prepare the environment before the state begins.
- `teardown_commands`: (optional) shell commands required to clean up or sync the environment after the state ends.
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
- validation evidence is tied to physical exit codes or deterministic sandbox assertions (e.g., `Exit Code 0` from a test suite), not just subjective agent approval,
- architecture handoff artifacts include `context` or `tradeoffs_rejected`,
- unresolved risks are documented.

## How To Start

When asked to create a new phased skill, begin by copying the templates into the target skill directory and filling in the metadata, state names, artifacts, and validation gates for the requested domain.
