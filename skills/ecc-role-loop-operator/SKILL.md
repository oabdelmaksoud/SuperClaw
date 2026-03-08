---
name: ecc-role-loop-operator
description: "Role skill for 'loop-operator'. Use when tasks need bounded iterative execution cycles; operational control and loop management role with role-scoped deliverables."
---

# ecc-role-loop-operator

Operate bounded iterative loops with checkpoints and stop rules.

## Role Workflow

1. Restate objective through the `loop-operator` lens.
2. Produce role-specific plan/checklist.
3. Execute or guide execution with evidence.
4. Emit role-specific verdict and next actions.

## Deliverable Format

- Role objective
- Key analysis/findings
- Decisions/tradeoffs
- Action items
- Verification status

## Rules

- Stay within role scope; escalate cross-role dependencies.
- Use concise, high-signal outputs.
- Prefer verifiable recommendations.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

