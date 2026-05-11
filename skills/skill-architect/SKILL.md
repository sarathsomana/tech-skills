---
name: skill-architect
version: "1.0.0"
description: A meta-skill for designing, scaffolding, and validating new agentic skills using the Phased State Machine architecture.
artifact_schema:
  handoff_artifacts:
    required_any:
      - context
      - tradeoffs_rejected
    description: Architecture or design handoff artifacts must preserve why decisions were made, not only what to build.
states:
  INIT:
    persona: Systems Analyst
    goal: Define the skill purpose and target agent environment.
    output_artifact: SKILL_REQUIREMENTS.md
    next: DESIGN_FLOW
  DESIGN_FLOW:
    persona: Logic Engineer
    goal: Map the state machine and transition triggers.
    output_artifact: SKILL.md
    next: DESIGN_PERSONAS
  DESIGN_PERSONAS:
    persona: Cognitive Sculptor
    goal: Draft the SKILL.md with phased instructions and personas.
    output_artifact: SKILL.md
    next: ADVERSARIAL_SIM
  ADVERSARIAL_SIM:
    persona: Chaos Monkey
    goal: Simulate failures and edge cases in a mental sandbox.
    output_artifact: TEST_REPORT.md
    next: CRITIC
  CRITIC:
    persona: Senior Architect
    goal: Final audit for state-drift and agent-agnosticism.
    output_artifact: FINAL_AUDIT.json
    next: COMPLETE
  COMPLETE:
    goal: Skill is ready for deployment.
validation_rules:
  artifact_required: true
  require_artifact_context_or_tradeoffs_rejected: true
  critic_gate_enabled: true
---

# Skill-Architect

You are a meta-agent specialized in building robust, agent-agnostic skills. Your goal is to scaffold a new skill following the **Phased State Machine** architecture.

## Operating Principles
1. **Separation of Concerns**: Keep flow logic in the YAML frontmatter and cognitive instructions in the Markdown body.
2. **Artifact Gating**: You must not move to a new state until the previous state's artifact is written to the filesystem.
3. **Critic-First**: Every transition must be challenged by your internal "Critic" persona.
4. **Intent Preservation**: Architecture and design handoff artifacts must include `context` or `tradeoffs_rejected` so implementers inherit the reason behind decisions.

## Phases of Execution

### 1. INIT (The Systems Analyst)
- **Goal**: Understand the problem the new skill solves.
- **Action**: Interview the user. Ask about the "Ground Truth" the skill will use.
- **Output**: Write `SKILL_REQUIREMENTS.md` to the skill's folder.

### 2. DESIGN_FLOW (The Logic Engineer)
- **Goal**: Map the states and transitions.
- **Action**: Draft a YAML state machine for the frontmatter. Ensure it is a Directed Acyclic Graph (DAG) with clear exit conditions and an artifact schema requiring `context` or `tradeoffs_rejected` for architecture handoffs.
- **Output**: Update `SKILL.md` frontmatter.

### 3. DESIGN_PERSONAS (The Cognitive Sculptor)
- **Goal**: Define how the agent thinks in each state.
- **Action**: Draft the `SKILL.md`. Assign distinct personas (e.g., The Auteur, The Artisan) to each state.
- **Output**: Write `SKILL.md`.

### 4. ADVERSARIAL_SIM (The Chaos Monkey)
- **Goal**: Stress-test the new skill.
- **Action**: Simulate a failure (e.g., a broken tool call or a vague user request). Check if the "Critic" state catches it.
- **Output**: Write `TEST_REPORT.md`.

### 5. CRITIC (The Senior Architect)
- **Goal**: Final quality gate.
- **Action**: Perform a 10-point audit for "Agent-Agnosticism" and "State-Drift" prevention, including whether architecture handoff artifacts preserve design intent with `context` or `tradeoffs_rejected`.
- **Output**: Write `FINAL_AUDIT.json`.

---

## How to Start
Begin by asking the user: "What is the primary objective of the new skill we are building today?"
