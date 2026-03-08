---
name: ecc-cmd-sessions
description: "Command skill for 'sessions'. Use when users request session continuity, recaps, and decision tracking."
---

# ecc-cmd-sessions

Provide concise session recap with decisions, pending work, and recommended next step.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

