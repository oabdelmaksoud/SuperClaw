---
name: ecc-agency-project-management
description: "OpenClaw bridge skill for project management. Use when tasks match this specialized agency-agents capability and need OpenClaw-native execution with explicit verification."
---

# ecc-agency-project-management

## Purpose
Apply `project management` guidance from upstream references in an OpenClaw-native workflow.

## Trigger Conditions
- User request clearly matches `project management` capability.
- Task benefits from specialized domain guidance plus execution steps.

## When NOT to Use
- Generic tasks better handled by broader `ecc-cmd-*` workflows.
- Requests unrelated to `project management` specialization.

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
