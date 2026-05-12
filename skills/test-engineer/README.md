# Test Engineer

A general-purpose, domain-agnostic skill for systematic test engineering. Analyzes codebases, designs test strategies, writes tests, executes them, and diagnoses failures — adapting to any tech stack.

## When to Use

- A codebase has no tests or inadequate coverage
- You need a structured testing strategy (not just "write some tests")
- Tests are failing and you need to classify failures (real bugs vs flaky vs test design errors)
- You want to validate test quality (assertion strength, maintainability, coverage)

## Workflow

```
SCOUT → STRATEGIZE → [Human Approval] → IMPLEMENT → EXECUTE → DIAGNOSE* → CRITIC → COMPLETE
                                                         ↑                       |
                                                         └───── coverage gaps ───┘
```

*DIAGNOSE only activates when test failures are detected.

## Phases

| Phase | Persona | Purpose |
|---|---|---|
| **SCOUT** | The Surveyor | Map the testing landscape — tech stack, existing tests, risk areas |
| **STRATEGIZE** | The Tactician | Design a prioritized, layered test plan |
| **IMPLEMENT** | The Test Author | Write the tests according to the approved strategy |
| **EXECUTE** | The Runner | Run test suites, capture results and exit codes |
| **DIAGNOSE** | The Investigator | Classify failures: real bug, test flaw, flaky, or environment issue |
| **CRITIC** | The Quality Auditor | Final gate for coverage targets and assertion quality |

## Key Design Decisions

- **Domain-agnostic**: Adapts to frontend (Playwright, Testing Library), backend (Jest, pytest), or API (contract testing) based on SCOUT discovery.
- **Behavior over implementation**: Tests what code *does*, not *how* it does it.
- **Escalation, not fixing**: When tests reveal source code bugs, escalates to human rather than attempting fixes (hand off to Root-Cause-Isolator).
- **Strategy-first**: Requires human approval of the test strategy before writing any tests.

## Files

| File | Purpose |
|---|---|
| `SKILL.md` | Phased state machine definition with YAML frontmatter and cognitive instructions |
| `SKILL_REQUIREMENTS.md` | Requirements and ground truths established during INIT |
| `TEST_REPORT.md` | Adversarial simulation results (6 scenarios) |
| `FINAL_AUDIT.json` | 10-point architectural audit (10/10 pass) |
