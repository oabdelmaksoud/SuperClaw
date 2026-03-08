---
name: ecc-claude-product-team-landing-page-generator
description: "OpenClaw bridge skill for product team landing page generator. Use when tasks match this specialized anthropic skills capability and need OpenClaw-native execution with explicit verification."
---

# ecc-claude-product-team-landing-page-generator

## Purpose
Apply `product team landing page generator` guidance from upstream references in an OpenClaw-native workflow.

## Trigger Conditions
- User request clearly matches `product team landing page generator` capability.
- Task benefits from specialized domain guidance plus execution steps.

## When NOT to Use
- Generic tasks better handled by broader `ecc-cmd-*` workflows.
- Requests unrelated to `product team landing page generator` specialization.

## Workflow
1. Read upstream reference snapshot in `references/upstream-path.txt`.
2. Extract relevant guidance for the current objective.
3. Translate to OpenClaw tool-backed steps.
4. Execute incrementally and verify outcomes.

## Output Format
- Objective
- Chosen approach
- Actions executed
- Verification evidence
- Risks/next steps

## Guardrails
- Preserve upstream intent without assuming harness-specific runtime semantics.
- Prefer deterministic checks and concise, evidence-backed conclusions.
