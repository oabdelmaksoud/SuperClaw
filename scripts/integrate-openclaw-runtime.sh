#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$HOME/.openclaw/ecc-runtime"
mkdir -p "$TARGET"
rsync -a --delete "$ROOT/contexts/" "$TARGET/contexts/"
rsync -a --delete "$ROOT/hooks/" "$TARGET/hooks/"
rsync -a --delete "$ROOT/mcp-configs/" "$TARGET/mcp-configs/"
rsync -a --delete "$ROOT/schemas/" "$TARGET/schemas/"
echo "Integrated runtime assets at $TARGET"
