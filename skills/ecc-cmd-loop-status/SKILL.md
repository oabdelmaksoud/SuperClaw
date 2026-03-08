---
name: ecc-cmd-loop-status
description: "Command skill for 'loop-status'. Use when users request bounded iterative execution cycles; status reporting, health checks, and state summaries."
---

# ecc-cmd-loop-status

Provide concise operational visibility for loop executions.

## Report Fields

- Objective
- Current iteration / max
- Last verification result
- Blockers
- Remaining work
- Recommended action (`continue|pause|stop`)

## Output Template

```md
## Loop Status
- Objective: ...
- Iteration: X/N
- Last result: pass|fail|blocked
- Blockers: ...
- Recommendation: continue|pause|stop
```

## Rules

- If blocker severity is high/critical, recommend `stop`.
- Include exact next step.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

