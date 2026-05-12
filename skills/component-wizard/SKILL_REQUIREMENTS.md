# SKILL_REQUIREMENTS: Component-Wizard

## 1. Primary Objective
Provide high-fidelity UI component generation from screenshots or design manifestos, as specified in the Phase 3 roadmap.

## 2. Core Capabilities Needed
- **Design Ingestion (Scout)**: Analyze provided screenshots, images, or textual design manifestos to understand the required UI.
- **Component Scaffolding**: Generate structural code (HTML, React, Vue, etc.) matching the design intent.
- **Styling Execution**: Apply CSS, Tailwind, or styling libraries to achieve high-fidelity pixel matching.
- **Interactive Logic**: Stub out necessary interactive states (hover, focus, active) and component logic.
- **Iterative Refinement**: Refine the component based on automated or user feedback.

## 3. Ground Truth & Inputs
- **Inputs**: Image files (screenshots/mockups), textual design descriptions, and target UI framework.
- **Environment**: Requires multimodal capabilities (image understanding) and file creation tools to write the component files.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `DESIGN_DECONSTRUCTION.md`, `COMPONENT_DRAFT.md`, `FINAL_COMPONENT.md`).
- **Loop Breakers & HITL**: Limit the number of refinement iterations; heavily rely on `Wait-For-Human` for subjective design approval.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
