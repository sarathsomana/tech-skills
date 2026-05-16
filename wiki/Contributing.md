# Contributing

Contributions are welcome: new skills, improvements, and issues. The canonical guide is [CONTRIBUTING.md](https://github.com/sarathsomana/tech-skills/blob/main/CONTRIBUTING.md) in the repository.

## Ways to contribute

### New skill

1. Fork the repository.
2. Add `skills/<skill-name>/` (directory name must match the skill’s `name` in frontmatter).
3. Add **`SKILL.md`** with YAML frontmatter (`name`, `description`, and the instructions body).
4. Add **`README.md`** describing the skill for humans.
5. Optional: `evals/`, `SKILL_REQUIREMENTS.md`, tests — as appropriate for the skill.
6. **Update the root [README.md](https://github.com/sarathsomana/tech-skills/blob/main/README.md)** if you are adding a publicly listed skill.
7. Open a pull request against `main`.

### Improve an existing skill

Edit the relevant `SKILL.md`, `README.md`, or supporting files and open a PR.

### Issues

Use the issue templates when applicable:

- [Bug report](https://github.com/sarathsomana/tech-skills/blob/main/.github/ISSUE_TEMPLATE/bug_report.md)
- [New skill request](https://github.com/sarathsomana/tech-skills/blob/main/.github/ISSUE_TEMPLATE/new_skill_request.md)

### Community standards

- [Code of Conduct](https://github.com/sarathsomana/tech-skills/blob/main/CODE_OF_CONDUCT.md)

## Pull request checklist

1. Branch is up to date with `main`.
2. New skills appear in the README skill tables when they are part of the published catalog.
3. **Run local validation** (same checks as CI). See [CI, validation, and quality](CI-Validation-and-Quality).

### Required per skill (CI)

- `SKILL.md` with valid YAML frontmatter including **`name`** and **`description`**.
- **`name`** matches the directory name under `skills/`.
- `README.md` present in the skill directory.

## Updating this wiki

Wiki pages in the main repo live under [`wiki/`](https://github.com/sarathsomana/tech-skills/tree/main/wiki). After changing them, follow [Publishing the wiki](Publishing-the-Wiki) to push to GitHub’s wiki remote (wikis are a separate git repository).
