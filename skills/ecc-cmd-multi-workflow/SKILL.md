---
name: ecc-cmd-multi-workflow
description: "Command skill for 'multi-workflow'. Use when users request multi-stream orchestration and dependency-aware parallelization; workflow design, execution sequencing, and checkpoints."
---

# ecc-cmd-multi-workflow

Operate end-to-end orchestration lifecycle.

## Stages
1. Intake
2. Multi-plan
3. Multi-execute
4. Integration verification
5. Release checkpoint

## Output
- Current stage
- Blockers
- Next stage entry criteria

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

