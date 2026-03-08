#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
cd "$TARGET"
if [[ -f package.json ]]; then
  npm run -s e2e || npm run -s test:e2e || true
else
  echo "No e2e script detected"
fi
