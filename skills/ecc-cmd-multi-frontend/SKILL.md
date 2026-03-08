---
name: ecc-cmd-multi-frontend
description: "Command skill for 'multi-frontend'. Use when users request multi-stream orchestration and dependency-aware parallelization; frontend UI/state/performance/accessibility workflows."
---

# ecc-cmd-multi-frontend

Specialized orchestration for frontend-heavy initiatives.

## Checklist
- Shared design/system consistency
- State/data-fetching consistency
- Accessibility checks
- Performance budget checks
- API contract compatibility

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

