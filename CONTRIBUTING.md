# Contributing to Tech Skills

First off, thank you for considering contributing to Tech Skills! It's people like you that make building agentic workflows such a great experience.

## How to Contribute

### 1. Adding a New Skill
Have an idea for a new skill? Awesome!
- Fork the repository.
- Create a new directory under `skills/` for your skill (e.g., `skills/my-new-skill/`).
- Inside that directory, create a `SKILL.md` file. Ensure it includes YAML frontmatter (name, description) and detailed markdown instructions.
- If your skill has tests or benchmarks, add them to an `evals/` subdirectory.
- Submit a Pull Request!

### 2. Improving Existing Skills
Found a typo, an edge case the AI misses, or a way to make a skill more effective? 
- Submit a Pull Request updating the relevant `SKILL.md` or associated files.

### 3. Reporting Issues
If you encounter a bug or have a feature request, please use the GitHub Issue Tracker. Check if a similar issue already exists before opening a new one.

## Pull Request Process

1. Ensure your branch is up-to-date with the `main` branch.
2. Update the `README.md` if you are adding a new skill.
3. Run the validation checks locally (see below).
4. Your PR will be reviewed by maintainers, who may request changes.
5. Once approved, your PR will be merged!

## Validation

All PRs are automatically checked by CI. You can run the same checks locally:

```bash
# Validate YAML frontmatter and schema
cd .github/scripts && npm ci && cd ../..
node .github/scripts/validate-frontmatter.mjs

# Validate skill directory structure
bash .github/scripts/validate-structure.sh
```

CI also runs markdown linting and broken-link detection. Every skill must have:

- A `SKILL.md` with valid YAML frontmatter (including `name` and `description`)
- A `README.md` describing the skill
- A `name` field that matches the directory name
