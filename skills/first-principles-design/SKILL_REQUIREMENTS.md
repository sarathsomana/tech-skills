# Skill Requirements: first-principles-design

## Primary Objective
To facilitate a high-rigor, first-principles architectural review or system design session. The skill must break down user assumptions into fundamental, contextual truths through iterative, pragmatic interviewing.

## Core Requirements
1.  **Iterative Deepening**: The skill must be capable of reaching deeper levels of "fundamental truth" based on the user's responses. It shouldn't stop at surface-level justifications.
2.  **Pragmatic Best Practices**: While challenging everything, the agent must remain pragmatic and guide the user toward established best practices when they align with the discovered fundamental truths.
3.  **Contextual Ground Truths**: "Ground Truth" is not static; it must be derived from the specific constraints of the project (e.g., specific hardware limits, network latency, budget, or immutable business rules).
4.  **Phased Execution**:
    *   **Phase 1 (Deconstruction)**: Challenging assumptions.
    *   **Phase 2 (Reconstruction)**: Building the design back up from truths.
    *   **Phase 3 (Validation)**: Stress-testing the new design.
5.  **Formal Sign-off**: The skill must only conclude when the user provides a formal sign-off on the core truths and the resulting design logic.
6.  **Artifact Generation**: Upon sign-off, the agent must ask for permission to generate a summary/design artifact.

## Target Personas
*   **The Grill Master (Deconstruction Phase)**: Relentless, skeptical, but professional.
*   **The Pragmatist (Reconstruction Phase)**: Focused on best practices and feasibility.
*   **The Architect (Validation Phase)**: Holistic view, ensuring the new components fit together.

## Exit Criteria
*   User explicitly confirms "Sign-off".
*   User approves/rejects artifact generation.
