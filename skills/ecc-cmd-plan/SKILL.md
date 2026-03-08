---
name: ecc-cmd-plan
description: "Command skill for 'plan'. Use when users request implementation planning, phasing, and risk identification."
---

# ecc-cmd-plan

Generate a plan-first response and do not implement until user approval.

## Workflow

1. Restate the request in concrete terms.
2. List assumptions and open questions.
3. Break work into ordered phases with explicit deliverables.
4. Identify risks, dependencies, and rollback considerations.
5. Estimate complexity (`low|medium|high`) and likely effort.
6. End with a clear approval gate:
   - `Proceed`
   - `Modify plan`
   - `Cancel`

## Output Template

```md
# Plan: <title>

## Requirements Restatement
- ...

## Assumptions / Open Questions
- ...

## Implementation Phases
1. ...
2. ...

## Risks & Mitigations
- Risk: ... → Mitigation: ...

## Complexity
- Level: <low|medium|high>
- Effort: <estimate>

## Approval
Reply with: Proceed / Modify plan / Cancel
```

## Rules

- Do not write or modify code until explicit approval.
- If the user asks to skip planning, provide a compact 3-step plan anyway unless they explicitly opt out.
- Keep plans specific to this repository and toolchain.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

