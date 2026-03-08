# Agent Scenario Matrix (Role Skills)

## Global Readiness Sweep
- Result: PASS (16/16 ready)

## Scenario Cases

### S1 Planning delegation
- Role: ecc-role-planner
- Given: Complex feature requires phased implementation plan
- When: Inspect planner role skill
- Then: expect pattern: planner|Ready
- Result: PASS
```
📦 ecc-role-planner ✓ Ready

Role skill for 'planner'. Use when tasks need specialized OpenClaw workflow execution; structured outputs with verification with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-planner/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S2 Architecture delegation
- Role: ecc-role-architect
- Given: Need system design + tradeoff decisions
- When: Inspect architect role skill
- Then: expect pattern: architect|tradeoff|Ready
- Result: PASS
```
📦 ecc-role-architect ✓ Ready

Role skill for 'architect'. Use when tasks need architecture design and tradeoff decisions with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-architect/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S3 Code review delegation
- Role: ecc-role-code-reviewer
- Given: Need severity-ranked code findings
- When: Inspect code-reviewer role skill
- Then: expect pattern: code-reviewer|Ready
- Result: PASS
```
📦 ecc-role-code-reviewer ✓ Ready

Role skill for 'code-reviewer'. Use when tasks need code-level implementation and quality review; review specialist role outputs with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-code-reviewer/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S4 Security review delegation
- Role: ecc-role-security-reviewer
- Given: Need threat-focused review
- When: Inspect security-reviewer role skill
- Then: expect pattern: security-reviewer|Ready
- Result: PASS
```
📦 ecc-role-security-reviewer ✓ Ready

Role skill for 'security-reviewer'. Use when tasks need security review, vulnerability detection, and hardening; review specialist role outputs with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-security-reviewer/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S5 Refactor delegation
- Role: ecc-role-refactor-cleaner
- Given: Need behavior-preserving cleanup
- When: Inspect refactor-cleaner role skill
- Then: expect pattern: refactor-cleaner|Ready
- Result: PASS
```
📦 ecc-role-refactor-cleaner ✓ Ready

Role skill for 'refactor-cleaner'. Use when tasks need behavior-preserving refactoring and cleanup; cleanup and refactor discipline role with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-refactor-cleaner/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S6 Loop operation delegation
- Role: ecc-role-loop-operator
- Given: Need bounded iterative execution control
- When: Inspect loop-operator role skill
- Then: expect pattern: loop-operator|Ready
- Result: PASS
```
📦 ecc-role-loop-operator ✓ Ready

Role skill for 'loop-operator'. Use when tasks need bounded iterative execution cycles; operational control and loop management role with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-loop-operator/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S7 Cross-workstream coordination
- Role: ecc-role-chief-of-staff
- Given: Need prioritization and execution coordination
- When: Inspect chief-of-staff role skill
- Then: expect pattern: chief-of-staff|Ready
- Result: PASS
```
📦 ecc-role-chief-of-staff ✓ Ready

Role skill for 'chief-of-staff'. Use when tasks need cross-workstream coordination and prioritization; operational planning and decision support with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-chief-of-staff/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S8 Python review specialization
- Role: ecc-role-python-reviewer
- Given: Need Python quality/correctness review
- When: Inspect python-reviewer role skill
- Then: expect pattern: python-reviewer|Ready
- Result: PASS
```
📦 ecc-role-python-reviewer ✓ Ready

Role skill for 'python-reviewer'. Use when tasks need Python development, testing, quality, and review workflows; review specialist role outputs with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-python-reviewer/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

### S9 Role skill structure conformance
- Result: PASS

## Summary
- Passed: 10
- Failed: 0
