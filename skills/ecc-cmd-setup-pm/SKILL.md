---
name: ecc-cmd-setup-pm
description: "Command skill for 'setup-pm'. Use when users request tooling setup and environment initialization."
---

# ecc-cmd-setup-pm

Set and verify package manager policy.

Check lockfiles, scripts compatibility, CI consistency, and install reproducibility.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

