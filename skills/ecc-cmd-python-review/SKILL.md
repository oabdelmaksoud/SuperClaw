---
name: ecc-cmd-python-review
description: "Command skill for 'python-review'. Use when users request Python development, testing, quality, and review workflows; code review, critique, and severity-ranked findings."
---

# ecc-cmd-python-review

Perform structured Python-focused review.

## Checklist
- Typing and interface clarity
- Error handling and edge cases
- Performance hotspots
- Test quality
- Security concerns

Provide severity-ranked findings with file:line evidence.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

