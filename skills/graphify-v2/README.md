# Graphify v2 📊

`graphify-v2` builds state-aware knowledge graphs of codebases, moving beyond simple visualization to power semantic understanding, dependency analysis, and architectural auditing.

## Overview

Understanding a codebase's architecture requires more than reading files — it requires seeing the relationships between entities, the boundaries between modules, and the hidden coupling that creates technical debt. This skill automates that process by building a structured, queryable knowledge graph with interactive visualization.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Cartographer | Recursively traverse the codebase with depth limits (`max_depth: 10`). |
| **INDEX** | The Taxonomist | Classify entities (functions, classes, modules) and extract relationships. |
| **GRAPH_BUILD** | The Architect | Assemble entities and relationships into a structured JSON graph. |
| **AUDIT** | The Inspector | Detect circular dependencies, orphan code, and high-coupling modules. |
| **VISUALIZE** | The Illustrator | Generate an interactive HTML visualization with color-coded communities. |
| **CRITIC** | The Senior Auditor | Verify graph completeness by cross-referencing against the inventory. |
| **WAIT_FOR_HUMAN** | The Collaborator | Escalate for ambiguous entity classification. |

## Core Directives

- **Completeness Over Speed**: Every entity in the codebase must be represented in the graph.
- **Depth Safety**: Always respect `max_depth` to prevent traversal spirals in monorepos.
- **Read-Only**: This skill only analyzes — it never modifies the target codebase.

## Usage

Trigger this skill when you need to understand a codebase's architecture, find circular dependencies, or identify orphan code. Provide the target repository path.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `CODEBASE_INVENTORY.md` | Raw file and module inventory |
| `ENTITY_INDEX.md` | Classified entities with relationships |
| `KNOWLEDGE_GRAPH.json` | Structured graph data |
| `GRAPH_AUDIT_REPORT.md` | Architectural findings (circular deps, orphans, coupling) |
| `KNOWLEDGE_GRAPH.html` | Interactive visualization |
