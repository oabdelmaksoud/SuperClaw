# Scenario E2E Validation

## S1 Planning request routes to plan-capable skill
- Given: User asks for phased feature planning with risks
- When: Inspect `ecc-cmd-plan`
- Then: skill is ready and contains planning intent
- Result: PASS

## S2 Pre-PR verify on Node sample
- Given: Node sample repository with build/type scripts
- When: Run `scripts/run-verify.sh quick /tmp/ecc-burnin/node-app`
- Then: `VERIFICATION: PASS`
- Result: PASS

## S3 Quality gate on Python sample
- Given: Python sample repository with test
- When: Run `scripts/run-quality-gate.sh /tmp/ecc-burnin/python-app`
- Then: `QUALITY_GATE_DONE`
- Result: PASS

## S4 Security triage scenario
- Given: Repository requires vulnerability scan
- When: Run `scripts/run-security-scan.sh .`
- Then: security findings report produced
- Result: PASS

## S5 Multi-stream orchestration readiness
- Given: Task spans backend/frontend tracks
- When: Inspect `ecc-cmd-multi-plan` and `ecc-cmd-orchestrate`
- Then: both skills are Ready
- Result: PASS

## S6 Iterative loop control
- Given: Need bounded loop execution
- When: Start loop, check status, stop loop
- Then: running status and stop marker are emitted
- Result: PASS

## S7 MCP profile active via mcporter
- Given: MCP should be managed through mcporter profile
- When: List servers using `mcporter --config ~/.openclaw/workspace/config/mcporter.json config list --json`
- Then: memory/github/filesystem servers are present
- Result: PASS

## S8 Role-agent delegation availability
- Given: Security review needs specialized role
- When: Inspect `ecc-role-security-reviewer`
- Then: skill is Ready and role-scoped
- Result: PASS

## Summary
- Passed: 8
- Failed: 0
