# SKILL_REQUIREMENTS: Multi-Agent-Orchestrator

## 1. Primary Objective
Manage the logic for handovers between different agents using shared skills, ensuring ecosystem universality, as specified in the Phase 5 roadmap.

## 2. Core Capabilities Needed
- **Task Decomposition (Scout)**: Break down a high-level user request into sub-tasks suitable for specific specialized agents/skills.
- **Agent Selection**: Identify and assign the best skill/agent for each sub-task based on capability registries.
- **State & Context Management**: Marshal inputs, outputs, and context between different agents seamlessly.
- **Execution Orchestration**: Oversee the parallel or sequential execution of the delegated tasks.
- **Conflict Resolution**: Mediate conflicting outputs or stalled tasks across agents.

## 3. Ground Truth & Inputs
- **Inputs**: Complex user intent, list of available agent skills, and global context.
- **Environment**: Ability to invoke other skills/agents, read/write shared context artifacts, and monitor execution states.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `DECOMPOSITION_PLAN.md`, `DELEGATION_MANIFEST.md`, `FINAL_ASSEMBLY.md`).
- **Loop Breakers & HITL**: Timeouts for unresponsive agents; escalation to `Wait-For-Human` for irresolvable conflicts.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
