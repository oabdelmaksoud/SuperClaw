---
name: ecc-cmd-claw
description: "Command skill for 'claw'. Use when users request OpenClaw operator workflows and generalized execution flows."
---

# ecc-cmd-claw

Use this as a generic operator workflow when a specific command is not available.

Restate objective, choose workflow, execute, verify, and checkpoint.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

