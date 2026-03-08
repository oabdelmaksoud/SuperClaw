#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SUITE="${1:-$ROOT/tests/acceptance/core20.json}"

if [[ ! -f "$SUITE" ]]; then
  echo "missing suite: $SUITE"
  exit 1
fi

# parse with python to avoid jq dependency
python3 - <<PY
import json, subprocess, sys
suite = json.load(open("$SUITE"))
skills = suite.get("skills", [])
missing=[]
for s in skills:
    r = subprocess.run(["openclaw","skills","info",s], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if r.returncode != 0 or "Ready" not in r.stdout:
        missing.append(s)
if missing:
    print("ACCEPTANCE: FAIL")
    print("Missing/Not ready:")
    for m in missing:
        print("-",m)
    sys.exit(1)
print("ACCEPTANCE: PASS")
print(f"Validated skills: {len(skills)}")
PY
