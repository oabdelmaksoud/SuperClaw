---
name: ecc-cmd-multi-execute
description: "Command skill for 'multi-execute'. Use when users request multi-stream orchestration and dependency-aware parallelization."
---

# ecc-cmd-multi-execute

Execute approved multi-stream plans with synchronization points.

## Workflow

1. Load approved multi-plan.
2. Execute independent streams in parallel where safe.
3. Enforce sync barriers at integration points.
4. Run verification per stream.
5. Produce consolidated checkpoint.

## Rules
- Do not parallelize dependent work.
- Block release until integration checks pass.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

