#!/usr/bin/env bash
set -euo pipefail
OUT="${1:-AGENT_SCENARIO_MATRIX.md}"

roles=(
  ecc-role-planner
  ecc-role-architect
  ecc-role-code-reviewer
  ecc-role-security-reviewer
  ecc-role-refactor-cleaner
  ecc-role-loop-operator
  ecc-role-chief-of-staff
  ecc-role-python-reviewer
)

pass=0
fail=0

echo "# Agent Scenario Matrix (Role Skills)" > "$OUT"
echo >> "$OUT"

echo "## Global Readiness Sweep" >> "$OUT"

total=$(find ~/.openclaw/skills -maxdepth 1 -type d -name 'ecc-role-*' | wc -l | tr -d ' ')
ready=0
bad=""
for r in $(find ~/.openclaw/skills -maxdepth 1 -type d -name 'ecc-role-*' -exec basename {} \; | sort); do
  if openclaw skills info "$r" >/tmp/role_info.txt 2>&1; then
    if grep -q "✓ Ready" /tmp/role_info.txt; then
      ready=$((ready+1))
    else
      bad+="$r "
    fi
  else
    bad+="$r "
  fi
done

if [[ "$ready" == "$total" ]]; then
  echo "- Result: PASS ($ready/$total ready)" >> "$OUT"; pass=$((pass+1))
else
  echo "- Result: FAIL ($ready/$total ready; bad: $bad)" >> "$OUT"; fail=$((fail+1))
fi

echo >> "$OUT"
echo "## Scenario Cases" >> "$OUT"
echo >> "$OUT"

scenario(){
  id="$1"; role="$2"; given="$3"; when="$4"; then_pat="$5"
  echo "### $id" >> "$OUT"
  printf '%s\n' "- Role: $role" >> "$OUT"
  echo "- Given: $given" >> "$OUT"
  echo "- When: $when" >> "$OUT"
  set +e
  info=$(openclaw skills info "$role" 2>&1)
  code=$?
  set -e
  st="FAIL"
  if [[ $code -eq 0 ]] && echo "$info" | grep -Eiq "$then_pat"; then st="PASS"; fi
  [[ "$st" == "PASS" ]] && pass=$((pass+1)) || fail=$((fail+1))
  printf '%s\n' "- Then: expect pattern: $then_pat" >> "$OUT"
  echo "- Result: $st" >> "$OUT"
  echo '```' >> "$OUT"
  echo "$info" | sed -n '1,20p' >> "$OUT"
  echo '```' >> "$OUT"
  echo >> "$OUT"
}

scenario "S1 Planning delegation" "ecc-role-planner" \
  "Complex feature requires phased implementation plan" \
  "Inspect planner role skill" \
  "planner|Ready"

scenario "S2 Architecture delegation" "ecc-role-architect" \
  "Need system design + tradeoff decisions" \
  "Inspect architect role skill" \
  "architect|tradeoff|Ready"

scenario "S3 Code review delegation" "ecc-role-code-reviewer" \
  "Need severity-ranked code findings" \
  "Inspect code-reviewer role skill" \
  "code-reviewer|Ready"

scenario "S4 Security review delegation" "ecc-role-security-reviewer" \
  "Need threat-focused review" \
  "Inspect security-reviewer role skill" \
  "security-reviewer|Ready"

scenario "S5 Refactor delegation" "ecc-role-refactor-cleaner" \
  "Need behavior-preserving cleanup" \
  "Inspect refactor-cleaner role skill" \
  "refactor-cleaner|Ready"

scenario "S6 Loop operation delegation" "ecc-role-loop-operator" \
  "Need bounded iterative execution control" \
  "Inspect loop-operator role skill" \
  "loop-operator|Ready"

scenario "S7 Cross-workstream coordination" "ecc-role-chief-of-staff" \
  "Need prioritization and execution coordination" \
  "Inspect chief-of-staff role skill" \
  "chief-of-staff|Ready"

scenario "S8 Python review specialization" "ecc-role-python-reviewer" \
  "Need Python quality/correctness review" \
  "Inspect python-reviewer role skill" \
  "python-reviewer|Ready"

# Structural scenario: ensure each role skill includes required sections

echo "### S9 Role skill structure conformance" >> "$OUT"
missing=""
for f in skills/ecc-role-*/SKILL.md; do
  grep -q "## Role Workflow" "$f" || missing+="$(basename $(dirname "$f")):RoleWorkflow "
  grep -q "## Deliverable Format" "$f" || missing+="$(basename $(dirname "$f")):DeliverableFormat "
done
if [[ -z "$missing" ]]; then
  echo "- Result: PASS" >> "$OUT"; pass=$((pass+1))
else
  echo "- Result: FAIL ($missing)" >> "$OUT"; fail=$((fail+1))
fi

echo >> "$OUT"
echo "## Summary" >> "$OUT"
echo "- Passed: $pass" >> "$OUT"
echo "- Failed: $fail" >> "$OUT"
