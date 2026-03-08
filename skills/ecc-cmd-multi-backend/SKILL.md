---
name: ecc-cmd-multi-backend
description: "Command skill for 'multi-backend'. Use when users request multi-stream orchestration and dependency-aware parallelization; backend architecture, services, and data flows."
---

# ecc-cmd-multi-backend

Specialized orchestration for backend-heavy initiatives.

## Checklist
- API contracts aligned
- Schema/migrations sequenced safely
- Background jobs and retries validated
- Auth/permissions verified
- Backward compatibility reviewed

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

