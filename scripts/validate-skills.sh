#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail=0
for s in "$ROOT"/skills/*; do
  [[ -d "$s" ]] || continue
  if [[ ! -f "$s/SKILL.md" ]]; then
    echo "Missing SKILL.md in $(basename "$s")"
    fail=1
    continue
  fi
  if ! grep -q '^name:' "$s/SKILL.md"; then
    echo "Missing name frontmatter in $(basename "$s")"
    fail=1
  fi
  if ! grep -q '^description:' "$s/SKILL.md"; then
    echo "Missing description frontmatter in $(basename "$s")"
    fail=1
  fi
done
exit $fail
