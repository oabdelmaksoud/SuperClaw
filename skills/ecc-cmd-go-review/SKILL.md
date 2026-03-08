---
name: ecc-cmd-go-review
description: "Command skill for 'go-review'. Use when users request Go toolchain, modules, build/test, and idiomatic Go workflows; code review, critique, and severity-ranked findings."
---

# ecc-cmd-go-review

Implement `go-review` as a deterministic workflow with clear inputs, checks, and outcomes.

## Workflow
1. Restate target.
2. Execute minimal safe steps.
3. Verify outputs.
4. Report findings and next actions.

## Rules
- Prefer reproducible commands.
- Include evidence for conclusions.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

