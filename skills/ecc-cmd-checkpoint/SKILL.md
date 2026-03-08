---
name: ecc-cmd-checkpoint
description: "Command skill for 'checkpoint'. Use when users request status snapshots, handoff checkpoints, and progress summaries."
---

# ecc-cmd-checkpoint

Emit an explicit snapshot of progress and quality state.

## Workflow

1. Summarize objective and current milestone.
2. Report completed work with evidence (files/tests/commits).
3. Report outstanding risks or blockers.
4. Provide next 3 concrete steps.
5. If git repo exists, include concise status (`branch`, changed files).

## Output Template

```md
## Checkpoint
- Objective: ...
- Status: on-track|at-risk|blocked

### Completed
- ... (evidence)

### Outstanding
- ...

### Next Steps
1. ...
2. ...
3. ...
```

## Rules

- Keep checkpoint factual and verifiable.
- Call out blockers early; do not bury risk.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

