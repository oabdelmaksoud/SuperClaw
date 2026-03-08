---
name: ecc-cmd-code-review
description: "Command skill for 'code-review'. Use when users request code-level implementation and quality review; code review, critique, and severity-ranked findings."
---

# ecc-cmd-code-review

Perform review using severity-first output and concrete fix guidance.

## Inputs

- Review target: branch, commit range, PR URL, or path list
- Optional focus: security, performance, maintainability, correctness

## Workflow

1. Collect diff and changed files (`git diff`, `git show`, or explicit files).
2. Identify issues by severity:
   - `blocker`: must fix before merge
   - `major`: high-value fix before merge
   - `minor`: safe to defer
3. Validate claims with evidence (file + line + rationale).
4. Recommend minimal safe patches.
5. End with merge recommendation.

## Output Template

```md
## Code Review Summary
- Scope: ...
- Verdict: APPROVE | REQUEST_CHANGES

### Findings
1. [blocker|major|minor] title
   - file:line
   - why it matters
   - suggested fix

### Positives
- ...

### Merge Readiness
- Ready: yes/no
- Required actions: ...
```

## Rules

- Avoid speculative findings without evidence.
- Prefer small, testable fixes.
- Flag flaky tests and missing verification as `major`.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

