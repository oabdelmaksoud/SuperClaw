# SuperClaw

> OpenClaw-native ECC compatibility pack.

SuperClaw brings the strongest operational patterns from [Everything Claude Code (ECC)](https://github.com/affaan-m/everything-claude-code) into an OpenClaw-first architecture.

It is designed for people who want ECC-style planning, verification, security discipline, orchestration, and role specialization — **without depending on ECC’s harness-specific internals**.

---

## Acknowledgement

SuperClaw is inspired by and adapted from:
- `affaan-m/everything-claude-code`

Attribution/source metadata:
- `upstream/NOTICE`
- `upstream/SOURCE_PIN.txt`
- `LICENSE.upstream`

---

## What you get

### 1) ECC-derived OpenClaw skills
- **121 skills total**
  - `ecc-cmd-*` command workflows
  - `ecc-role-*` role-specialized workflows
  - `ecc-*` domain/workflow patterns

### 2) Runtime compatibility assets
- `contexts/` (dev/research/review modes)
- `hooks/` (hook-intent mapping for OpenClaw workflows)
- `mcp-configs/` (mcporter MCP profiles)
- `schemas/` (validation schemas)

### 3) Validation and operations tooling
- install wizard
- smoke/acceptance runners
- verify / quality-gate / security-scan / eval scripts
- upstream sync + compatibility audits

---

## Quick start (recommended)

```bash
git clone https://github.com/oabdelmaksoud/SuperClaw.git
cd SuperClaw
bash scripts/install-wizard.sh
```

Then in OpenClaw, start a fresh session (`/new`) to refresh skill discovery.

### Non-interactive install

```bash
NONINTERACTIVE=1 bash scripts/install-wizard.sh
```

---

## Manual install

```bash
# 1) skills
mkdir -p ~/.openclaw/skills
rsync -a --delete skills/ ~/.openclaw/skills/

# 2) runtime compatibility assets
bash scripts/integrate-openclaw-runtime.sh

# 3) MCP profile (mcporter)
bash scripts/apply-mcporter-profile.sh standard
```

---

## Validate your installation

```bash
openclaw skills info ecc-cmd-plan
bash scripts/run-compat-smoke.sh
bash scripts/run-compat-acceptance.sh
```

### Optional deeper checks

```bash
bash scripts/run-acceptance.sh tests/acceptance/core95.json
bash scripts/run-agent-scenarios.sh AGENT_SCENARIO_MATRIX.md
```

---

## How compatibility is implemented

SuperClaw follows **behavioral compatibility** rather than byte-for-byte harness cloning.

| ECC surface | SuperClaw strategy |
|---|---|
| Commands | Ported as `ecc-cmd-*` OpenClaw skills |
| Agents | Ported as `ecc-role-*` role skills |
| Rules | Ported as OpenClaw references + validation |
| Hooks | Adapted into OpenClaw hook-intent + script workflows |
| MCP configs | Adapted into mcporter profile system |
| Harness internals (`.claude/.cursor/.codex/...`) | archived/selectively adapted |

Key docs:
- `COMPATIBILITY.md`
- `COMPATIBILITY_CLOSURE_MATRIX.md`
- `HARNESS_TRANSLATION_MATRIX.md`
- `RUNTIME_INTEGRATION.md`

---

## Repository layout

- `skills/` — primary OpenClaw skill pack
- `scripts/` — installers, checks, scenario runners
- `contexts/`, `hooks/`, `mcp-configs/`, `schemas/` — runtime layers
- `tests/acceptance/` — core20/core60/core95 + compat suites
- `tests/regression/` — baseline snapshots
- `upstream/` — source pin + attribution
- `upstream-import/` — selective docs/examples imports
- `upstream-archive/` — archived harness-specific references

---

## Tested scenarios (high level)

SuperClaw includes scenario-based validation reports for:
- E2E workflow scenarios
- hooks + role-agent scenarios
- delegated subagent scenarios
- compatibility acceptance suites

Reference reports:
- `SCENARIO_E2E_VALIDATION.md`
- `HOOKS_AGENTS_TEST_REPORT.md`
- `AGENT_SCENARIO_MATRIX.md`
- `SUBAGENT_DELEGATION_TEST_REPORT.md`
- `COMPAT_VALIDATION_REPORT.md`

---

## Known limitations

- Harness-specific internals are not 1:1 executed in OpenClaw runtime.
- Full “certified” status still benefits from clean-machine and non-author user validation runs.
- Some optional docs/assets are selectively imported rather than fully mirrored.

---

## Contributing

Contributions are welcome. Preferred workflow:
1. Open an issue with proposed change scope.
2. Keep changes OpenClaw-native (avoid reintroducing harness lock-in).
3. Run compatibility checks before PR:
   ```bash
   bash scripts/run-compat-smoke.sh
   bash scripts/run-compat-acceptance.sh
   ```

---

## Credits

- Upstream source patterns: **Everything Claude Code** by @affaan-m
- OpenClaw compatibility adaptation: **SuperClaw**

---

## License

See:
- `LICENSE.upstream`
- `upstream/NOTICE`
