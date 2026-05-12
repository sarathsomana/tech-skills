# SKILL_REQUIREMENTS: Perf-Optimus

## 1. Primary Objective
Provide automatic frontend and backend performance optimization, as specified in the Phase 4 roadmap.

## 2. Core Capabilities Needed
- **Performance Profiling (Scout)**: Measure baseline performance metrics (e.g., latency, throughput, bundle size, core web vitals).
- **Bottleneck Identification**: Analyze code and profiles to isolate performance bottlenecks (e.g., N+1 queries, unoptimized images, blocking scripts).
- **Optimization Strategy**: Formulate a plan to address the bottlenecks (e.g., adding caching, lazy loading, query optimization).
- **Automated Tuning**: Apply optimizations to the codebase.
- **Validation**: Re-run profiling to confirm measurable performance improvements without breaking functionality.

## 3. Ground Truth & Inputs
- **Inputs**: Codebase paths, performance testing scripts, and target performance metrics.
- **Environment**: Execution capabilities (`run_command`) to run profilers, load tests, or bundle analyzers, and editing tools to apply optimizations.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `PERF_BASELINE.md`, `OPTIMIZATION_PLAN.md`, `PERF_RESULTS.md`).
- **Loop Breakers & HITL**: Rollback optimizations if performance degrades or tests fail; fallback to `Wait-For-Human`.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
