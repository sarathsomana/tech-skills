# SKILL_REQUIREMENTS: Security-Sentinel

## 1. Primary Objective
Execute red-team auditing, vulnerability patching, and threat modeling for production-readiness and safety, as specified in the Phase 4 roadmap.

## 2. Core Capabilities Needed
- **Threat Modeling (Scout)**: Analyze application architecture and data flows to identify potential threat vectors.
- **Vulnerability Scanning**: Audit dependencies, configurations, and source code for known security flaws (e.g., OWASP Top 10).
- **Exploit Simulation**: (Optional/Simulated) Verify the impact of identified vulnerabilities.
- **Automated Patching**: Generate code patches to remediate identified security issues safely.
- **Security Reporting**: Produce a comprehensive security audit and remediation report.

## 3. Ground Truth & Inputs
- **Inputs**: Target application codebase, dependency manifests, and infrastructure configurations.
- **Environment**: Execution capabilities (`run_command`) to run SAST/DAST tools, dependency checkers, and file editing for patching.

## 4. Required Phased State Machine Adherence
- **Strict Statelessness**: YAML frontmatter defines flow; Markdown defines personas.
- **Artifact-Gated Handovers**: Every transition requires an artifact (e.g., `THREAT_MODEL.md`, `VULNERABILITY_REPORT.md`, `SECURITY_PATCH.md`).
- **Loop Breakers & HITL**: Ensure critical security patches are reviewed by a human (`Wait-For-Human`) before deployment.
- **Lossless Context**: Handover artifacts must include `context` and `tradeoffs_rejected`.
