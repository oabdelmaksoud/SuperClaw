---
name: ecc-cmd-update-codemaps
description: "Command skill for 'update-codemaps'. Use when users request updating docs/config/mappings to current state; code map/index generation and refresh."
---

# ecc-cmd-update-codemaps

Rebuild repository mapping artifacts and verify freshness.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

