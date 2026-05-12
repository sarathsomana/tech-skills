# Skill Registry 📚

`skill-registry` provides a searchable index of community-contributed skills for discovery, validation, and installation. It ensures only schema-compliant, safe skills are indexed and installed.

## Overview

As the skill ecosystem grows, finding and installing the right skill becomes a discovery problem. This skill automates it — scanning sources for skill definitions, validating them against the Phased State Machine schema, building a searchable index, and handling safe installation into the user's environment.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Curator | Discover and catalog available skill definitions from designated sources. |
| **VALIDATE** | The Inspector | Parse and validate skills against the Phased State Machine schema. Flag malicious or broken definitions. |
| **INDEX** | The Librarian | Build a searchable JSON registry index from validated skills. |
| **SEARCH** | The Concierge | Process natural language queries to recommend relevant skills. |
| **INSTALL** | The Installer | Fetch, validate, and install selected skills into `~/.agents/skills/`. |
| **CRITIC** | The Registry Auditor | Verify index integrity and installation correctness. |
| **WAIT_FOR_HUMAN** | The Collaborator | Escalate for version conflicts or when no valid skills are found. |

## Core Directives

- **Safety First**: Never install a skill that fails validation or has security concerns without explicit human approval.
- **Schema Compliance**: Only index skills that conform to the Phased State Machine schema.
- **Transparency**: Always explain why a skill was recommended or rejected.

## Usage

Trigger this skill when you need to find, validate, or install a community skill. Provide a search query or a directory/repository to scan.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `DISCOVERY_LOG.md` | Catalog of discovered skill definitions |
| `VALIDATION_REPORT.md` | Schema compliance and security assessment |
| `REGISTRY_INDEX.json` | Searchable index of validated skills |
| `SEARCH_RESULTS.md` | Ranked recommendations for user queries |
| `INSTALLATION_LOG.md` | Installation record with integrity verification |
