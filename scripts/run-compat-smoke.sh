#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

bash "$ROOT/scripts/port-check.sh"
bash "$ROOT/scripts/validate-skills.sh"
bash "$ROOT/scripts/hook-parity-check.sh"
bash "$ROOT/scripts/validate-schemas.sh"
bash "$ROOT/scripts/run-acceptance.sh" "$ROOT/tests/acceptance/core95.json"

# runtime assets presence
for p in "$ROOT/contexts/dev.md" "$ROOT/hooks/hooks.json" "$ROOT/mcp-configs/profiles/standard.json"; do
  [[ -f "$p" ]] || { echo "missing runtime asset: $p"; exit 1; }
done

echo "COMPAT_SMOKE_PASS"
