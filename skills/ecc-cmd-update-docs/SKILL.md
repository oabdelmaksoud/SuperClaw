---
name: ecc-cmd-update-docs
description: "Command skill for 'update-docs'. Use when users request updating docs/config/mappings to current state; documentation maintenance and synchronization."
---

# ecc-cmd-update-docs

Sync docs with code and workflows.

## Workflow
1. Identify stale docs.
2. Update architecture/usage/examples.
3. Validate commands and paths in docs.
4. Produce changelog summary.

Prioritize accuracy over verbosity.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

