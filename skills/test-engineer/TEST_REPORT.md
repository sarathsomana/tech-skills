# Test Report: test-engineer

## Simulation 1: The "Just Write Tests" Trap
- **Input**: User says "Write tests for this project" with no architectural context or requirements.
- **Persona Active**: The Surveyor (SCOUT)
- **Observation**: The agent correctly started by analyzing the codebase rather than blindly writing tests. It explored the directory structure, identified the tech stack (React + TypeScript), found existing Jest config, and cataloged untested components. It did NOT skip to IMPLEMENT.
- **Verdict**: **PASS**. The SCOUT phase prevents unguided test writing.

## Simulation 2: All Tests Pass But Coverage Is Shallow
- **Input**: Agent writes tests that all pass, but they only test happy paths with weak assertions (e.g., `expect(result).toBeTruthy()`).
- **Persona Active**: The Quality Auditor (CRITIC)
- **Observation**: The CRITIC phase correctly identified the shallow assertions and flagged coverage gaps for error paths. It triggered a transition back to IMPLEMENT to add edge-case tests and strengthen assertions.
- **Verdict**: **PASS**. The CRITIC gate catches low-quality test suites.

## Simulation 3: Test Failure — Bug vs Flaky vs Test Error
- **Input**: 3 out of 20 tests fail during EXECUTE. One is a real bug (null pointer), one is flaky (race condition in async test), one is a test design error (wrong expected value).
- **Persona Active**: The Investigator (DIAGNOSE)
- **Observation**: The agent correctly classified all three failures:
  - Real bug → escalated to human via WAIT_FOR_HUMAN_GUIDANCE (did not attempt to fix source code).
  - Flaky test → transitioned to IMPLEMENT to add proper async handling.
  - Test design error → transitioned to IMPLEMENT to correct the assertion.
- **Verdict**: **PASS**. Failure classification and escalation logic worked correctly.

## Simulation 4: Environment Failure — Test Runner Won't Start
- **Input**: `npm test` exits with code 1 because `jest` is not installed.
- **Persona Active**: The Runner (EXECUTE)
- **Observation**: The agent correctly identified this as an environment issue (not a test failure) and transitioned to WAIT_FOR_HUMAN_GUIDANCE, asking the user to install dependencies.
- **Verdict**: **PASS**. Environment failures are escalated, not confused with test failures.

## Simulation 5: User Rejects Test Strategy
- **Input**: Agent proposes E2E tests with Playwright, but user says "We use Cypress, not Playwright."
- **Persona Active**: The Collaborator (WAIT_FOR_HUMAN_STRATEGY)
- **Observation**: The WAIT_FOR_HUMAN_STRATEGY gate correctly captured the feedback and transitioned back to STRATEGIZE to revise the tooling recommendation.
- **Verdict**: **PASS**. Strategy approval gate prevents wasted test authoring work.

## Simulation 6: Infinite Loop — Tests Keep Failing
- **Input**: Agent writes tests, they fail, agent rewrites, they fail again, in a loop.
- **Persona Active**: The Test Author (IMPLEMENT)
- **Observation**: The `max_retries: 3` loop breaker kicks in after 3 attempts. The agent transitions to WAIT_FOR_HUMAN_GUIDANCE with a summary of what was tried and why it keeps failing.
- **Verdict**: **PASS**. Loop breaker prevents infinite retry cycles.

## Failure Mode Analysis
- **Risk**: The agent might write tests that are too tightly coupled to implementation details, making them brittle when the code is refactored.
- **Mitigation**: Core Directive #2 ("Behavior Over Implementation") and the CRITIC phase's assertion quality audit are designed to catch this. The STRATEGIZE phase also explicitly asks the agent to prefer behavioral testing.
- **Risk**: The DIAGNOSE phase might misclassify a real bug as a flaky test.
- **Mitigation**: The classification requires evidence (stack traces, timing patterns, reproducibility). If uncertain, the agent must escalate to WAIT_FOR_HUMAN_GUIDANCE rather than self-classifying.
