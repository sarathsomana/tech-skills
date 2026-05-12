# Security Sentinel 🛡️

`security-sentinel` performs red-team security auditing, vulnerability scanning, and automated patch generation to harden applications for production. Security patches are **never** self-approved — human review is mandatory.

## Overview

Security vulnerabilities are often introduced silently and discovered too late. This skill brings a structured threat-modeling approach: map the attack surface, scan for vulnerabilities, generate minimal patches, and validate — with mandatory human review at every critical juncture.

## Execution Phases

| Phase | Persona | Goal |
| :--- | :--- | :--- |
| **SCOUT** | The Threat Analyst | Map the application attack surface and identify threat vectors (STRIDE). |
| **SCAN** | The Auditor | Scan code, dependencies, and configs for OWASP Top 10 and known CVEs. |
| **PATCH** | The Surgeon | Generate minimal, targeted patches for each vulnerability. |
| **WAIT_FOR_HUMAN** | The Collaborator | **Mandatory** human review of ALL security patches before application. |
| **VALIDATE** | The Verifier | Verify patches resolve vulnerabilities without introducing regressions. |
| **CRITIC** | The Senior Security Architect | Verify no new attack surfaces were introduced by patches. |

## Core Directives

- **Human Review is Mandatory**: Security patches are NEVER self-approved. Always routes through `Wait-For-Human`.
- **Minimal Patches**: Prefer the smallest change that eliminates the vulnerability.
- **Defense in Depth**: Layer security controls rather than relying on single-point fixes.

## Usage

Trigger this skill when you need a security audit, vulnerability assessment, or before deploying to production. Provide the application codebase and infrastructure configurations.

## Key Artifacts

| Artifact | Purpose |
| :--- | :--- |
| `THREAT_MODEL.md` | Application attack surface with categorized threat vectors |
| `VULNERABILITY_REPORT.md` | Findings with severity, CVE references, and affected files |
| `SECURITY_PATCH.md` | Minimal patches with remediation rationale |
| `VALIDATION_REPORT.md` | Test results confirming patches resolve vulnerabilities |
| `SECURITY_SUMMARY.md` | Final assessment and residual risks |
