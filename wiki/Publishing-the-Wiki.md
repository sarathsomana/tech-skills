# Publishing the wiki

GitHub Wikis are stored in a **separate Git repository**, not on the default `main` branch. The main project hosts a **copy** of wiki pages under [`wiki/`](https://github.com/sarathsomana/tech-skills/tree/main/wiki) so they can be reviewed in PRs. To update what appears on the GitHub Wiki tab, push that content to the wiki remote.

## Prerequisites

1. [Enable the wiki](https://docs.github.com/en/communities/documenting-your-project-with-wikis/about-wikis) on the repository (Settings → Features → Wikis), if it is not already on.
2. Permission to push to the wiki (repository write access).

## Clone the wiki repository

Replace `YOUR-ORG` / repo name if you fork; upstream is:

```bash
git clone https://github.com/sarathsomana/tech-skills.wiki.git
cd tech-skills.wiki
```

Or with SSH:

```bash
git clone git@github.com:sarathsomana/tech-skills.wiki.git
cd tech-skills.wiki
```

## Copy pages from the main repo

From your clone of **tech-skills** (main repo), copy Markdown files into the wiki clone. File names become wiki page names (e.g. `Home.md` → Home page, `Skills-Catalog.md` → “Skills catalog”).

Example (adjust paths):

```bash
# From tech-skills repo root, wiki repo sibling
cp -R wiki/*.md ../tech-skills.wiki/
cd ../tech-skills.wiki
git status
git add .
git commit -m "docs(wiki): sync pages from main repository"
git push
```

## Files in `wiki/`

| File | Role |
| --- | --- |
| `Home.md` | Default landing page for the wiki. |
| `_Sidebar.md` | Custom sidebar (navigation). |
| Other `*.md` | One page per file; use hyphenated names for multi-word titles. |

GitHub documents [wiki markup and links](https://docs.github.com/en/communities/documenting-your-project-with-wikis/editing-wiki-content); links like `[Installation](Installation)` match sibling pages.

## Keeping wiki and repo in sync

Recommended workflow:

1. Edit wiki Markdown under `wiki/` in the **main** repository and merge via PR.
2. After merge, a maintainer copies or syncs files to `tech-skills.wiki` and pushes (or automate with a small script / Action if you add one later).
