# Base State-Machine Runtime

Standardized templates and runtime rules for creating phased state-machine skills.

## Files

- `SKILL.md`: Runtime instructions for adapting and executing state-machine skill templates.
- `flow.json`: The runtime skill's own state machine.
- `templates/SKILL.md`: Canonical starter instructions for a generated skill.
- `templates/flow.json`: Canonical starter state graph for a generated skill.

## Template Contract

The templates separate deterministic transition logic from agent-facing cognitive instructions:

- `flow.json` defines states, transitions, artifacts, entry criteria, exit criteria, and validation gates.
- `SKILL.md` defines personas, responsibilities, artifact usage, validation guidance, and handoff behavior.

Every generated skill should keep a critic gate before `COMPLETE` and should write artifacts before transitioning to states that depend on them.
