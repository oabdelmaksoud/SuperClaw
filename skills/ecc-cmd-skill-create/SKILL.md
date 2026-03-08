---
name: ecc-cmd-skill-create
description: "Command skill for 'skill-create'. Use when users request skill creation, packaging, and quality checks; creation/generation workflows."
---

# ecc-cmd-skill-create

Generate skill scaffolds and quality-check them.

Ensure SKILL.md has high-signal description and minimal body bloat.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

