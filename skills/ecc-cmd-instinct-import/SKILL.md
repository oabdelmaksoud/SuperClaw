---
name: ecc-cmd-instinct-import
description: "Command skill for 'instinct-import'. Use when users request capturing and managing learned patterns/instincts; importing and validating external artifacts."
---

# ecc-cmd-instinct-import

Validate schema, de-duplicate conflicts, and merge with audit trail.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

