# TEST_MATRIX_RESULTS (Phase 2 Burn-in)

### node-app
- Repo path: /tmp/ecc-burnin/node-app
- Result: PASS
- verify(quick):
```
VERIFICATION: PASS
Build:    OK
Types:    OK
```
- quality-gate:
```
lint-ok
typecheck-ok
test-ok
QUALITY_GATE_DONE target=/tmp/ecc-burnin/node-app fix=false strict=false
```
- security-scan (head):
```
SECURITY_SCAN_START target=/tmp/ecc-burnin/node-app

  AgentShield Security Report
  2026-03-08T09:40:57.628Z
  Target: /Users/omarabdelmaksoud/.claude

  Grade: F (0/100)

  Score Breakdown
  Secrets        ████████████████████ 100
  Permissions    ░░░░░░░░░░░░░░░░░░░░ 0
  Hooks          ████████████████████ 100
```

### python-app
- Repo path: /tmp/ecc-burnin/python-app
- Result: PASS
- verify(quick):
```
VERIFICATION: PASS
Build:    SKIP
Types:    SKIP
```
- quality-gate:
```
/opt/homebrew/lib/python3.14/site-packages/requests/__init__.py:113: RequestsDependencyWarning: urllib3 (1.26.20) or chardet (6.0.0.post1)/charset_normalizer (3.4.4) doesn't match a supported version!
  warnings.warn(
.                                                                        [100%]
1 passed in 0.00s
QUALITY_GATE_DONE target=/tmp/ecc-burnin/python-app fix=false strict=false
```
- security-scan (head):
```
SECURITY_SCAN_START target=/tmp/ecc-burnin/python-app

  AgentShield Security Report
  2026-03-08T09:40:59.382Z
  Target: /Users/omarabdelmaksoud/.claude

  Grade: F (0/100)

  Score Breakdown
  Secrets        ████████████████████ 100
  Permissions    ░░░░░░░░░░░░░░░░░░░░ 0
  Hooks          ████████████████████ 100
```

### go-app
- Repo path: /tmp/ecc-burnin/go-app
- Result: PASS
- verify(quick):
```
VERIFICATION: PASS
Build:    OK
Types:    OK
```
- quality-gate:
```
ok  	example.com/go-app	0.225s
QUALITY_GATE_DONE target=/tmp/ecc-burnin/go-app fix=false strict=false
```
- security-scan (head):
```
SECURITY_SCAN_START target=/tmp/ecc-burnin/go-app

  AgentShield Security Report
  2026-03-08T09:41:05.020Z
  Target: /Users/omarabdelmaksoud/.claude

  Grade: F (0/100)

  Score Breakdown
  Secrets        ████████████████████ 100
  Permissions    ░░░░░░░░░░░░░░░░░░░░ 0
  Hooks          ████████████████████ 100
```

### mixed-monorepo
- Repo path: /tmp/ecc-burnin/mixed-monorepo
- Result: PASS
- verify(quick):
```
VERIFICATION: PASS
Build:    SKIP
Types:    SKIP
```
- quality-gate:
```
QUALITY_GATE_DONE target=/tmp/ecc-burnin/mixed-monorepo fix=false strict=false
```
- security-scan (head):
```
SECURITY_SCAN_START target=/tmp/ecc-burnin/mixed-monorepo

  AgentShield Security Report
  2026-03-08T09:41:05.888Z
  Target: /Users/omarabdelmaksoud/.claude

  Grade: F (0/100)

  Score Breakdown
  Secrets        ████████████████████ 100
  Permissions    ░░░░░░░░░░░░░░░░░░░░ 0
  Hooks          ████████████████████ 100
```

