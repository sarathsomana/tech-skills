# Tech Skills

Agent-agnostic tech skills for building expert software systems and AI agents.

## Objective

To build a reusable and agent-agnostic set of tech skills that can be used across multiple LLM agents to build expert software systems and AI agents.

## Philosophy & Future

This project is built on the principle of **Phased State Machines**—moving AI agents from free-form reasoning to structured, artifact-gated execution.

- **[Our Philosophy](./docs/PHILOSOPHY.md)**: Learn about Composite Personas, Artifact-Gated Handovers, and the Critic State.
- **[Development Roadmap](./docs/ROADMAP.md)**: Our 5-phase plan for building the next generation of agentic skills.

## Available Skills

- **[First Principles Design](./skills/first-principles-design/)**
  Interview the user relentlessly about a system design or architecture using first principles thinking. Break down assumptions to fundamental truths and build up from there.
- **[Skill-Architect](./skills/skill-architect/)**
  A meta-skill for designing, scaffolding, and validating new agentic skills using the Phased State Machine architecture.
- **[Base State-Machine Runtime](./skills/base-state-machine-runtime/)**
  Standardized templates and runtime rules for creating phased state-machine skills with `flow.json` and `SKILL.md`.
- **[Implementation Engineer](./skills/implementation-engineer/)**
  A general feature builder that ingests architectural blueprints and executes phased coding, testing, and wiring of business logic.

## How to Install and Use

These skills are designed to be easily pluggable into your AI agent environment. By default, the installer places skills in `~/.agents/skills/`.

### 1. Installation

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
