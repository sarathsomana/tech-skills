# Tech Skills Roadmap

Our goal is to build a comprehensive library of agentic skills that follow the **Phased State Machine** architecture.

## Pre-Phase 1: Architecture Refinement Checklist
*Refining the Phased State Machine philosophy and format before building out the meta-architecture.*
- [x] **Artifact & Cognition**: Mandate `context`/`tradeoffs_rejected` in artifacts to prevent lossy compression.
- [x] **Artifact & Cognition**: Add a read-only "Scout" persona phase to generate a Context Map.
- [x] **Artifact & Cognition**: Route raw CLI `stderr` outputs as direct physical artifacts upon failure.
- [x] **State Machine Resilience**: Implement loop breakers (e.g., `max_retries: 3`) to prevent death spirals.
- [x] **State Machine Resilience**: Formalize Human-in-the-Loop (HITL) as a first-class `Wait-For-Human` state.
- [x] **State Machine Resilience**: Add environment setup/teardown hooks to state transitions.
- [x] **Execution Standards**: Gate state transitions on physical exit codes rather than LLM vibes.
- [x] **Execution Standards**: Implement graceful degradation and fail-fast for missing feature flags/MCPs.
- [x] **Single-File Format**: Migrate to a unified Markdown standard with YAML frontmatter (combining `flow.json` and `SKILL.md`).
- [x] **Single-File Format**: Enforce strict statelessness for the Markdown skill files.

## Phase 1: Foundation & Meta-Architecture
*Building the machine that builds the machines.*
- [x] **Skill-Architect**: A meta-skill for designing, scaffolding, and testing new skills using the JSON+MD pattern.
- [x] **Base State-Machine Runtime**: Standardized templates for `flow.json` and `SKILL.md`.

## Phase 2: Core Engineering Skills
*Robustness and reliability for production systems.*
- [x] **Implementation-Engineer**: Ingests architectural blueprints and executes phased coding, testing, and wiring of business logic.
- [ ] **Root-Cause-Isolator**: Binary-search style debugging and automated patch generation.
- [ ] **Legacy-Modernizer**: Logic extraction from legacy code and refactoring to modern standards.
- [ ] **Graphify (v2)**: Moving from simple visualization to a state-aware "Knowledge Graph" of the codebase.

## Phase 3: Visual & Experience (UX)
*Ensuring the "Wow" factor and premium design.*
- [ ] **UX-Guardian**: Aesthetic audits, CSS refactoring, and animation polishing.
- [ ] **Component-Wizard**: High-fidelity UI generation from screenshots or manifestos.

## Phase 4: Hardening & Security
*Production-readiness and safety.*
- [ ] **Security-Sentinel**: Red-team auditing, vulnerability patching, and threat modeling.
- [ ] **Perf-Optimus**: Automatic frontend and backend performance optimization.

## Phase 5: Ecosystem & Integration
*Making skills universal.*
- [ ] **Multi-Agent Orchestrator**: Logic for handovers between different agents using shared skills.
- [ ] **Skill-Registry**: A searchable index of community-contributed skills.
