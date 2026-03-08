#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

[[ -f "$ROOT/DOCS_COMPAT_MATRIX.md" ]]
[[ -f "$ROOT/HARNESS_TRANSLATION_MATRIX.md" ]]
[[ -d "$ROOT/examples-compat" ]]
[[ -f "$ROOT/assets-compat/ASSET_MANIFEST.txt" ]]

bash "$ROOT/scripts/run-compat-smoke.sh" >/tmp/compat_smoke.out

echo "COMPAT_ACCEPTANCE_PASS"
