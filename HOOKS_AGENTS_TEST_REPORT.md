# Hooks & Agents Test Report

## Hook parity checker
- Status: PASS
- Exit code: 0
```
HOOK_PARITY_OK
```

## Hooks JSON parse
- Status: PASS
- Exit code: 0
```
{
    "$schema": "../schemas/hooks.schema.json",
    "profile": "standard",
    "events": {
        "SessionStart": [
            {
                "id": "session:start:context-load",
                "intent": "hydrate context",
                "mappedAction": "load contexts/*"
            },
            {
                "id": "session:start:pm-detect",
                "intent": "detect package manager",
                "mappedAction": "scripts/setup-package-manager-equivalent"
            }
        ],
        "PreToolUse": [
            {
                "id": "pre:bash:long-run-reminder",
                "intent": "warn for long jobs",
                "mappedAction": "non-blocking reminder"
            },
            {
                "id": "pre:write:doc-path-warning",
                "intent": "warn non-standard doc paths",
                "mappedAction": "non-blocking warning"
            }
        ],
        "PostToolUse": [
            {
                "id": "post:quality-gate",
                "intent": "post-edit quality checks",
                "mappedAction": "scripts/run-quality-gate.sh"
            },
            {
                "id": "post:build-analysis",
                "intent": "analyze build outputs",
                "mappedAction": "async advisory"
            }
        ],
        "Stop": [
            {
                "id": "stop:checkpoint",
                "intent": "checkpoint summary",
                "mappedAction": "ecc-cmd-checkpoint style output"
            },
            {
                "id": "stop:cost-marker",
                "intent": "light telemetry",
                "mappedAction": "session marker"
            }
        ],
        "SessionEnd": [
            {
                "id": "session:end:marker",
                "intent": "session closure marker",
                "mappedAction": "non-blocking marker"
            }
        ]
    }
}
```

## Hook schema JSON parse
- Status: PASS
- Exit code: 0
```
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "title": "OpenClaw Hook Intent Configuration",
    "type": "object",
    "properties": {
        "$schema": {
            "type": "string"
        },
        "profile": {
            "type": "string",
            "enum": [
                "minimal",
                "standard",
                "strict"
            ]
        },
        "events": {
            "type": "object",
            "additionalProperties": {
                "type": "array",
                "items": {
                    "type": "object",
                    "required": [
                        "id",
                        "intent",
                        "mappedAction"
                    ],
                    "properties": {
                        "id": {
                            "type": "string"
                        },
                        "intent": {
                            "type": "string"
                        },
                        "mappedAction": {
                            "type": "string"
                        }
                    }
                }
            }
        }
    },
    "required": [
        "profile",
        "events"
    ]
}
```

## Schema validation script
- Status: PASS
- Exit code: 0
```
SCHEMA_VALIDATION_OK
```

## Role skill count
- Status: PASS
- Exit code: 0
```
      16
```

## Role sample: planner
- Status: PASS
- Exit code: 0
```
📦 ecc-role-planner ✓ Ready

Role skill for 'planner'. Use when tasks need specialized OpenClaw workflow execution; structured outputs with verification with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-planner/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

## Role sample: architect
- Status: PASS
- Exit code: 0
```
📦 ecc-role-architect ✓ Ready

Role skill for 'architect'. Use when tasks need architecture design and tradeoff decisions with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-architect/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

## Role sample: security-reviewer
- Status: PASS
- Exit code: 0
```
📦 ecc-role-security-reviewer ✓ Ready

Role skill for 'security-reviewer'. Use when tasks need security review, vulnerability detection, and hardening; review specialist role outputs with role-scoped deliverables.

Details:
  Source: openclaw-managed
  Path: ~/.openclaw/skills/ecc-role-security-reviewer/SKILL.md

Tip: use `npx clawhub` to search, install, and sync skills.
```

## Role readiness sweep
- Status: PASS
- Exit code: 0
```
roles_total=16
roles_ready=16
roles_bad=none
```

