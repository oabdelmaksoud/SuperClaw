---
name: ecc-cmd-promote
description: "Command skill for 'promote'. Use when users request environment promotion and release progression."
---

# ecc-cmd-promote

Run promotion checklist: prereqs, validation, deploy, post-checks, rollback plan.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

