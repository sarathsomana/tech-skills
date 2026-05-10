# Tech Skills

Agent-agnostic tech skills for building expert software systems and AI agents.

## Objective

To build a reusable and agent-agnostic set of tech skills that can be used across multiple LLM agents to build expert software systems and AI agents.

## Available Skills

- **[First Principles Design](./skills/first-principles-design/)**
  Interview the user relentlessly about a system design or architecture using first principles thinking. Break down assumptions to fundamental truths and build up from there.

## How to Install and Use

These skills are designed to be easily pluggable into your AI agent environment.

### 1. Clone the repository

```bash
git clone https://github.com/sarathsomana/tech-skills.git
cd tech-skills
```

### 2. Install a Skill

To install a skill for your AI agent, you typically need to copy or symlink the skill directory to your agent's skills folder (e.g., `~/.agents/skills/` or `~/.claude/skills/`).

For example, to install the `first-principles-design` skill:

```bash
# Create your agent's skills directory if it doesn't exist
mkdir -p ~/.agents/skills/

# Symlink the skill (recommended for getting updates)
ln -s $(pwd)/skills/first-principles-design ~/.agents/skills/first-principles-design
```

### 3. Use the Skill

Once installed, you can trigger the skill by asking your AI agent. For example:

> "Let's do a first principles design for my new web application."

## Contributing

We welcome contributions! If you have a new skill idea or an improvement to an existing one, please open a pull request.