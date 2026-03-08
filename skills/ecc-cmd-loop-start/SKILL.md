---
name: ecc-cmd-loop-start
description: "Command skill for 'loop-start'. Use when users request bounded iterative execution cycles; initialization and launch flows."
---

# ecc-cmd-loop-start

Initialize a bounded execution loop with explicit controls.

## Required Inputs

- Objective
- Max iterations
- Stop conditions
- Verification mode (`quick|full`)

## Workflow

1. Define loop contract (goal, bounds, stop rules).
2. Create iteration template:
   - plan step
   - execute step
   - verify step
   - checkpoint summary
3. Start at iteration 1.
4. Stop immediately on blocker/critical failure.
5. End with final checkpoint.

## Output

```md
## Loop Started
- Objective: ...
- Max iterations: N
- Stop conditions: ...
- Verification: quick|full
- Status: running
```

## Rules

- Never run unbounded loops.
- Always report current iteration and latest verdict.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

