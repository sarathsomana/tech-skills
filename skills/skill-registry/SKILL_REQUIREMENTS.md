# SKILL_REQUIREMENTS: Skill-Registry

## 1. Primary Objective
Provide a searchable index of community-contributed skills to make skills universal and easily discoverable, as specified in the Phase 5 roadmap.

## 2. Core Capabilities Needed
- **Skill Discovery (Scout)**: Scan designated repositories or directories for valid skill definitions (Markdown + YAML).
- **Indexing & Validation**: Parse and validate skill metadata against the Phased State Machine schema.
- **Search & Retrieval**: Process natural language queries to recommend the most relevant skill for a given task.
- **Installation/Scaffolding**: Provide mechanisms to fetch, install, or update skills into the user's local environment.
- **Health Checks**: Periodically verify that indexed skills are compatible with the current runtime.

## 3. Ground Truth & Inputs
- **Inputs**: Search queries, local `.agents/skills` directories, or remote skill repositories.
- **Environment**: File reading/writing (`list_dir`, `view_file`, `write_to_file`) for managing the index, and potentially network capabilities for remote registries.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `REGISTRY_INDEX.json`, `SEARCH_RESULTS.md`, `INSTALLATION_LOG.md`).
- **Loop Breakers & HITL**: Handle broken or malicious skill definitions safely; `Wait-For-Human` for manual conflict resolution during installation.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
