#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_SRC="$ROOT/skills"
GLOBAL_SKILLS_DIR="$HOME/.openclaw/skills"
RUNTIME_TARGET="$HOME/.openclaw/ecc-runtime"
MCP_CONFIG="$HOME/.openclaw/workspace/config/mcporter.json"

say(){ printf "%s\n" "$*"; }
ask(){
  local prompt="$1" default="${2:-y}" ans
  if [[ "${NONINTERACTIVE:-0}" == "1" ]]; then
    ans="$default"
  else
    read -r -p "$prompt [y/n] (default: $default): " ans || true
    ans="${ans:-$default}"
  fi
  [[ "$ans" =~ ^[Yy]$ ]]
}

say "🧩 OpenClaw-ECC Install Wizard"
say "Source: $ROOT"

if [[ ! -d "$SKILLS_SRC" ]]; then
  say "❌ skills/ directory not found at $SKILLS_SRC"
  exit 1
fi

if ask "Install ECC skills globally for all workspaces?" y; then
  mkdir -p "$GLOBAL_SKILLS_DIR"
  rsync -a --delete "$SKILLS_SRC/" "$GLOBAL_SKILLS_DIR/"
  count=$(find "$GLOBAL_SKILLS_DIR" -maxdepth 1 -mindepth 1 -type d -name 'ecc-*' | wc -l | tr -d ' ')
  say "✅ Installed $count ECC skills to $GLOBAL_SKILLS_DIR"
else
  say "⏭ Skipped global skills install"
fi

if ask "Install runtime assets (contexts/hooks/mcp-configs/schemas)?" y; then
  mkdir -p "$RUNTIME_TARGET"
  rsync -a --delete "$ROOT/contexts/" "$RUNTIME_TARGET/contexts/"
  rsync -a --delete "$ROOT/hooks/" "$RUNTIME_TARGET/hooks/"
  rsync -a --delete "$ROOT/mcp-configs/" "$RUNTIME_TARGET/mcp-configs/"
  rsync -a --delete "$ROOT/schemas/" "$RUNTIME_TARGET/schemas/"
  say "✅ Runtime assets synced to $RUNTIME_TARGET"
else
  say "⏭ Skipped runtime assets"
fi

if command -v mcporter >/dev/null 2>&1; then
  if ask "Apply mcporter MCP profile now?" y; then
    profile="standard"
    if [[ "${NONINTERACTIVE:-0}" != "1" ]]; then
      read -r -p "Choose profile (minimal|standard|strict) [standard]: " p || true
      profile="${p:-standard}"
    fi
    bash "$ROOT/scripts/apply-mcporter-profile.sh" "$profile"
    say "✅ MCP profile '$profile' applied"
  else
    say "⏭ Skipped MCP profile apply"
  fi
else
  say "ℹ️ mcporter not found. Install with: npm i -g mcporter"
fi

if command -v openclaw >/dev/null 2>&1; then
  say "\n🔎 Quick validation"
  openclaw skills info ecc-cmd-plan >/dev/null 2>&1 && say "✅ Skill check: ecc-cmd-plan ready" || say "⚠️ Skill check failed (try /new then retry)"
  bash "$ROOT/scripts/run-compat-smoke.sh" >/dev/null 2>&1 && say "✅ Compat smoke passed" || say "⚠️ Compat smoke had warnings/failures"
else
  say "ℹ️ openclaw CLI not found in PATH; skip automatic validation"
fi

say "\n🎉 Wizard complete"
say "Next: start a new OpenClaw session (/new) to refresh skill list."
