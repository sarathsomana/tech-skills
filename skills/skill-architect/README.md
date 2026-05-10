# Skill Architect 🛠️

`skill-architect` is a meta-skill designed to scaffold, architect, and validate new agentic skills following the **Phased State Machine** architecture. It ensures that new skills are robust, logic-driven, and agent-agnostic.

## Overview

Building an effective agentic skill requires more than just a prompt. It requires a structured flow of logic, distinct cognitive personas for different tasks, and rigorous validation. `skill-architect` guides you through this entire process.

## Architecture: Phased State Machine

## Phased Execution Model

| Phase | Persona | Objective | Output Artifact |
| :--- | :--- | :--- | :--- |
| **INIT** | Systems Analyst | Define skill purpose and requirements | `SKILL_REQUIREMENTS.md` |
| **DESIGN_FLOW** | Logic Engineer | Map state machine and transitions | `flow.json` |
| **DESIGN_PERSONAS** | Cognitive Sculptor | Draft instructions and personas | `SKILL.md` |
| **ADVERSARIAL_SIM** | Chaos Monkey | Simulate failures and edge cases | `TEST_REPORT.md` |
| **CRITIC** | Senior Architect | Final audit for agent-agnosticism | `FINAL_AUDIT.json` |

## Key Files

-   `SKILL.md`: Contains the cognitive instructions and persona definitions.
-   `flow.json`: Defines the state machine logic and transitions.

## Usage

To start building a new skill, trigger this skill and follow the instructions. The agent will begin by asking:

> "What is the primary objective of the new skill we are building today?"

## Operating Principles

-   **Separation of Concerns**: Keep flow logic in `flow.json` and cognitive instructions in `SKILL.md`.
-   **Artifact Gating**: Transitions only occur once the current phase's artifact is written.
-   **Critic-First**: Every design choice is challenged by an internal critic before moving forward.
