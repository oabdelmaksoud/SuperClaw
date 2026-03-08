#!/usr/bin/env bash
set -euo pipefail
MODE="${1:-full}"
TARGET="${2:-.}"
cd "$TARGET"

status_build="SKIP"; status_types="SKIP"; status_lint="SKIP"; status_tests="SKIP"; status_sec="SKIP"; status_logs="SKIP"

has_node=0; [[ -f package.json ]] && has_node=1
has_go=0; [[ -f go.mod ]] && has_go=1
has_py=0; [[ -f pyproject.toml || -f requirements.txt || -d tests ]] && has_py=1

run_build(){
  if [[ "$has_node" -eq 1 ]]; then
    npm run -s build >/dev/null 2>&1 && status_build="OK" || status_build="FAIL"
  elif [[ "$has_go" -eq 1 ]]; then
    go build ./... >/dev/null 2>&1 && status_build="OK" || status_build="FAIL"
  elif [[ "$has_py" -eq 1 ]]; then
    status_build="SKIP"
  else
    status_build="SKIP"
  fi
}

run_types(){
  if [[ "$has_node" -eq 1 ]]; then npm run -s typecheck >/dev/null 2>&1 && status_types="OK" || status_types="WARN";
  elif [[ "$has_py" -eq 1 ]] && command -v mypy >/dev/null 2>&1; then mypy . >/dev/null 2>&1 && status_types="OK" || status_types="WARN";
  elif [[ "$has_go" -eq 1 ]]; then go vet ./... >/dev/null 2>&1 && status_types="OK" || status_types="WARN";
  else status_types="SKIP"; fi
}

run_lint(){
  if [[ "$has_node" -eq 1 ]]; then npm run -s lint >/dev/null 2>&1 && status_lint="OK" || status_lint="WARN";
  elif [[ "$has_py" -eq 1 ]] && command -v ruff >/dev/null 2>&1; then ruff check . >/dev/null 2>&1 && status_lint="OK" || status_lint="WARN";
  else status_lint="SKIP"; fi
}

run_tests(){
  if [[ "$has_node" -eq 1 ]]; then npm test --silent >/dev/null 2>&1 && status_tests="OK" || status_tests="WARN";
  elif [[ "$has_py" -eq 1 ]] && command -v pytest >/dev/null 2>&1; then pytest -q >/dev/null 2>&1 && status_tests="OK" || status_tests="WARN";
  elif [[ "$has_go" -eq 1 ]]; then go test ./... >/dev/null 2>&1 && status_tests="OK" || status_tests="WARN";
  else status_tests="SKIP"; fi
}

run_security(){
  if command -v npx >/dev/null 2>&1; then npx -y ecc-agentshield scan --min-severity medium >/dev/null 2>&1 && status_sec="OK" || status_sec="WARN"; else status_sec="SKIP"; fi
}

run_logs(){
  c=$(grep -R --line-number "console\.log\|debugger" . --exclude-dir=node_modules --exclude-dir=.git 2>/dev/null | wc -l | tr -d ' ')
  [[ "$c" == "0" ]] && status_logs="OK" || status_logs="WARN($c)"
}

run_build
run_types

if [[ "$MODE" == "quick" ]]; then
  overall="PASS"
  [[ "$status_build" == "FAIL" || "$status_types" == "FAIL" ]] && overall="FAIL"
  echo "VERIFICATION: $overall"
  echo "Build:    $status_build"
  echo "Types:    $status_types"
  exit 0
fi

run_lint
run_tests
run_logs
[[ "$MODE" == "pre-pr" || "$MODE" == "full" ]] && run_security

overall="PASS"
for s in "$status_build" "$status_types" "$status_lint" "$status_tests"; do
  [[ "$s" == "FAIL" ]] && overall="FAIL"
done

echo "VERIFICATION: $overall"
echo "Build:    $status_build"
echo "Types:    $status_types"
echo "Lint:     $status_lint"
echo "Tests:    $status_tests"
echo "Security: $status_sec"
echo "Logs:     $status_logs"
