#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UPSTREAM_DIR="${1:-/tmp/everything-claude-code}"

if [[ ! -d "$UPSTREAM_DIR/.git" ]]; then
  git clone --depth 1 https://github.com/affaan-m/everything-claude-code "$UPSTREAM_DIR"
fi

git -C "$UPSTREAM_DIR" fetch origin --quiet
git -C "$UPSTREAM_DIR" rev-parse HEAD > "$ROOT/upstream/SOURCE_PIN.txt"

python3 - <<PY
from pathlib import Path
import json
root=Path("$ROOT")
up=Path("$UPSTREAM_DIR")
report={"upstream_head":(up/'.git').exists(),"counts":{}}
report["counts"]["upstream_skills"]=len(list((up/'skills').glob('*')))
report["counts"]["ported_skills"]=len([p for p in (root/'skills').glob('ecc-*') if p.is_dir()])
(root/'upstream'/'SYNC_REPORT.json').write_text(json.dumps(report,indent=2))
print("Wrote upstream/SYNC_REPORT.json")
PY
