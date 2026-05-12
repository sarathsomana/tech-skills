# Root-Cause-Isolator 🔍

`root-cause-isolator` is a systematic debugging skill that uses binary-search style isolation to track down software defects and generate automated patches. It replaces ad-hoc debugging with a deterministic, artifact-driven workflow.

## Overview

Debugging is often a chaotic process of guessing and checking. This skill brings structure to it by treating the codebase as a search space and methodically narrowing down the root cause through hypothesis testing and probe insertion — all backed by physical evidence, not hunches.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Librarian | Build a read-only context map of the failing state (logs, stack traces, sub-systems). |
| **HYPOTHESIS_GENERATOR** | The Pragmatist | Formulate 3–5 testable hypotheses ranked by likelihood. |
| **ISOLATE** | The Artisan | Insert probes to binary-search the suspect code space. Bounded by `max_retries: 3`. |
| **GENERATE_PATCH** | The Artisan | Implement the permanent fix after root cause is confirmed. |
| **VALIDATOR** | The Critic | Run tests and validate the patch using physical exit codes (Exit Code 0). |
| **WAIT_FOR_HUMAN** | The Collaborator | Escalate gracefully when the loop breaker triggers or uncertainty is high. |

## Core Directives

- **Binary-Search, Not Brute-Force**: Systematically halve the suspect space with each probe.
- **Physical Evidence Only**: Validation relies on exit codes, not subjective assessment.
- **Loop Breaker**: Strict limit of 3 retries in the ISOLATE phase to prevent death spirals.

## Usage

Trigger this skill when you encounter a bug or failing test. Provide the error logs or stack trace, and the agent will systematically isolate the root cause and generate a patch.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `CONTEXT_MAP.md` | Detailed map of the failing state with suspected sub-systems |
| `HYPOTHESIS_LIST.md` | Ranked hypotheses with empirical probe results |
| `PATCH.md` | The permanent fix with rationale |
| `FINAL_REPORT.md` | Validation results on success |
