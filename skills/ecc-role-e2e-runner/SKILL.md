---
name: ecc-role-e2e-runner
description: "Role skill for 'e2e-runner'. Use when tasks need end-to-end test journeys and integration verification; execution-focused role for checks/tests with role-scoped deliverables."
---

# ecc-role-e2e-runner

Run end-to-end journeys, classify failures, and suggest remediations.

## Role Workflow

1. Restate objective through the `e2e-runner` lens.
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

