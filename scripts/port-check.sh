#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

missing=0
for f in README.md MIGRATION_MATRIX.md COMPATIBILITY.md upstream/NOTICE; do
  if [[ ! -f "$ROOT/$f" ]]; then
    echo "Missing: $f"
    missing=1
  fi
done

if [[ $missing -eq 1 ]]; then
  exit 1
fi

echo "Bootstrap checks passed."
