# SKILL_REQUIREMENTS: UX-Guardian

## 1. Primary Objective
Execute aesthetic audits, CSS refactoring, and animation polishing to ensure a "Wow" factor and premium design, as specified in the Phase 3 roadmap.

## 2. Core Capabilities Needed
- **Aesthetic Audit (Scout)**: Analyze existing UI components, CSS stylesheets, and design tokens for inconsistencies and sub-optimal aesthetics.
- **CSS Refactoring**: Standardize styling, implement responsive layouts, and replace ad-hoc styles with utility classes or a cohesive design system.
- **Animation Polishing**: Introduce subtle, high-quality micro-animations and transitions to enhance user interaction.
- **Visual Validation**: Verify that UI changes align with modern premium design standards (e.g., color harmony, typography).

## 3. Ground Truth & Inputs
- **Inputs**: Target UI files (HTML, JSX, TSX, CSS), brand guidelines, or reference designs.
- **Environment**: File editing tools for updating stylesheets and components, and potentially browser testing capabilities (`run_command` with headless browsers) for visual checks.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `UX_AUDIT_REPORT.md`, `CSS_REFACTOR_PLAN.md`, `UI_PATCH.md`).
- **Loop Breakers & HITL**: Ability to pause for visual confirmation by the user (`Wait-For-Human`) before merging significant UI changes.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
