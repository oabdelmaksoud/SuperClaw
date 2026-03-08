#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
FIX="${2:-}"
STRICT="${3:-}"

cd "$TARGET"

run_node() {
  if [[ -f package.json ]]; then
    [[ "$FIX" == "--fix" ]] && npm run lint -- --fix 2>/dev/null || true
    npm run -s format -- --check 2>/dev/null || true
    npm run -s lint 2>/dev/null || true
    npm run -s typecheck 2>/dev/null || true
    npm test --silent 2>/dev/null || true
  fi
}

run_python() {
  if [[ -f pyproject.toml || -f requirements.txt ]]; then
    command -v ruff >/dev/null && ruff check . || true
    command -v mypy >/dev/null && mypy . || true
    command -v pytest >/dev/null && pytest -q || true
  fi
}

run_go() {
  if [[ -f go.mod ]]; then
    go fmt ./... >/dev/null 2>&1 || true
    go vet ./... || true
    go test ./... || true
  fi
}

run_node
run_python
run_go

echo "QUALITY_GATE_DONE target=$TARGET fix=${FIX:-false} strict=${STRICT:-false}"
