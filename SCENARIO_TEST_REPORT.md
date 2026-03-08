# ECC OpenClaw Scenario Test Report

## Scenario 1 - Plan skill loaded
- Status: PASS
- Exit code: 0
```
📦 ecc-cmd-plan ✓ Ready

Command skill for 'plan'. Use when users request implementation planning, phasing, and risk identification.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-cmd-plan/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

## Scenario 2 - Verify quick on node sample
- Status: PASS
- Exit code: 0
```
VERIFICATION: PASS
Build:    OK
Types:    OK
```

## Scenario 3 - Quality gate on python sample
- Status: PASS
- Exit code: 0
```
/opt/homebrew/lib/python3.14/site-packages/requests/__init__.py:113: RequestsDependencyWarning: urllib3 (1.26.20) or chardet (6.0.0.post1)/charset_normalizer (3.4.4) doesn't match a supported version!
  warnings.warn(
.                                                                        [100%]
1 passed in 0.00s
QUALITY_GATE_DONE target=/tmp/ecc-burnin/python-app fix=false strict=false
```

## Scenario 4 - Security scan
- Status: PASS
- Exit code: 0
```
SECURITY_SCAN_START target=.

  AgentShield Security Report
  2026-03-08T10:24:52.435Z
  Target: /Users/omarabdelmaksoud/.claude

  Grade: F (0/100)

  Score Breakdown
  Secrets        ████████████████████ 100
  Permissions    ░░░░░░░░░░░░░░░░░░░░ 0
  Hooks          ████████████████████ 100
  MCP Servers    ████████████████████ 100
  Agents         ░░░░░░░░░░░░░░░░░░░░ 0

  Summary
  Files scanned: 8
  Findings: 18 total — 4 critical, 8 high, 6 medium, 0 low, 0 info

  Findings

  ● CRITICAL (4)

    ● Dangerous flag: --no-verify
      commands/commit.md:2
      Git hook verification bypass. The flag "--no-verify" disables safety mechanisms.
      Evidence: --no-verify
      Fix: Remove dangerous bypass flag

    ● Dangerous flag: --no-verify
      commands/commit.md:19
      Git hook verification bypass. The flag "--no-verify" disables safety mechanisms.
      Evidence: --no-verify
      Fix: Remove dangerous bypass flag

    ● Dangerous flag: --no-verify
      commands/commit.md:26
      Git hook verification bypass. The flag "--no-verify" disables safety mechanisms.
      Evidence: --no-verify
      Fix: Remove dangerous bypass flag
```

## Scenario 5 - Loop status
- Status: PASS
- Exit code: 0
```
{"objective":"scenario-loop","iteration":0,"max":2,"status":"running","last_result":"n/a"}
```

## Scenario 6 - Acceptance core95
- Status: PASS
- Exit code: 0
```
ACCEPTANCE: PASS
Validated skills: 95
```

## Scenario 7 - MCP profile list
- Status: PASS
- Exit code: 0
```
{
  "servers": [
    {
      "name": "memory",
      "description": "Session memory",
      "source": {
        "kind": "local",
        "path": "/Users/omarabdelmaksoud/.openclaw/workspace/config/mcporter.json"
      },
      "transport": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory"
      ],
      "cwd": "/Users/omarabdelmaksoud/.openclaw/workspace/config"
    },
    {
      "name": "github",
      "description": "GitHub ops",
      "source": {
        "kind": "local",
        "path": "/Users/omarabdelmaksoud/.openclaw/workspace/config/mcporter.json"
      },
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      },
      "transport": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github"
      ],
      "cwd": "/Users/omarabdelmaksoud/.openclaw/workspace/config"
    },
    {
      "name": "filesystem",
      "description": "Scoped filesystem",
      "source": {
        "kind": "local",
```

## Scenario 8 - Eval script behavior
- Status: PASS
- Exit code: 0
```
EVAL: FAIL
Cases: 0/1 passed
Pass Rate: 0%
```

