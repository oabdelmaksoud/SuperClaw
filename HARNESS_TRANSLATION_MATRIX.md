# HARNESS_TRANSLATION_MATRIX

| Upstream Surface | OpenClaw Equivalent | Decision | Notes |
|---|---|---|---|
| `.claude/*` | `skills/`, `hooks/`, `contexts/` | adapt | runtime semantics differ |
| `.cursor/*` | `skills/` + docs/compat | archive | harness-specific shell |
| `.codex/*` | `skills/` + scripts | archive | harness-specific |
| `.opencode/*` | `skills/` + scripts | archive | harness-specific |
| `.claude-plugin/*` | docs + metadata refs | adapt selective | plugin runtime differs |
| `.agents/*` | `skills/ecc-role-*` | adapt | role skills are runtime-native |
