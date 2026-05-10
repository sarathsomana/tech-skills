# First Principles Design 🧠

`first-principles-design` is a high-rigor architectural review skill that deconstructs complex systems into their fundamental truths. It ruthlessly challenges assumptions and rebuilds designs from the ground up to ensure they are logically sound and pragmatically grounded.

## Overview

Most architectural decisions are based on "best practices" or "industry standards" without questioning *why* they apply to a specific problem. This skill breaks that cycle by applying first-principles thinking through a structured, phased approach.

## Architectural Review Phases

| Phase | Persona | Goal | Logic |
| :--- | :--- | :--- | :--- |
| **DECONSTRUCT** | The Grill Master | Challenge every assumption | Ask "Why?" until fundamental truths are reached. |
| **RECONSTRUCT** | The Pragmatist | Build design from truths | Map architecture directly to identified constraints. |
| **VALIDATE** | The Architect | Stress-test for consistency | If new assumptions appear, return to **DECONSTRUCT**. |
| **SIGN_OFF** | The Mediator | Formal user approval | Summarize truths and obtain sign-off. |
| **GENERATE_ARTIFACT** | The Scribe | Document the session | Create final architecture markdown artifact. |

## Core Directives

-   **Challenge Everything**: No "standard" is accepted without justification.
-   **Pragmatic Grounding**: Recommends standard solutions only when they are the most efficient way to satisfy a fundamental truth.
-   **One Question at a Time**: Ensures deep, focused exploration of every branch of the design.

## Usage

Trigger this skill when you need a deep architectural review or when designing a new system from scratch. The agent will lead the conversation through the defined phases, ensuring a rigorous output.

## Key Artifacts Produced

-   `SKILL_REQUIREMENTS.md`: Initial ground truth requirements.
-   `TEST_REPORT.md`: Results of adversarial simulation.
-   `FINAL_AUDIT.json`: 10-point architectural audit results.
