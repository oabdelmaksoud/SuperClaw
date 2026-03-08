---
name: ecc-cmd-go-test
description: "Command skill for 'go-test'. Use when users request Go toolchain, modules, build/test, and idiomatic Go workflows; test execution, reliability, and coverage improvements."
---

# ecc-cmd-go-test

Run deterministic test validation for Go projects.

## Workflow
1. Run `go test ./...`.
2. Group failures by package.
3. Propose smallest viable fixes.
4. Re-run targeted + full tests.

## Output
- Pass/fail by package
- Top failing tests
- Next actions

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

