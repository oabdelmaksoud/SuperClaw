#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail=0

for f in "$ROOT"/skills/ecc-claude-*/SKILL.md "$ROOT"/skills/ecc-agency-*/SKILL.md; do
  [[ -f "$f" ]] || continue
  for sec in "## Purpose" "## Trigger Conditions" "## When NOT to Use" "## Workflow" "## Output Format" "## Guardrails"; do
    if ! grep -q "$sec" "$f"; then
      echo "Missing section '$sec' in $(basename "$(dirname "$f")")"
      fail=1
    fi
  done
  if grep -qi "Replace with description" "$f"; then
    echo "Placeholder description in $(basename "$(dirname "$f")")"
    fail=1
  fi
  lines=$(wc -l < "$f" | tr -d ' ')
  if [[ "$lines" -gt 180 ]]; then
    echo "Warn: large SKILL.md ($lines lines) in $(basename "$(dirname "$f")")"
  fi
done

exit $fail
