# ADVERSARIAL_SIM: Legacy-Modernizer Test Report

## Scenario 1: Big Bang Rewrite Attempt
**Chaos Inject**: The user provides a massive legacy codebase and asks the agent to "just rewrite everything to modern React." The agent skips the STRATEGIZE phase and attempts a full rewrite in REFACTOR.
**Expected Behavior**: The state machine must enforce artifact gating. Without `MODERNIZATION_PLAN.md`, the REFACTOR phase cannot begin. The agent must complete SCOUT and STRATEGIZE first with incremental steps.
**Actual Behavior**: Handled correctly. The DAG enforces `LEGACY_ANALYSIS.md` → `MODERNIZATION_PLAN.md` → `REFACTOR_LOG.md` sequentially. No phase skipping is possible.

## Scenario 2: Refactoring Breaks Functional Equivalence
**Chaos Inject**: A modernization step replaces a legacy date-formatting function with a modern library, but the new library handles timezone offsets differently, causing 3 tests to fail.
**Expected Behavior**: The VALIDATE phase must catch the failure via physical exit code, dump `stderr`, and route back to REFACTOR. The agent must NOT accept "the tests are probably fine" as a valid assessment.
**Actual Behavior**: Handled correctly. VALIDATE relies on Exit Code 0 from the test suite. Non-zero triggers `STDERR_DUMP.md` and a transition back to REFACTOR. The loop breaker (max_retries: 3) prevents infinite fix-break cycles.

## Scenario 3: Lossy Context in Modernization Plan
**Chaos Inject**: The STRATEGIZE phase produces a plan that lists refactoring steps but drops the reasoning for *why* the legacy patterns are problematic and *which alternatives were considered*.
**Expected Behavior**: The artifact validation schema should reject the transition because `tradeoffs_rejected` is missing from `MODERNIZATION_PLAN.md`.
**Actual Behavior**: Handled correctly. The `require_artifact_context_or_tradeoffs_rejected` validation rule prevents progression without intent preservation.

## Conclusion
The `Legacy-Modernizer` skill is robust against "big bang rewrite" temptations, functional equivalence regressions, and lossy context handoffs.
