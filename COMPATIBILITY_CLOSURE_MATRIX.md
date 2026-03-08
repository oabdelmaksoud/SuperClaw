# COMPATIBILITY_CLOSURE_MATRIX

## Scope Buckets

### Must-do (v1.0)
- Hook parity uplift (OpenClaw-equivalent behavior)
- MCP profile hardening
- Context/schema CI integration
- Acceptance suite expansion (core90+)
- Regression snapshot generation
- Changelog policy + release pipeline validation
- External validation package prepared (scripts/templates)

### Nice-to-have (post-v1.0)
- Additional examples/assets import
- Multi-language docs migration
- Rich telemetry dashboarding

### Skip forever (unless strategy changes)
- Byte-for-byte parity with harness-locked internals
- Exact lifecycle semantics not representable in OpenClaw runtime

## Surface Decisions

| Surface | Decision | Rationale |
|---|---|---|
| skills/commands/agents/rules intent | PORT/ADAPT | Core runtime value |
| hooks lifecycle internals | ADAPT | Different runtime model |
| mcp-configs | ADAPT | Need OpenClaw-safe profiles |
| contexts/schemas | ADAPT | Useful and portable |
| .claude/.cursor/.codex/.opencode internals | SKIP/ARCHIVE | Harness-specific |
| plugin packaging internals | ADAPT selective | Keep OpenClaw-compatible pieces only |
