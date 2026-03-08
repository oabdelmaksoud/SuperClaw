#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
cd "$TARGET"

passed=0
total=0

if [[ -f package.json ]]; then
  total=$((total+1))
  if npm test --silent >/tmp/ecc_eval_node.log 2>&1; then passed=$((passed+1)); fi
fi

if command -v pytest >/dev/null 2>&1 && ( [[ -f pyproject.toml ]] || [[ -d tests ]] ); then
  total=$((total+1))
  if pytest -q >/tmp/ecc_eval_py.log 2>&1; then passed=$((passed+1)); fi
fi

if [[ "$total" -eq 0 ]]; then
  echo "EVAL: SKIP"
  echo "Cases: 0/0"
  echo "Reason: no runnable eval harness detected"
  exit 0
fi

rate=$(( passed * 100 / total ))
status="FAIL"
[[ "$passed" -eq "$total" ]] && status="PASS"

echo "EVAL: $status"
echo "Cases: $passed/$total passed"
echo "Pass Rate: ${rate}%"
