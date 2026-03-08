---
name: ecc-anthropic-canvas-design
description: "Bridge skill for anthropics/skills 'canvas-design'. Use when this specialized capability is requested; execute with OpenClaw-native tools and verification."
---

# ecc-anthropic-canvas-design

Apply upstream Anthropic skill intent in OpenClaw-native execution.

## Source
- `upstream-import/anthropic-skills/references/skills/canvas-design`

## Workflow
1. Read upstream `SKILL.md` from the reference snapshot.
2. Translate harness/platform-specific instructions to OpenClaw tool flow.
3. Execute with deterministic checks where possible.
4. Return concise outputs and verification evidence.

## Rules
- Preserve upstream intent and safety constraints.
- Avoid assuming non-OpenClaw runtime semantics.
