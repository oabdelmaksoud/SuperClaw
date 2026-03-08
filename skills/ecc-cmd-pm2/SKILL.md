---
name: ecc-cmd-pm2
description: "Command skill for 'pm2'. Use when users request PM2 process lifecycle management (status/restart/logs)."
---

# ecc-cmd-pm2

Run PM2 operations with safety checks.

## Workflow

1. Inspect current process list and status.
2. Apply requested action (`start|restart|stop|logs|status`).
3. Validate health after action.
4. If unhealthy, recommend rollback action.

## Command Guidance

Use `scripts/pm2-helper.sh <action> [target]` when available.

## Rules
- Never delete processes/config without explicit confirmation.
- Always include post-action status summary.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

