---
name: ecc-cmd-orchestrate
description: "Command skill for 'orchestrate'. Use when users request multi-step coordination and integration planning."
---

# ecc-cmd-orchestrate

Coordinate complex workstreams with explicit owners, dependencies, and convergence checks.

## Workflow

1. Decompose request into workstreams.
2. Define dependency graph and execution order.
3. Assign each stream: objective, inputs, outputs, done criteria.
4. Execute stream-by-stream (or in parallel where independent).
5. Run convergence checkpoint before final integration.
6. Finish with consolidated verification and handoff summary.

## Orchestration Plan Template

```md
## Orchestration Plan
- Goal: ...

### Workstreams
1. WS-A
   - Inputs:
   - Output:
   - Done criteria:
2. WS-B

### Dependencies
- WS-B depends on WS-A

### Integration Checkpoint
- Required artifacts:
- Validation steps:
```

## Rules

- Prefer parallelism only for independent streams.
- Force an integration checkpoint before final answer.
- Escalate if dependency assumptions break.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

