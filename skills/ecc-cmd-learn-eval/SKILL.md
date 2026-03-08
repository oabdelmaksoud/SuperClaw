---
name: ecc-cmd-learn-eval
description: "Command skill for 'learn-eval'. Use when users request learning extraction from completed tasks and outcomes; evaluation, benchmarking, quality scoring, and regression checks."
---

# ecc-cmd-learn-eval

Validate candidate learnings with measurable checks.

## Workflow

1. Select learned patterns to test.
2. Define acceptance metrics (pass rate, defects, cycle time).
3. Run controlled trials/evals.
4. Compare baseline vs learned-pattern runs.
5. Mark pattern status:
   - adopt
   - revise
   - reject

## Output

```md
## Learning Evaluation
- Pattern: ...
- Baseline: ...
- Trial: ...
- Delta: ...
- Decision: adopt|revise|reject
```

## Rules

- Do not adopt patterns without measurable improvement.
- Flag regressions immediately.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

