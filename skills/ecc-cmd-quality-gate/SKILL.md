---
name: ecc-cmd-quality-gate
description: "Command skill for 'quality-gate'. Use when users request quality gates, standards, and release readiness checks; strict pass/fail validation gates."
---

# ecc-cmd-quality-gate

Run formatter/lint/type/test checks for a target and provide remediation-first output.

## Arguments

- target: `[path|.]` (default `.`)
- flags: `--fix`, `--strict`

## Workflow

1. Detect stack from lockfiles and config (`package.json`, `pyproject.toml`, `go.mod`, etc.).
2. Run formatting check (or apply fix if `--fix`).
3. Run lint + type checks where supported.
4. Run tests (or targeted tests when path-level run is possible).
5. Return gate verdict and prioritized fixes.

## Verdict Rules

- `PASS`: no blocking issues
- `PASS_WITH_WARNINGS`: warnings only and strict mode disabled
- `FAIL`: any build/type/test error, or warnings in strict mode

## Command Path

Prefer `scripts/run-quality-gate.sh [target] [--fix] [--strict]`.
Fallback to native tool commands if script not available.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

