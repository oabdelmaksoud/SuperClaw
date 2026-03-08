---
name: ecc-cmd-model-route
description: "Command skill for 'model-route'. Use when users request model selection and capability matching; routing logic across models/workflows."
---

# ecc-cmd-model-route

Route workloads to the most suitable model profile.

## Inputs

- Task category (planning/coding/review/summarization/etc.)
- Required quality level
- Latency target
- Cost sensitivity

## Routing Policy

1. High-stakes reasoning/review => quality-optimized model.
2. High-volume repetitive tasks => speed/cost-optimized model.
3. Mixed workflows => split by phase (plan high-quality, execution fast).

## Output

```md
## Model Route
- Task: ...
- Recommended route: ...
- Why: quality/latency/cost tradeoff
- Fallback route: ...
```

## Rules

- State tradeoffs explicitly.
- Provide fallback if preferred route unavailable.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

