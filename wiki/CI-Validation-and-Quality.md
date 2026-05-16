# CI, validation, and quality

GitHub Actions enforce consistency for every PR and for pushes to `main`. Workflow definitions are under [`.github/workflows/`](https://github.com/sarathsomana/tech-skills/tree/main/.github/workflows).

## Validate Skills (`validate-skills.yml`)

Runs on **push** and **pull_request** to `main`.

| Job | What it does |
| --- | --- |
| **YAML Frontmatter & Schema** | Node 20, `npm ci` in `.github/scripts`, then `node .github/scripts/validate-frontmatter.mjs`. |
| **Skill Structure** | `bash .github/scripts/validate-structure.sh` — directory layout and required files. |
| **Broken Links** | [lychee](https://github.com/lycheeverse/lychee) on `**/*.md` with excludes for some badge/shield URLs and `github.com/sarathsomana` / `raw.githubusercontent.com/sarathsomana` (see workflow for current args). |
| **Install Scripts** | ShellCheck on `install.sh` and `install-local.sh`. |

### Run the same checks locally

From the repository root:

```bash
cd .github/scripts && npm ci && cd ../..
node .github/scripts/validate-frontmatter.mjs
bash .github/scripts/validate-structure.sh
```

## Lint Markdown (`lint-markdown.yml`)

Runs on pull requests when Markdown or config under the workflow’s paths changes.

- Uses **markdownlint** (markdownlint-cli2) on:
  - `README.md`, `CONTRIBUTING.md`, `INSTALL.md`
  - `docs/*.md`
  - `skills/*/SKILL.md`, `skills/*/README.md`
- For PRs from the **same** repository (not forks), failed runs may auto-fix and push a formatting commit.

**Note:** Files under `wiki/` are not in the current markdownlint glob list; keep wiki pages tidy and follow the same style when possible.

## Permissions

- **Validate Skills**: `contents: read`.
- **Lint Markdown**: `contents: write` (for auto-fix commits on same-repo PRs).

For questions about a failing check, open an issue or comment on the PR with the failing job log.
