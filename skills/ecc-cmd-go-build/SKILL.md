---
name: ecc-cmd-go-build
description: "Command skill for 'go-build'. Use when users request Go toolchain, modules, build/test, and idiomatic Go workflows; build failures, compilation issues, and CI build triage."
---

# ecc-cmd-go-build

Use `go build ./...` and dependency/module checks.

## Workflow
1. Run `go build ./...`.
2. Classify errors (types, imports, modules, toolchain).
3. Apply minimal fixes.
4. Re-run build + tests.
5. Report changed files and residual risks.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

