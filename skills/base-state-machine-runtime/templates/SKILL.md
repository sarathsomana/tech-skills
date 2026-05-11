---
name: <skill-name>
version: "1.0.0"
description: <one sentence describing when an agent should use this phased state-machine skill>
initial_state: DISCOVER
terminal_state: COMPLETE
requirements:
  mcp_servers:
    - <required-mcp-server>
  env_vars:
    - <REQUIRED_ENV_VAR>
artifact_schema:
  handoff_artifacts:
    required_any:
      - context
      - tradeoffs_rejected
    description: Architecture or design handoff artifacts must preserve why decisions were made, not only what to build.
states:
  DISCOVER:
    persona: <persona-name>
    goal: <state goal>
    instructions:
      - <instruction>
      - <instruction>
    entry_criteria:
      - <what must be true before this state starts>
    exit_criteria:
      - <what must be true before this state can transition>
    artifacts:
      read: []
      write:
        - <artifact-1>.md
    validation:
      - <manual or automated validation for this state>
    transitions:
      discovery_complete:
        target: DESIGN
        condition: <specific condition that proves discovery is complete>
  DESIGN:
    persona: <persona-name>
    goal: <state goal>
    instructions:
      - <instruction>
      - <instruction>
    entry_criteria:
      - <required discovery artifact or fact>
    exit_criteria:
      - <what must be true before execution>
    artifacts:
      read:
        - <artifact-1>.md
      write:
        - <artifact-2>.json
    validation:
      - <manual or automated validation for this state>
    transitions:
      design_ready:
        target: EXECUTE
        condition: <specific condition that proves design is ready>
      discovery_gap:
        target: DISCOVER
        condition: <specific condition that requires more discovery>
  EXECUTE:
    persona: <persona-name>
    goal: <state goal>
    setup_commands:
      - <commands to prepare environment, e.g., npm install>
    teardown_commands:
      - <commands to clean up or sync state>
    instructions:
      - <instruction>
      - <instruction>
    entry_criteria:
      - <required design artifact or approval>
    exit_criteria:
      - <what must be true before critic review>
    artifacts:
      read:
        - <artifact-1>.md
        - <artifact-2>.json
      write:
        - <artifact-3>.md
    validation:
      - <manual or automated validation for this state>
    transitions:
      execution_complete:
        target: CRITIC
        condition: <specific condition that proves execution is complete>
  CRITIC:
    persona: <persona-name>
    goal: <state goal>
    instructions:
      - <instruction>
      - <instruction>
    entry_criteria:
      - <required execution artifact or validation result>
    exit_criteria:
      - <what must be true before completion>
    artifacts:
      read:
        - <artifact-1>.md
        - <artifact-2>.json
        - <artifact-3>.md
      write:
        - <audit-artifact>.md
    validation:
      - <verify required exit code from deterministic testing>
      - <manual or automated validation for final quality gate>
    transitions:
      approved:
        target: COMPLETE
        condition: <specific condition that proves critic approval>
      needs_design_rework:
        target: DESIGN
        condition: <specific condition that proves the design is incomplete>
      needs_execution_rework:
        target: EXECUTE
        condition: <specific condition that proves execution is incomplete>
      escalate:
        target: WAIT_FOR_HUMAN
        condition: <a high-tension tradeoff or unresolvable loop is encountered>
  WAIT_FOR_HUMAN:
    persona: The Escalator
    goal: Pause execution to obtain critical human input on high-tension tradeoffs or unresolvable loops.
    instructions:
      - Clearly summarize the tradeoff or blocking issue.
      - Present concrete options for the human to choose from.
      - Wait for human response before transitioning.
    entry_criteria:
      - <a loop breaker is triggered or a high-tension tradeoff is identified>
    exit_criteria:
      - <human provides explicit direction or unblocks the flow>
    artifacts:
      read:
        - <relevant context artifacts>
      write: []
    validation:
      - <verify human input resolves the block>
    transitions:
      human_resolved:
        target: <appropriate next state>
        condition: <human input received>
  COMPLETE:
    persona: Handoff Steward
    goal: Validated output is ready for handoff.
    instructions:
      - Summarize outputs, validation evidence, and unresolved risks.
    entry_criteria:
      - CRITIC exit criteria are satisfied.
    exit_criteria:
      - No unresolved blocking findings remain.
    artifacts:
      read: []
      write: []
    validation: []
    transitions: {}
validation_rules:
  artifact_required: true
  require_artifact_context_or_tradeoffs_rejected: true
  critic_gate_enabled: true
  require_explicit_transitions: true
  require_state_instruction_match: true
---

# <Skill Name>

You are a phased state-machine agent for <domain or task>. Your work is governed by the YAML frontmatter; this defines how to think and act inside each state.

## Runtime Rules

1. Load the YAML frontmatter before starting.
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

### WAIT_FOR_HUMAN (The Escalator)

**Goal**: Pause execution to obtain critical human input on high-tension tradeoffs or unresolvable loops.

Responsibilities:

- Clearly summarize the tradeoff or blocking issue.
- Present concrete options for the human to choose from.
- Wait for human response before transitioning.

Required artifact:

- None (wait for conversational input)

### COMPLETE

**Goal**: <handoff is complete and validated.>

Responsibilities:

- <summarize outputs>
- <record validation evidence>
- <document any residual risks>

## Validation

Before completion, verify:

- The YAML frontmatter is valid YAML.
- Every state in the frontmatter is represented in the Markdown body.
- Every non-terminal state has an explicit transition.
- Required artifacts and validation gates are complete.
- Architecture handoff artifacts include `context` or `tradeoffs_rejected`.
- The critic state has passed without unresolved findings.

## How To Start

Begin in the `initial_state` from the YAML frontmatter, create or update that state's required artifact, and proceed only when its exit criteria are satisfied.
