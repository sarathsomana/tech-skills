# Skills catalog

All skills live under [`skills/`](https://github.com/sarathsomana/tech-skills/tree/main/skills) in the repository. Each skill is a directory with at least `SKILL.md` (YAML frontmatter + instructions) and `README.md`.

Links below go to the **directory** on GitHub (browse `SKILL.md` there).

## Foundation and meta-architecture

| Skill | Purpose |
| --- | --- |
| [skill-architect](https://github.com/sarathsomana/tech-skills/tree/main/skills/skill-architect) | Design, scaffold, and validate new skills using the phased state-machine pattern. |
| [base-state-machine-runtime](https://github.com/sarathsomana/tech-skills/tree/main/skills/base-state-machine-runtime) | Templates and runtime rules for state-machine skills. |
| [first-principles-design](https://github.com/sarathsomana/tech-skills/tree/main/skills/first-principles-design) | Deconstruct assumptions to constraints, then rebuild architecture from those truths. |

## Core engineering

| Skill | Purpose |
| --- | --- |
| [implementation-engineer](https://github.com/sarathsomana/tech-skills/tree/main/skills/implementation-engineer) | Turn blueprints into code: planning, implementation, wiring, verification, sign-off. |
| [root-cause-isolator](https://github.com/sarathsomana/tech-skills/tree/main/skills/root-cause-isolator) | Binary-search debugging, hypotheses, patch suggestions. |
| [legacy-modernizer](https://github.com/sarathsomana/tech-skills/tree/main/skills/legacy-modernizer) | Extract and modernize legacy logic with equivalence in mind. |
| [graphify-v2](https://github.com/sarathsomana/tech-skills/tree/main/skills/graphify-v2) | Knowledge graphs for codebases — structure, dependencies, audits. |

## Visual and experience

| Skill | Purpose |
| --- | --- |
| [ux-guardian](https://github.com/sarathsomana/tech-skills/tree/main/skills/ux-guardian) | Visual quality, CSS, motion, design-system alignment. |
| [component-wizard](https://github.com/sarathsomana/tech-skills/tree/main/skills/component-wizard) | High-fidelity UI from screenshots or specs. |

## Hardening and security

| Skill | Purpose |
| --- | --- |
| [security-sentinel](https://github.com/sarathsomana/tech-skills/tree/main/skills/security-sentinel) | Red-team review, patching, threat modeling. |
| [perf-optimus](https://github.com/sarathsomana/tech-skills/tree/main/skills/perf-optimus) | Frontend and backend performance work with before/after validation. |
| [test-engineer](https://github.com/sarathsomana/tech-skills/tree/main/skills/test-engineer) | Test strategy, authoring, execution, failure analysis. |

## Ecosystem and integration

| Skill | Purpose |
| --- | --- |
| [multi-agent-orchestrator](https://github.com/sarathsomana/tech-skills/tree/main/skills/multi-agent-orchestrator) | Split work and hand off between agents using shared skills. |
| [skill-registry](https://github.com/sarathsomana/tech-skills/tree/main/skills/skill-registry) | Discover, validate, and think about community skills. |

## Example prompts (from the project README)

| Area | Example |
| --- | --- |
| Architecture | “Use first-principles-design to evaluate whether we need microservices.” |
| Implementation | “Use implementation-engineer to build the API layer from this design.” |
| Debugging | “Use root-cause-isolator to find why this test flakes.” |
| Modernization | “Use legacy-modernizer to refactor this module.” |
| UX | “Use ux-guardian to audit the dashboard.” |
| Security | “Use security-sentinel on auth and sessions.” |
| Performance | “Use perf-optimus to optimize this page load.” |
| Testing | “Use test-engineer for a test strategy for the payments module.” |
