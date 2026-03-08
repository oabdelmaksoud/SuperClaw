---
name: ecc-cmd-build-fix
description: "Command skill for 'build-fix'. Use when users request build failures, compilation issues, and CI build triage; bug fixing and remediation workflows."
---

# ecc-cmd-build-fix

Run build failure triage and fix loop.

## Workflow
1. Reproduce build failure.
2. Isolate root cause (dependency/config/type/import).
3. Apply minimal fix.
4. Rebuild and verify.
5. Summarize cause + fix + prevention.

## Rules
- Fix root cause, not symptom suppression.
- Do not disable checks to force green build.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

