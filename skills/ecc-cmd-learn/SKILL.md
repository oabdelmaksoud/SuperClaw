---
name: ecc-cmd-learn
description: "Command skill for 'learn'. Use when users request learning extraction from completed tasks and outcomes."
---

# ecc-cmd-learn

Turn recent execution outcomes into reusable operational knowledge.

## Workflow

1. Identify notable successes/failures from recent runs.
2. Extract candidate patterns:
   - trigger condition
   - action pattern
   - expected outcome
3. Validate each pattern against evidence.
4. Save concise learned rules to project docs.

## Output Template

```md
## Learning Extraction
### Pattern 1
- Trigger:
- Action:
- Outcome:
- Confidence: low|medium|high
```

## Rules

- Keep only high-signal patterns.
- Avoid vague lessons without repeatable steps.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

