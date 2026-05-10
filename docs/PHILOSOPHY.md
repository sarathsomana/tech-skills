# The Tech Skills Philosophy: Phased State Machines

This document outlines the fundamental principles behind the skills in this repository. We believe that for AI agents to become expert systems builders, they must move beyond "free-form reasoning" into "constrained state execution."

## 1. Skills as Constrained State Machines
An agentic skill is not just a prompt; it is a **Program for Thought**. 
- **Soft vs. Hard States**: Traditional prompting is "soft" and prone to drift. Our skills use "hard" state transitions gated by physical artifacts in the workspace.
- **Deterministic Transitions**: A state change only occurs when specific conditions (outputs, tool results, or user approvals) are met. State transitions explicitly require physical assertions (e.g., `Exit Code 0`) rather than LLM vibes.

## 2. Composite Personas (Cognitive Temperament)
Instead of a single, static personality, each skill is composed of multiple **Personas** that trade off control based on the current phase:
- **The Scout (Librarian)**: A read-only phase using MCPs and file-system searches to generate a "Context Map" of the existing environment before planning begins.
- **The Visionary (Auteur)**: Focuses on high-level architecture and creative "Wow" factor.
- **The Pragmatist (Artisan)**: Focuses on implementation, efficiency, and robustness.
- **The Critic (Auditor)**: Acts as a "Hard Truth" validator, ensuring quality and alignment before allowing transitions.

## 3. Artifact-Gated Handovers
To prevent context leakage and "thinking drift," states are linked by **Artifacts**.
- Every state must produce a tangible output (Markdown, JSON, or Code).
- **No Lossy Compression**: Artifacts must include a `context` or `tradeoffs_rejected` section so that the *Why* behind the design is preserved alongside the *What*.
- **CLI Outputs as Artifacts**: If a tool fails during a validation state, the raw standard error (`stderr`) automatically becomes the exact physical artifact handed back.
- The subsequent state uses this artifact as its primary Source of Truth.

## 4. State Machine Resilience & Human-in-the-Loop
We prioritize **Self-Correction** and resilience against infinite loops:
- **Loop Breakers**: Strict retry limits (e.g., `max_retries: 3`) prevent "Artisan-Critic Death Spirals," triggering an escape hatch when exceeded.
- **Human-in-the-Loop (HITL)**: Human intervention is a first-class state (`Wait-For-Human`), triggered by high-tension tradeoffs or loop breakers.
- **Environment Hooks**: Lifecycle hooks ensure the environment is prepared (dependencies installed, setup complete) before state transitions into active coding.
- **Graceful Degradation**: Skills declare their physical requirements (e.g., specific MCPs) via feature flags and fail fast with clear errors if the host runner lacks them.

## 5. The Single-File Format (Markdown Architecture)
- **Unified Distributable Syntax**: Skills combine routing, requirements, and metadata in YAML Frontmatter, while cognitive personas and instructions use standard Markdown within a single `SKILL.md` file.
- **Strict Statelessness**: The Markdown skill holds zero memory. The Host system (IDE, CLI runner) is entirely responsible for injecting the current state, artifact history, and environment variables into the prompt at runtime.
