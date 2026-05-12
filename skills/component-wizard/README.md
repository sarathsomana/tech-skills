# Component Wizard ✨

`component-wizard` generates high-fidelity UI components from screenshots, mockups, or textual design manifestos. It transforms visual references into production-ready, interactive components with pixel-accurate styling.

## Overview

Translating a design into code is one of the most error-prone steps in frontend development. This skill automates it by deconstructing the design into specifications, scaffolding the structure, applying styling, and adding interactive states — all while requiring human visual approval at every stage.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Analyst | Deconstruct the design input into actionable specifications (layout, colors, typography). |
| **SCAFFOLD** | The Architect | Generate the structural markup and component skeleton. |
| **STYLE** | The Stylist | Apply high-fidelity styling to achieve pixel-accurate design matching. |
| **INTERACT** | The Animator | Add interactive states (hover, focus, active) and micro-animations. |
| **WAIT_FOR_HUMAN** | The Collaborator | **Mandatory** visual and functional approval from the user. |
| **CRITIC** | The Quality Inspector | Final quality gate for design fidelity and accessibility. |

## Core Directives

- **Design Fidelity**: The component must match the reference as closely as possible.
- **Visual Confirmation is Mandatory**: The agent cannot self-approve subjective design work.
- **Framework Agnostic**: Asks the user which framework to target — never assumes React.

## Usage

Trigger this skill when you have a screenshot, mockup, or design description that needs to become a real component. Specify your target framework (React, Vue, HTML, etc.).

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `DESIGN_DECONSTRUCTION.md` | Visual hierarchy, design tokens, and component boundaries |
| `COMPONENT_DRAFT.md` | Structural markup and composition rationale |
| `STYLE_LOG.md` | Color values, spacing decisions, responsive breakpoints |
| `INTERACTION_LOG.md` | Interactive states and animation specifications |
| `FINAL_COMPONENT.md` | Quality-checked final component documentation |
