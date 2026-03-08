---
name: ecc-cmd-e2e
description: "Command skill for 'e2e'. Use when users request end-to-end test journeys and integration verification."
---

# ecc-cmd-e2e

Execute e2e suite and triage failures by journey.

## Output
- Journey pass/fail table
- Flaky vs deterministic failures
- Blockers for release

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

