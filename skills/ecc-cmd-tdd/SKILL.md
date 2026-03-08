---
name: ecc-cmd-tdd
description: "Command skill for 'tdd'. Use when users request test-driven development (red-green-refactor)."
---

# ecc-cmd-tdd

Use strict Red → Green → Refactor cycle.

## Workflow

1. Define behavior and acceptance criteria.
2. Write failing test(s) first (Red).
3. Implement minimum code to pass (Green).
4. Refactor while preserving passing tests (Refactor).
5. Run verification (`ecc-cmd-verify` quick/full based on scope).

## Checklist

- [ ] New/updated tests fail before implementation
- [ ] Tests pass after implementation
- [ ] No unrelated code churn
- [ ] Edge cases covered
- [ ] Regression test added for bug fixes

## Output

```md
## TDD Run
- Behavior: ...
- Red: failing tests listed
- Green: implementation summary
- Refactor: improvements made
- Final test status: pass/fail
```

## Rules

- Do not skip Red phase unless user explicitly waives TDD.
- Keep test names behavior-oriented.
- Prefer deterministic tests (avoid timing/network flakiness).

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

