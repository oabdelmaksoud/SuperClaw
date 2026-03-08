#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
cd "$TARGET"

echo "SECURITY_SCAN_START target=$TARGET"
if command -v npx >/dev/null; then
  npx -y ecc-agentshield scan --min-severity medium || true
fi

if [[ -f package.json ]]; then npm audit --audit-level=moderate || true; fi
if command -v pip-audit >/dev/null; then pip-audit || true; fi
if [[ -f go.mod ]] && command -v go >/dev/null; then go list -json -m all >/dev/null || true; fi

echo "SECURITY_SCAN_DONE"
