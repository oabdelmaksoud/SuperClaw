#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
cd "$TARGET"

if [[ -f package.json ]]; then
  npm test -- --coverage || npm test || true
  exit 0
fi

if command -v pytest >/dev/null 2>&1; then
  if pytest --help 2>/dev/null | grep -q -- '--cov'; then
    pytest --cov=. || true
  else
    echo "pytest-cov not installed; running pytest without coverage"
    pytest -q || true
  fi
  exit 0
fi

if [[ -f go.mod ]]; then
  go test ./... -cover || true
  exit 0
fi

echo "No coverage tooling detected"
