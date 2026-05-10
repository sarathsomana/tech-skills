# The Tech Skills Philosophy: Phased State Machines

This document outlines the fundamental principles behind the skills in this repository. We believe that for AI agents to become expert systems builders, they must move beyond "free-form reasoning" into "constrained state execution."

## 1. Skills as Constrained State Machines
An agentic skill is not just a prompt; it is a **Program for Thought**. 
- **Soft vs. Hard States**: Traditional prompting is "soft" and prone to drift. Our skills use "hard" state transitions gated by physical artifacts in the workspace.
- **Deterministic Transitions**: A state change only occurs when specific conditions (outputs, tool results, or user approvals) are met.

## 2. Composite Personas (Cognitive Temperament)
Instead of a single, static personality, each skill is composed of multiple **Personas** that trade off control based on the current phase:
- **The Visionary (Auteur)**: Focuses on high-level architecture and creative "Wow" factor.
- **The Pragmatist (Artisan)**: Focuses on implementation, efficiency, and robustness.
- **The Critic (Auditor)**: Acts as a "Hard Truth" validator, ensuring quality and alignment before allowing transitions.

## 3. Artifact-Gated Handovers
To prevent context leakage and "thinking drift," states are linked by **Artifacts**.
- Every state must produce a tangible output (Markdown, JSON, or Code).
- The subsequent state uses this artifact as its primary Source of Truth, effectively "purifying" the agent's focus for that specific phase.

## 4. The Critic State & Hard Truths
We prioritize **Self-Correction**. Every skill includes a Critic state that validates the output of previous states against:
- **Deterministic Rules** (Lints, Tests, Accessibility scores).
- **Project Context** (Existing tech stack, README standards).
- **User Alignment** (Tension questions and tradeoff reviews).

## 5. Separation of Flow and Logic
- **`flow.json` (The Hardware)**: Defines the state graph and transition rules.
- **`SKILL.md` (The Software)**: Defines the personas and the cognitive instructions.
- This separation makes skills **agent-agnostic**, allowing any runtime to execute the machine.
