---
name: ecc-anthropic-template-skill
description: "Bridge skill for anthropics/skills template skill. Use as a canonical baseline when creating new OpenClaw-compatible skills from template guidance."
---

# ecc-anthropic-template-skill

Apply upstream template guidance for new skill creation in OpenClaw.

## Source
- `upstream-import/anthropic-skills/references/template`

## Workflow
1. Read template `SKILL.md` from upstream snapshot.
2. Adapt frontmatter and instruction style to OpenClaw requirements.
3. Add references/scripts as needed and validate skill metadata.

## Rules
- Keep descriptions trigger-specific.
- Prefer concise SKILL.md with detail moved into references.
