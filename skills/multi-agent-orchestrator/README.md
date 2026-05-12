# Multi-Agent Orchestrator 🎯

`multi-agent-orchestrator` decomposes complex user requests across multiple specialized skills, manages their execution, resolves dependencies, and assembles coherent final outputs. When agents conflict, it escalates to the human rather than guessing.

## Overview

Complex tasks often require capabilities from multiple skills working together. This skill acts as the conductor — breaking down a high-level request into sub-tasks, assigning each to the best-fit skill, monitoring execution, and integrating the results into a unified deliverable.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Analyst | Map available skill capabilities and understand the full scope of the request. |
| **DECOMPOSE** | The Strategist | Break the request into atomic sub-tasks with dependency ordering. |
| **DELEGATE** | The Dispatcher | Assign sub-tasks to specific skills and marshal input context. |
| **MONITOR** | The Controller | Oversee execution, manage dependencies, and handle failures/timeouts. |
| **ASSEMBLE** | The Integrator | Merge sub-task outputs into a coherent final result. |
| **CRITIC** | The Senior Orchestrator | Verify all sub-tasks completed and assembly is coherent. |
| **WAIT_FOR_HUMAN** | The Collaborator | Escalate for irresolvable conflicts or agent failures. |

## Core Directives

- **Dependency Awareness**: Never execute a sub-task before its dependencies are complete.
- **Escalation Over Guessing**: When agents produce conflicting outputs, escalate to the human.
- **Context Marshalling**: Each delegated sub-task receives all context it needs to execute independently.

## Usage

Trigger this skill when you have a complex task that spans multiple domains (e.g., "design, implement, and security-audit a new feature"). The orchestrator will coordinate the relevant skills.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `CAPABILITY_MAP.md` | Available skill capabilities and request analysis |
| `DECOMPOSITION_PLAN.md` | Sub-task breakdown with dependency graph |
| `DELEGATION_MANIFEST.md` | Skill assignments with marshalled context |
| `EXECUTION_LOG.md` | Execution status and failure handling log |
| `FINAL_ASSEMBLY.md` | Integrated output from all sub-tasks |
