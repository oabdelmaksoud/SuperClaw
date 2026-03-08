---
name: ecc-cmd-instinct-status
description: "Command skill for 'instinct-status'. Use when users request capturing and managing learned patterns/instincts; status reporting, health checks, and state summaries."
---

# ecc-cmd-instinct-status

Show counts, freshness, confidence distribution, and stale entries.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

