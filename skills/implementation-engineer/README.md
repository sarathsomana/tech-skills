# Implementation Engineer ⚙️

`implementation-engineer` bridges the gap between high-level architectural design and concrete code execution. It ingests blueprints produced by design skills and turns them into running, tested, integrated code through a phased build process.

## Overview

Architecture documents are only valuable if they are faithfully implemented. This skill ensures that the code built maps perfectly to the required architectural intent, catching "state drift" between design and implementation before it becomes technical debt.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **PLANNING** | The Strategist | Ingest blueprints, explore the codebase, and create a step-by-step implementation plan. |
| **IMPLEMENTATION** | The Builder | Write the core business logic and component structure. |
| **WIRING** | The Integrator | Connect new components to existing systems (routes, state, APIs). |
| **VERIFICATION** | The Tester | Validate against the original blueprint. Return to IMPLEMENTATION on drift. |
| **SIGN_OFF** | The Reviewer | Obtain formal user approval of the completed work. |
| **GENERATE_ARTIFACT** | The Documenter | Document the implementation process and any architecture deviations. |

## Core Directives

- **Adhere to the Blueprint**: Treat the architectural blueprint as Ground Truth. Deviations must be documented.
- **Iterative Execution**: Build in small, verifiable steps.
- **Tool Use**: Heavily uses coding tools in Implementation and Wiring phases.

## Usage

Trigger this skill after completing an architectural design (e.g., with `first-principles-design`). Provide the blueprint, and the agent will plan, build, wire, and verify the implementation.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| Implementation Plan | Step-by-step coding and integration plan |
| Implementation Summary | Final documentation with `implementation_context` and `architecture_deviations` |
