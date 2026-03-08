---
name: ecc-cmd-projects
description: "Command skill for 'projects'. Use when users request project portfolio status and prioritization."
---

# ecc-cmd-projects

Create portfolio-style status report for active projects.

Include: current state, blockers, near-term milestones, and recommended priority order.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

