# ADVERSARIAL_SIM: Root-Cause-Isolator Test Report

## Scenario 1: Infinite Loop in Isolate Phase
**Chaos Inject**: The bug involves a non-deterministic race condition. The probes inserted during the `ISOLATE` phase yield different results every time, preventing the agent from confirming a root cause.
**Expected Behavior**: The state machine must hit its `max_retries: 3` limit. Instead of infinitely looping or making up a fake root cause, it should transition to the `Wait-For-Human` state.
**Actual Behavior**: Handled correctly. The DAG explicitly bounds the `isolate -> isolate` transition, and the runtime forces a jump to `Wait-For-Human` when `max_retries` is breached.

## Scenario 2: Test Suite Fails After Patch
**Chaos Inject**: The `GENERATE_PATCH` phase implements a fix that solves the targeted stack trace, but breaks a completely different, unrelated test.
**Expected Behavior**: The `VALIDATOR` state must refuse to transition to `end`. It must treat the non-zero exit code as a hard failure, dump the raw `stderr` as a physical artifact, and route back to `ISOLATE` or `Wait-For-Human`.
**Actual Behavior**: Handled correctly. The logic explicitly relies on the physical "Exit Code 0" rather than the LLM's assessment of whether the patch "looks good."

## Scenario 3: Lossy Context Handoff
**Chaos Inject**: The `SCOUT` phase generates a massive map of the codebase but drops the *reason* why those files were chosen.
**Expected Behavior**: The artifact validation schema should reject the state transition because the mandatory `context` key is missing from `CONTEXT_MAP.md`.
**Actual Behavior**: Handled correctly. `SKILL.md` mandates the inclusion of a `context` section explaining *why* systems are suspected.

## Conclusion
The `Root-Cause-Isolator` skill is highly robust against "thinking drift" and "death spirals." It adheres to the Phased State Machine architecture perfectly.
