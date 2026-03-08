# BETA_CHECKLIST (v0.3.0-beta)

## Release Freeze
- [ ] Confirm `VERSION` set to `0.3.0`
- [ ] Ensure working tree clean before tag/release
- [ ] Confirm global skills sync from latest `skills/` tree

## Validation Gates
- [ ] `bash scripts/port-check.sh`
- [ ] `bash scripts/validate-skills.sh`
- [ ] `bash scripts/hook-parity-check.sh`
- [ ] `bash scripts/run-acceptance.sh tests/acceptance/core20.json`

## Environment Matrix (Phase 1)
- [x] Node repo smoke pass
- [x] Python repo smoke pass
- [x] Go repo smoke pass
- [x] Mixed monorepo smoke pass

## Skill Workflow Smoke (per environment)
- [ ] plan
- [ ] verify
- [ ] quality-gate
- [ ] security-scan
- [ ] code-review
- [ ] tdd

## Sign-off
- [ ] Beta readiness report captured
- [ ] Known limitations documented
- [ ] Go/No-Go decision recorded
