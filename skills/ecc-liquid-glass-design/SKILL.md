---
name: ecc-liquid-glass-design
description: "Domain skill for 'liquid-glass-design'. Use when requests involve visual style/design system implementation; glassmorphism/liquid glass UI patterns; product/system design and implementation tradeoffs."
---

# ecc-liquid-glass-design

Apply the skill as a concrete workflow rather than static guidance.

## Workflow

1. Clarify the task objective and constraints.
2. Load `references/upstream-summary.md` for source intent.
3. Translate upstream harness-specific semantics into OpenClaw tool steps.
4. Execute in smallest safe increments.
5. Verify outcomes and report evidence.

## Output Requirements

- Objective
- Actions taken
- Verification performed
- Risks/limitations
- Next recommended step

## Rules

- Prefer deterministic scripts/commands when possible.
- Avoid unverified claims; provide evidence.
- If uncertain, state assumptions explicitly.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

