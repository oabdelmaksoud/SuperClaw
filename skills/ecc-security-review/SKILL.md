---
name: ecc-security-review
description: "Domain skill for 'security-review'. Use when requests involve security review, vulnerability detection, and hardening; code review, critique, and severity-ranked findings."
---

# ecc-security-review

Perform threat-focused review and produce actionable findings.

## Review Checklist

1. Secrets handling (no hardcoded keys; env usage validated)
2. Input validation and sanitization
3. AuthN/AuthZ correctness (least privilege)
4. Injection/XSS/SSRF/path traversal risks
5. Dependency and supply-chain concerns
6. Data exposure in logs/errors/responses
7. Security headers/session/cookie policy as relevant

## Severity Model

- `critical`: exploitable with immediate impact
- `high`: serious vulnerability, likely exploitable
- `medium`: meaningful risk, context-dependent
- `low`: hardening recommendation

## Output

```md
## Security Review Summary
- Scope: ...
- Verdict: PASS|FAIL

### Findings
1. [severity] title
   - evidence
   - impact
   - fix
```

Use `references/upstream-summary.md` for additional patterns.

## ECC Parity Notes

- This skill is adapted from ECC intent and translated to OpenClaw-native tool workflows.
- Prefer reproducible, tool-backed execution over harness-specific slash semantics.
- Keep outputs evidence-based and verification-first.

## OpenClaw Constraints

- If upstream flow assumes unavailable hooks/tools, use documented fallback scripts in `openclaw-ecc/scripts/`.
- Mark non-applicable checks as `SKIP` rather than hard-failing when environment support is absent.

