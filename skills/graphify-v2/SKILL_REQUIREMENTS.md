# SKILL_REQUIREMENTS: Graphify-v2

## 1. Primary Objective
Build a state-aware "Knowledge Graph" of the codebase, moving beyond simple visualization to power semantic understanding and context retrieval, as specified in the Phase 2 roadmap.

## 2. Core Capabilities Needed
- **Codebase Indexing (Scout)**: Traverse the codebase to identify entities, relationships, dependencies, and architectural boundaries.
- **Knowledge Graph Generation**: Map the codebase into a structured graph format (e.g., HTML, JSON) that represents these relationships.
- **State Awareness**: Track changes and dynamically update the knowledge graph as the codebase evolves.
- **Querying & Audit**: Provide a mechanism to query the graph for architectural insights, circular dependencies, and orphan code.
- **Reporting**: Generate an audit report and interactive visualizations.

## 3. Ground Truth & Inputs
- **Inputs**: Target repository path, specific file types, or sub-directories to index.
- **Environment**: File reading capabilities (`view_file`, `list_dir`, `grep_search`) to analyze the codebase, and file writing tools for graph artifacts.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `INDEX_PLAN.md`, `KNOWLEDGE_GRAPH.json`, `GRAPH_AUDIT_REPORT.md`).
- **Loop Breakers & HITL**: Hard limits on directory depth to prevent infinite indexing loops; fallback to `Wait-For-Human`.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
