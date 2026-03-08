---
name: ecc-cmd-eval
description: "Command skill for 'eval'. Use when users request evaluation, benchmarking, quality scoring, and regression checks."
---

# ecc-cmd-eval

Run evals and produce scorecard + failure analysis.

## Workflow

1. Identify eval set (fixtures, scenarios, test prompts).
2. Run `scripts/run-eval.sh [path]` if available.
3. Capture metrics: pass rate, failures, latency/cost when available.
4. Classify failures by root cause.
5. Provide top remediation actions and rerun command.

## Output Template

```text
EVAL: PASS|FAIL
Cases: X/Y passed
Pass Rate: Z%
Top Failures:
- ...
Actions:
1) ...
2) ...
```

## Rules

- Keep eval dataset version/path in report.
- Distinguish flaky from deterministic failures.
- Include reproducible command lines.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

