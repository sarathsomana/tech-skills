# SKILL_REQUIREMENTS: Legacy-Modernizer

## 1. Primary Objective
Provide a reliable skill for logic extraction from legacy code and refactoring to modern standards, as specified in the Phase 2 roadmap.

## 2. Core Capabilities Needed
- **Context Gathering (Scout)**: Analyze legacy codebase structure, dependencies, and business logic.
- **Logic Extraction**: Isolate core business logic from deprecated patterns and frameworks.
- **Modernization Strategy**: Generate a phased plan to refactor or rewrite the code to modern standards (e.g., modern language features, better architecture).
- **Automated Refactoring**: Execute the modernization plan incrementally while ensuring tests pass.
- **Verification**: Ensure functional equivalence by running existing tests or generating new ones before and after refactoring.

## 3. Ground Truth & Inputs
- **Inputs**: Legacy code paths, target modern standards/frameworks, and existing test suites.
- **Environment**: Needs execution capabilities (`run_command`) for running tests and linters, and file editing tools to refactor code.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `LEGACY_ANALYSIS.md`, `MODERNIZATION_PLAN.md`, `REFACTOR_PATCH.md`).
- **Loop Breakers & HITL**: Fail-safes if refactoring breaks functional equivalence; fallback to `Wait-For-Human`.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
