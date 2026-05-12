# SKILL_REQUIREMENTS: Root-Cause-Isolator

## 1. Primary Objective
Provide a robust, deterministic skill for "Binary-search style debugging and automated patch generation," as specified in linear issue NER-6 and the Phase 2 roadmap.

## 2. Core Capabilities Needed
- **Context Gathering (Scout)**: Safely parse logs, stack traces, and relevant code to understand the failing state.
- **Hypothesis Generation**: Formulate testable hypotheses about the root cause.
- **Binary Search Debugging (Isolation)**: Systematically insert probes (logs, assertions) and run test commands to cut the search space in half at each step.
- **Patch Generation & Validation**: Automatically write a fix and verify it via testing.
- **Resilience**: Implement strict loop breakers (max retries) and Human-in-the-Loop (HITL) fallback if the binary search gets stuck.

## 3. Ground Truth & Inputs
- **Inputs**: User bug report, stack trace, or failing test command.
- **Environment**: Must have execution capabilities (`run_command`) to run tests and linters, and file editing tools to insert probes and patches.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `CONTEXT_MAP.md`, `HYPOTHESIS_LIST.md`, `PATCH.md`).
- **Loop Breakers & HITL**: Hard limits on debugging steps; fallback to `Wait-For-Human`.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
