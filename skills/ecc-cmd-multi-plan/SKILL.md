---
name: ecc-cmd-multi-plan
description: "Command skill for 'multi-plan'. Use when users request multi-stream orchestration and dependency-aware parallelization; implementation planning, phasing, and risk identification."
---

# ecc-cmd-multi-plan

Build a single plan spanning multiple streams.

## Workflow

1. Define streams (e.g., backend, frontend, infra, data).
2. Set milestones and dependency order.
3. Assign deliverables and acceptance criteria per stream.
4. Add cross-stream integration checkpoints.
5. Ask for approval before execution.

## Output
- Stream table: owner, deliverable, due checkpoint
- Dependency map
- Risk list + mitigations

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

