---
name: ecc-agency-testing
description: "Bridge skill for agency-agents testing patterns. Use when test strategy, validation depth, or QA workflow hardening is needed."
---

# ecc-agency-testing

Use agency-agents testing references to improve validation rigor.

## Workflow
1. Read relevant files in `references/testing/`.
2. Map to OpenClaw checks (`ecc-cmd-verify`, `ecc-cmd-quality-gate`, `ecc-cmd-test-coverage`, `ecc-cmd-e2e`).
3. Return prioritized testing actions.

## Output
- Test strategy summary
- Risk-ranked test actions
- Pass/fail gates

## ECC Parity Notes
- Adapted from agency-agents testing playbooks into OpenClaw-native verification workflows.
