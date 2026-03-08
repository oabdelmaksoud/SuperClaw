---
name: ecc-cmd-refactor-clean
description: "Command skill for 'refactor-clean'. Use when users request behavior-preserving refactoring and cleanup."
---

# ecc-cmd-refactor-clean

Execute behavior-preserving cleanup.

## Workflow
1. Define refactor scope and invariants.
2. Add/confirm safety tests.
3. Refactor in small commits.
4. Verify tests/build after each step.
5. Summarize improvements and non-goals.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

