# RUNTIME_INTEGRATION

This package now includes runtime integration helpers so OpenClaw can use ECC-style operational assets beyond skills.

## 1) Integrate runtime assets

```bash
bash scripts/integrate-openclaw-runtime.sh
```

This syncs:
- contexts
- hooks intent map
- mcp-configs
- schemas

to `~/.openclaw/ecc-runtime`.

## 2) Apply MCP profile via mcporter

```bash
bash scripts/apply-mcporter-profile.sh standard
# or: minimal | strict
```

This writes `~/.openclaw/workspace/config/mcporter.json` and validates with `mcporter config doctor`.

## Notes

- OpenClaw skills are already globally loaded from `~/.openclaw/skills`.
- MCP runtime access is expected through `mcporter` as requested.
- Hook/contexts are provided as integration assets and workflow policy references.
