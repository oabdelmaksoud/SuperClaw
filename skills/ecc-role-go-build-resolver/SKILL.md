---
name: ecc-role-go-build-resolver
description: "Role skill for 'go-build-resolver'. Use when tasks need Go toolchain, modules, build/test, and idiomatic Go workflows; build failures, compilation issues, and CI build triage; root-cause diagnosis and remediation with role-scoped deliverables."
---

# ecc-role-go-build-resolver

Resolve Go build/toolchain/module failures quickly and safely.

## Role Workflow

1. Restate objective through the `go-build-resolver` lens.
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

