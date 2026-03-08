# TEST_MATRIX (Phase 1)

## Objective
Validate ECC-to-OpenClaw beta readiness across representative repository types.

## Repository Profiles

| Profile | Stack | Purpose | Required checks |
|---|---|---|---|
| node-app | Node/TypeScript | Verify JS/TS scripts + command workflows | verify, quality-gate, security-scan, tdd |
| python-app | Python | Validate Python fallback behavior + review paths | verify, test-coverage, security-scan |
| go-app | Go | Validate Go build/test/review orchestration | go-build/go-test/go-review style workflows |
| mixed-monorepo | Node + Python + Go | Validate cross-stack detection and no false hard-fails | verify, quality-gate, orchestrate, checkpoint |

## Pass Criteria

### Global
- Skills load from `openclaw-managed` source
- No placeholder adapters in active skill set
- Validation scripts pass

### Per Repo
- Core workflow commands run without crashing
- Non-applicable checks return `SKIP`/`WARN`, not hard failure
- Security scan returns findings without breaking workflow
- Output includes actionable next steps

## Capture Template (per profile)

```md
### <profile>
- Date:
- Repo path:
- Checks run:
- Result: PASS/FAIL
- Trigger issues:
- Script portability issues:
- Notes:
```
