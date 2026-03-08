---
name: ecc-anthropic-brand-guidelines
description: "Bridge skill for anthropics/skills 'brand-guidelines'. Use when this specialized capability is requested; execute with OpenClaw-native tools and verification."
---

# ecc-anthropic-brand-guidelines

Apply upstream Anthropic skill intent in OpenClaw-native execution.

## Source
- `upstream-import/anthropic-skills/references/skills/brand-guidelines`

## Workflow
1. Read upstream `SKILL.md` from the reference snapshot.
2. Translate harness/platform-specific instructions to OpenClaw tool flow.
3. Execute with deterministic checks where possible.
4. Return concise outputs and verification evidence.

## Rules
- Preserve upstream intent and safety constraints.
- Avoid assuming non-OpenClaw runtime semantics.
