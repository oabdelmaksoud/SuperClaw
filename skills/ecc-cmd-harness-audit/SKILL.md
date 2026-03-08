---
name: ecc-cmd-harness-audit
description: "Command skill for 'harness-audit'. Use when users request agent harness configuration, performance, and reliability tuning; audits for quality, security, or operational posture."
---

# ecc-cmd-harness-audit

Run checklist across config, hooks, tool permissions, and failure controls.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

