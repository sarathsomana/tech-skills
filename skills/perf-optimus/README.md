# Perf-Optimus ⚡

`perf-optimus` provides systematic frontend and backend performance optimization. It measures, analyzes, optimizes, and validates with empirical before/after evidence — never claiming improvement without proof.

## Overview

Performance optimization without measurement is guesswork. This skill enforces a data-driven approach: establish a baseline, isolate bottlenecks, apply targeted optimizations, and re-benchmark to confirm measurable improvement. Every optimization is independently revertable.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Profiler | Measure baseline performance metrics (latency, throughput, bundle size, Core Web Vitals). |
| **ANALYZE** | The Detective | Isolate bottlenecks (N+1 queries, blocking scripts, unoptimized images, memory leaks). |
| **STRATEGIZE** | The Optimizer | Create a prioritized optimization plan ranked by impact. |
| **OPTIMIZE** | The Artisan | Apply optimizations incrementally with test verification after each change. |
| **VALIDATE** | The Benchmarker | Re-run benchmarks to confirm measurable improvement with before/after comparison. |
| **CRITIC** | The Senior Performance Engineer | Verify all bottlenecks addressed and no new regressions introduced. |
| **WAIT_FOR_HUMAN** | The Collaborator | Escalate when optimizations cause regressions or targets can't be met. |

## Core Directives

- **Empirical Evidence Only**: Never claim improvement without before/after metrics.
- **Rollback Safety**: Every optimization must be independently revertable.
- **Physical Exit Codes**: Validate with real test runs, not subjective assessment.

## Usage

Trigger this skill when your application has performance issues or before a major release. Provide the codebase paths, performance testing scripts, and target metrics.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `PERF_BASELINE.md` | Baseline metrics with measurement methodology |
| `BOTTLENECK_REPORT.md` | Identified bottlenecks ranked by impact |
| `OPTIMIZATION_PLAN.md` | Prioritized optimization strategy with tradeoffs |
| `OPTIMIZATION_LOG.md` | Step-by-step log of optimizations applied |
| `PERF_RESULTS.md` | Before/after comparison table |
