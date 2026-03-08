# SuperClaw

SuperClaw is an OpenClaw-native compatibility pack that brings high-value workflow patterns from **Everything Claude Code (ECC)** into a reusable OpenClaw setup.

> **Acknowledgement:** This project is deeply inspired by and adapted from [`affaan-m/everything-claude-code`](https://github.com/affaan-m/everything-claude-code). See `upstream/NOTICE` and `upstream/SOURCE_PIN.txt` for attribution and source pinning.

---

## What SuperClaw Includes

- **121 ECC-derived OpenClaw skills**
  - command skills (`ecc-cmd-*`)
  - role skills (`ecc-role-*`)
  - domain skills (`ecc-*`)
- **OpenClaw-compatible runtime layers**
  - contexts (`contexts/`)
  - hook intent mapping (`hooks/`)
  - MCP profiles via mcporter (`mcp-configs/`)
  - schemas (`schemas/`)
- **Validation + operations scripts**
  - verify / quality gate / security scan / eval
  - acceptance runners
  - compatibility smoke runners
  - install wizard

---

## Why this exists

ECC contains strong operational patterns (planning, verification, security discipline, orchestration). SuperClaw translates those patterns into **OpenClaw-native behavior** instead of trying to clone harness-specific internals 1:1.

This gives you practical compatibility where it matters:
- same workflow intent
- OpenClaw tooling and execution model
- reproducible checks and reports

---

## Install (Recommended)

```bash
bash scripts/install-wizard.sh
```

The wizard can:
- install skills globally to `~/.openclaw/skills`
- sync runtime assets to `~/.openclaw/ecc-runtime`
- apply MCP profile through mcporter
- run quick validation checks

### Non-interactive mode

```bash
NONINTERACTIVE=1 bash scripts/install-wizard.sh
```

---

## Manual Install

```bash
mkdir -p ~/.openclaw/skills
rsync -a --delete skills/ ~/.openclaw/skills/

bash scripts/integrate-openclaw-runtime.sh
bash scripts/apply-mcporter-profile.sh standard
```

Then start a new OpenClaw session (`/new`) to refresh skill discovery.

---

## Validate Installation

```bash
openclaw skills info ecc-cmd-plan
bash scripts/run-compat-smoke.sh
bash scripts/run-compat-acceptance.sh
```

---

## Project Structure

- `skills/` — OpenClaw-compatible ECC skill pack
- `scripts/` — install, validation, and compatibility tooling
- `contexts/`, `hooks/`, `mcp-configs/`, `schemas/` — runtime compatibility assets
- `tests/acceptance/` — scenario/acceptance suites (core20/core60/core95/compat)
- `tests/regression/` — baseline snapshots
- `upstream/` — attribution/source sync metadata
- `upstream-import/` and `upstream-archive/` — selective imports + archived harness-specific surfaces

---

## Compatibility Philosophy

SuperClaw targets **behavioral compatibility** with ECC patterns in OpenClaw.

- ✅ Port/adapt: skills, workflow commands, role behaviors, rules intent, hook intent, MCP profiles
- ⚠️ Archive/skip by default: harness-locked internals (`.claude`, `.cursor`, `.codex`, `.opencode`, etc.)

See:
- `COMPATIBILITY.md`
- `COMPATIBILITY_CLOSURE_MATRIX.md`
- `HARNESS_TRANSLATION_MATRIX.md`

---

## Credits

- Original concept and source patterns: **Everything Claude Code** by @affaan-m
- SuperClaw adaptation and OpenClaw integration: this repository

---

## License & Attribution

Use in accordance with upstream and local licensing/attribution files:
- `upstream/NOTICE`
- `LICENSE.upstream`

## Skill Quality Program

SuperClaw enforces bridge-skill quality via:
- `SKILL_QUALITY_CONTRACT.md`
- `scripts/validate-skill-template.sh`
- `scripts/validate-skill-descriptions.sh`
- `BRIDGE_ROUTING_REGRESSION.md`


## Proactive Subagent Delegation (Default)

SuperClaw is configured to proactively use subagents for complex tasks (without requiring the user to explicitly ask).

Policy file:
- `SUBAGENT_POLICY.md`

When delegation is used, outputs should include:
- which subagents were spawned
- assigned scope per subagent
- result per subagent
- merged final outcome


---

## Acknowledgements

SuperClaw is built from adapted ideas, patterns, and references from these repositories:

1. **Everything Claude Code (ECC)**  
   https://github.com/affaan-m/everything-claude-code

2. **agency-agents**  
   https://github.com/msitarzewski/agency-agents

3. **claude-skills**  
   https://github.com/alirezarezvani/claude-skills

4. **anthropics/skills**  
   https://github.com/anthropics/skills

We deeply appreciate the original authors and maintainers for publishing these resources.

Traceability and attribution files in this repo:
- `upstream/NOTICE`
- `upstream/SOURCE_PIN.txt`
- `upstream-import/agency-agents/SOURCE_PIN.txt`
- `upstream-import/agency-agents/NOTICE.md`
- `upstream-import/claude-skills/SOURCE_PIN.txt`
- `upstream-import/claude-skills/NOTICE.md`
- `upstream-import/anthropic-skills/SOURCE_PIN.txt`
- `upstream-import/anthropic-skills/NOTICE.md`

