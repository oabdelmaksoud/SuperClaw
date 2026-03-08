---
name: ecc-cmd-verify
description: "Command skill for 'verify'. Use when users request verification and readiness validation before merge/release."
---

# ecc-cmd-verify

Run a deterministic verification pipeline and summarize pass/fail clearly.

## Modes

- `quick`: build + type checks
- `full` (default): build + types + lint + tests + log/secrets audit + git status
- `pre-commit`: fast checks relevant before commit
- `pre-pr`: full + security scan

## Execution Order

1. Build
2. Types
3. Lint
4. Tests
5. Audit for debug logs and obvious secrets
6. Git status summary

If build fails, report and stop unless user asked for `full regardless`.

## Commands

Use `scripts/run-verify.sh <mode> [path]` when available. If unavailable, run equivalent project-native commands.

## Report Format

```text
VERIFICATION: PASS|FAIL
Build:    OK|FAIL
Types:    OK|N errors
Lint:     OK|N issues
Tests:    X/Y passed
Security: OK|N findings
Logs:     OK|N console/debug logs
Ready for PR: YES|NO
```

Then list top issues with shortest actionable fixes.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

