#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
cd "$TARGET"

if [[ -f package.json ]]; then
  npm run -s build || true
  npm run -s typecheck || true
elif [[ -f go.mod ]]; then
  go build ./... || true
elif [[ -f pyproject.toml || -f requirements.txt ]]; then
  python -m pytest -q || true
else
  echo "No recognized build system"
fi

echo "BUILD_FIX_TRIAGE_DONE"
