#!/usr/bin/env bash
set -euo pipefail
for f in schemas/*.json hooks/hooks.json mcp-configs/*.json mcp-configs/profiles/*.json; do
  python3 -m json.tool "$f" >/dev/null
done
echo "SCHEMA_VALIDATION_OK"
