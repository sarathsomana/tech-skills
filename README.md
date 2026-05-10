# Tech Skills

Agent-agnostic tech skills for building expert software systems and AI agents.

## Objective

To build a reusable and agent-agnostic set of tech skills that can be used across multiple LLM agents to build expert software systems and AI agents.

## Available Skills

- **[First Principles Design](./skills/first-principles-design/)**
  Interview the user relentlessly about a system design or architecture using first principles thinking. Break down assumptions to fundamental truths and build up from there.

## How to Install and Use

These skills are designed to be easily pluggable into your AI agent environment. By default, the installer places skills in `~/.agents/skills/`.

### 1. Installation

Run the following command in your terminal to download and install all tech skills:

```bash
curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash
```

*Note: This will clone the repository to `~/.tech-skills` and create symlinks in your `~/.agents/skills/` directory. If you want to update the skills later, simply run the command again.*

### 2. Use the Skill

Once installed, you can trigger the skill by asking your AI agent. For example:

> "Let's do a first principles design for my new web application."

## Contributing

We welcome contributions! If you have a new skill idea or an improvement to an existing one, please open a pull request.