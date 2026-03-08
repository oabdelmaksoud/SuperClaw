---
name: ecc-cmd-test-coverage
description: "Command skill for 'test-coverage'. Use when users request test execution, reliability, and coverage improvements; coverage measurement and gap reduction."
---

# ecc-cmd-test-coverage

Run coverage checks and target critical gaps.

## Workflow
1. Collect current coverage metrics.
2. Identify low-coverage critical paths.
3. Add/adjust tests for highest risk first.
4. Re-run coverage and compare delta.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

