#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STATE="$ROOT/.loop-state.json"
cmd="${1:-status}"

case "$cmd" in
  start)
    objective="${2:-unspecified objective}"
    max_iter="${3:-5}"
    cat > "$STATE" <<JSON
{"objective":"$objective","iteration":0,"max":$max_iter,"status":"running","last_result":"n/a"}
JSON
    echo "LOOP_STARTED objective='$objective' max=$max_iter"
    ;;
  tick)
    [[ -f "$STATE" ]] || { echo "No active loop"; exit 1; }
    iter=$(python3 - <<PY
import json; s=json.load(open('$STATE')); print(s['iteration']+1)
PY
)
    python3 - <<PY
import json
p='$STATE'
s=json.load(open(p)); s['iteration']=int(s['iteration'])+1
json.dump(s, open(p,'w'))
print('LOOP_TICK', s['iteration'])
PY
    ;;
  status)
    [[ -f "$STATE" ]] && cat "$STATE" || echo '{"status":"idle"}'
    ;;
  stop)
    [[ -f "$STATE" ]] || { echo "No active loop"; exit 0; }
    python3 - <<PY
import json
p='$STATE'
s=json.load(open(p)); s['status']='stopped'
json.dump(s, open(p,'w'))
print('LOOP_STOPPED')
PY
    ;;
  *)
    echo "Usage: $0 {start <objective> <max>|tick|status|stop}"
    exit 1
    ;;
esac
