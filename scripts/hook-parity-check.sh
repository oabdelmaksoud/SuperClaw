#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

required=(
  "$ROOT/HOOK_PARITY.md"
  "$ROOT/scripts/run-verify.sh"
  "$ROOT/scripts/run-quality-gate.sh"
  "$ROOT/scripts/run-security-scan.sh"
)
for f in "${required[@]}"; do
  [[ -f "$f" ]] || { echo "missing: $f"; exit 1; }
done

echo "HOOK_PARITY_OK"
