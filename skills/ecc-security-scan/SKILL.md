---
name: ecc-security-scan
description: "Domain skill for 'security-scan'. Use when requests involve security review, vulnerability detection, and hardening; automated scanning and finding classification."
---

# ecc-security-scan

Run scanner-first security checks, then summarize risk and fixes.

## Preferred Tooling

1. If available, run `ecc-agentshield` for harness/config scans.
2. Run repository-native security checks (e.g., npm audit/pip-audit/gosec) where applicable.
3. Report consolidated findings by severity.

## Command Path

Prefer `scripts/run-security-scan.sh [path]`.
Fallback sequence:
- `npx ecc-agentshield scan --format json` (if installed)
- language-native audit commands

## Output

- Overall status: `PASS | FAIL`
- Findings grouped by severity
- Exact remediation actions
- Re-run command list for verification

If scanners are missing, report install instructions and continue with available checks.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

