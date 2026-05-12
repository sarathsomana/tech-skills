# Tech Skills

Agent-agnostic tech skills for building expert software systems and AI agents.

## Objective

To build a reusable and agent-agnostic set of tech skills that can be used across multiple LLM agents to build expert software systems and AI agents.

## Philosophy & Future

This project is built on the principle of **Phased State Machines**—moving AI agents from free-form reasoning to structured, artifact-gated execution.

- **[Our Philosophy](./docs/PHILOSOPHY.md)**: Learn about Composite Personas, Artifact-Gated Handovers, and the Critic State.
- **[Development Roadmap](./docs/ROADMAP.md)**: Our 5-phase plan for building the next generation of agentic skills.

## Available Skills

### Foundation & Meta-Architecture
- **[Skill-Architect](./skills/skill-architect/)**
  A meta-skill for designing, scaffolding, and validating new agentic skills using the Phased State Machine architecture.
- **[Base State-Machine Runtime](./skills/base-state-machine-runtime/)**
  Standardized templates and runtime rules for creating phased state-machine skills.
- **[First Principles Design](./skills/first-principles-design/)**
  Architectural deconstruction and reconstruction using first-principles thinking. Challenges assumptions until fundamental truths are reached.

### Core Engineering
- **[Implementation Engineer](./skills/implementation-engineer/)**
  Ingests architectural blueprints and executes phased coding, testing, and wiring of business logic.
- **[Root-Cause-Isolator](./skills/root-cause-isolator/)**
  Binary-search style debugging and automated patch generation with artifact-gated hypothesis testing.
- **[Legacy-Modernizer](./skills/legacy-modernizer/)**
  Logic extraction from legacy code and incremental refactoring to modern standards with functional equivalence guarantees.
- **[Graphify v2](./skills/graphify-v2/)**
  State-aware knowledge graph generation for codebase semantic understanding, dependency analysis, and architectural auditing.

### Visual & Experience (UX)
- **[UX-Guardian](./skills/ux-guardian/)**
  Aesthetic audits, CSS refactoring, and animation polishing for premium design quality.
- **[Component-Wizard](./skills/component-wizard/)**
  High-fidelity UI component generation from screenshots or design manifestos.

### Hardening & Security
- **[Security-Sentinel](./skills/security-sentinel/)**
  Red-team auditing, vulnerability patching, and threat modeling for production-readiness.
- **[Perf-Optimus](./skills/perf-optimus/)**
  Automatic frontend and backend performance optimization with empirical before/after validation.
- **[Test-Engineer](./skills/test-engineer/)**
  General-purpose, domain-agnostic test strategy, authoring, execution, and failure diagnosis.

### Ecosystem & Integration
- **[Multi-Agent Orchestrator](./skills/multi-agent-orchestrator/)**
  Task decomposition and handover logic between different agents using shared skills.
- **[Skill-Registry](./skills/skill-registry/)**
  Searchable index of community-contributed skills for discovery, validation, and installation.

## How to Install and Use

These skills are designed to be easily pluggable into your AI agent environment.

### Option A: Install via Your AI Agent (Recommended)

Just paste this into your coding agent (Claude Code, Gemini CLI, Antigravity, Cursor, Windsurf, Cline, etc.):

```
Install skills from https://raw.githubusercontent.com/sarathsomana/tech-skills/main/INSTALL.md
```

The agent will read the instructions, detect your environment, and install the skills into the correct directory automatically. It supports both **global** and **project-level** installation.

> See [`INSTALL.md`](./INSTALL.md) for the full agent-readable installation spec.

### Option B: Install via Shell Script

Run the following command in your terminal to download and install all tech skills globally:

```bash
curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash
```

*Note: This will clone the repository to `~/.tech-skills` and create symlinks in your `~/.agents/skills/` directory. If you want to update the skills later, simply run the command again.*

#### Local Installation (For Development)

If you have cloned the repository and want to install the skills locally in the repository's `.agents` workspace folder, run:

```bash
./install-local.sh
```

*Note: This creates symlinks from the local `skills/` directory to `.agents/skills/` in the same directory, which is useful when testing modifications to the skills.*

### 2. Use the Skill

Once installed, you can trigger the skill by asking your AI agent. For example:

> "Let's do a first principles design for my new web application."

## Contributing

We welcome contributions! If you have a new skill idea or an improvement to an existing one, please open a pull request.
