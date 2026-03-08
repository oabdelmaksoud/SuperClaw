#!/usr/bin/env bash
set -euo pipefail
PROFILE="${1:-standard}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/mcp-configs/profiles/$PROFILE.json"
DEST_DIR="$HOME/.openclaw/workspace/config"
DEST="$DEST_DIR/mcporter.json"

if [[ ! -f "$SRC" ]]; then
  echo "Unknown profile: $PROFILE"
  echo "Available: $(ls "$ROOT/mcp-configs/profiles" | sed 's/.json$//' | tr '\n' ' ')"
  exit 1
fi

mkdir -p "$DEST_DIR"
python3 - <<PY
import json
src=json.load(open('$SRC'))
out={"mcpServers": src.get("mcpServers", {})}
json.dump(out, open('$DEST','w'), indent=2)
print('Wrote', '$DEST')
PY

# quick validate with mcporter if present
if command -v mcporter >/dev/null 2>&1; then
  mcporter --config "$DEST" config doctor || true
  mcporter --config "$DEST" config list --json >/dev/null 2>&1 && echo "MCPORTER_CONFIG_OK" || true
fi
