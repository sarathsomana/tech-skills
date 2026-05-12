# Skill Requirements: Test Engineer

## 1. Primary Objective
The `Test-Engineer` skill is a general-purpose, domain-agnostic testing workflow. It systematically analyzes a codebase to identify testing surfaces, designs a test strategy, writes tests, executes them, and diagnoses failures. It works across frontend (Playwright, Testing Library), backend (Jest, pytest, Go test), and API (contract testing, integration testing) domains — adapting its approach based on what the SCOUT phase discovers.

## 2. Context & "Ground Truth"
- **Context:** Belongs to Phase 4: Hardening & Security, alongside Security-Sentinel and Perf-Optimus.
- **Origin:** Identified via first-principles deconstruction as the only genuinely missing workflow in the frontend skills gap analysis. Testing is analytically distinct from implementation ("what could break?" vs "how do I build this?") but not domain-specific.
- **Ground Truth:** The skill relies on:
  1. The existing codebase and its structure (language, framework, existing test infrastructure).
  2. Architectural blueprints or requirements documents that define expected behavior.
  3. Existing test coverage data (if available) to avoid redundant work.

## 3. Core Problems Solved
- Codebases with no tests or inadequate test coverage.
- Tests that exist but don't catch real bugs (low-value assertion patterns).
- Missing testing strategy — no systematic approach to deciding *what* to test.
- Flaky test diagnosis — distinguishing real failures from environmental noise.
- Test-to-implementation drift — tests that no longer match the current behavior.

## 4. Key Execution Phases (Proposed)
1. **SCOUT (The Surveyor):** Analyze the codebase to identify testing surfaces, existing test infrastructure, and risk areas.
2. **STRATEGIZE (The Tactician):** Design a prioritized test plan covering unit, integration, E2E, and domain-specific testing needs.
3. **IMPLEMENT (The Test Author):** Write the tests according to the plan.
4. **EXECUTE (The Runner):** Run the test suites, capture results, and record pass/fail metrics.
5. **DIAGNOSE (The Investigator):** Analyze failures — distinguish real bugs from flaky tests, environmental issues, or test design flaws.
6. **CRITIC (The Quality Auditor):** Final quality gate on test coverage, assertion quality, and test maintainability.
