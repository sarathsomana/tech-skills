# Legacy Modernizer 🏗️

`legacy-modernizer` extracts business logic from legacy codebases and incrementally refactors them to modern standards. It guarantees functional equivalence at every step — the modernized code must produce identical outputs to the original.

## Overview

Legacy modernization often fails because teams attempt "big bang" rewrites that break behavior. This skill enforces an incremental, test-gated approach: analyze first, plan carefully, refactor step-by-step, and validate continuously.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Archaeologist | Read-only inventory of legacy patterns, deprecated APIs, and embedded business logic. |
| **STRATEGIZE** | The Strategist | Create a dependency-ordered, incremental modernization plan. |
| **REFACTOR** | The Artisan | Apply modernization step-by-step, running tests after each change. |
| **VALIDATE** | The Verifier | Confirm functional equivalence via physical exit codes (Exit Code 0). |
| **CRITIC** | The Senior Reviewer | Final quality gate — verify all legacy patterns have been addressed. |
| **WAIT_FOR_HUMAN** | The Collaborator | Escalate when functional equivalence cannot be maintained. |

## Core Directives

- **Functional Equivalence First**: Modernized code must produce identical outputs for all known inputs.
- **Incremental Safety**: Never attempt a "big bang" rewrite. Each step is independently verifiable.
- **Test-Gated Transitions**: Every refactoring step must pass the existing test suite before proceeding.

## Usage

Trigger this skill when you have a legacy codebase that needs modernization. Provide the target code paths, desired modern standards, and existing test suites.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `LEGACY_ANALYSIS.md` | Full inventory of legacy patterns and business logic |
| `MODERNIZATION_PLAN.md` | Phased refactoring plan with tradeoffs documented |
| `REFACTOR_LOG.md` | Step-by-step log of changes and outcomes |
| `VALIDATION_REPORT.md` | Test results confirming functional equivalence |
| `MODERNIZATION_SUMMARY.md` | Final assessment and unresolved risks |
