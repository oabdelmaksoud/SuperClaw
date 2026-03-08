#!/usr/bin/env bash
set -euo pipefail

VERSION="0.4.1"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_SRC="$ROOT/skills"
GLOBAL_SKILLS_DIR="$HOME/.openclaw/skills"
RUNTIME_TARGET="$HOME/.openclaw/ecc-runtime"
MCP_CONFIG="$HOME/.openclaw/workspace/config/mcporter.json"
CONFIG_FILE="$HOME/.openclaw/superclaw-config.json"
BACKUP_DIR="$HOME/.openclaw/backups"

# Defaults
NONINTERACTIVE="${NONINTERACTIVE:-0}"
PROFILE="${PROFILE:-standard}"
DO_SKILLS=1
DO_RUNTIME=1
DO_MCP=1
DO_VALIDATE=1
DRY_RUN=0
MODE="install"
SKILL_FAMILIES="ecc-cmd,ecc-role,ecc,ecc-agency,ecc-claude,ecc-anthropic"

say(){ printf "%s\n" "$*"; }
warn(){ printf "⚠️ %s\n" "$*"; }
ok(){ printf "✅ %s\n" "$*"; }
step(){ printf "➜ %s\n" "$*"; }
spinner(){
  local pid=$1 char i=0
  while kill -0 $pid 2>/dev/null; do
    printf "\r%c" "${chars:i++%${#chars}:1}"
    sleep 0.1
  done
  printf "\r"
}
chars='|/-\'

load_config(){
  if [[ -f "$CONFIG_FILE" ]]; then
    NONINTERACTIVE=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('NONINTERACTIVE','0'))" 2>/dev/null || echo "0")
    PROFILE=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('PROFILE','standard'))" 2>/dev/null || echo "standard")
    SKILL_FAMILIES=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('SKILL_FAMILIES','ecc-cmd,ecc-role,ecc,ecc-agency,ecc-claude,ecc-anthropic'))" 2>/dev/null || echo "ecc-cmd,ecc-role,ecc,ecc-agency,ecc-claude,ecc-anthropic")
  fi
}

save_config(){
  python3 - <<PY
import json
cfg={'NONINTERACTIVE':'$NONINTERACTIVE','PROFILE':'$PROFILE','SKILL_FAMILIES':'$SKILL_FAMILIES'}
json.dump(cfg,open('$CONFIG_FILE','w'),indent=2)
PY
}

usage(){
  cat <<EOF
SuperClaw Install Wizard v$VERSION

Usage:
  bash scripts/install-wizard.sh [options]

Options:
  --non-interactive           No prompts; use saved config or defaults
  --profile <name>           MCP profile: minimal|standard|strict (default: standard)
  --families <list>         Comma-separated skill families to install
  --skip-skills              Do not install skills
  --skip-runtime             Do not sync runtime assets
  --skip-mcp                 Do not apply MCP profile
  --skip-validate            Do not run validation checks
  --dry-run                  Print actions without applying changes
  --status                   Print install/status summary and exit
  --uninstall                Remove installed SuperClaw assets
  --version-check            Check for newer SuperClaw version
  -h, --help                Show this help

Config:
  --save-config              Save current options as defaults
  Config file: $CONFIG_FILE

Examples:
  bash scripts/install-wizard.sh                              # interactive
  NONINTERACTIVE=1 bash scripts/install-wizard.sh             # non-interactive
  bash scripts/install-wizard.sh --families ecc-cmd,ecc-role   # selective families
  bash scripts/install-wizard.sh --version-check             # check for updates
EOF
}

ask(){
  local prompt="$1" default="${2:-y}" ans
  if [[ "$NONINTERACTIVE" == "1" ]]; then
    ans="$default"
  else
    read -r -p "$prompt [y/n] (default: $default): " ans || true
    ans="${ans:-$default}"
  fi
  [[ "$ans" =~ ^[Yy]$ ]]
}

run(){
  if [[ "$DRY_RUN" == "1" ]]; then
    say "[dry-run] $*"
  else
    eval "$@"
  fi
}

version_check(){
  say "🔍 Checking for SuperClaw updates..."
  LATEST="$VERSION"
  say "- Current version: $VERSION"
  say "- Latest known: $LATEST"
  if [[ "$VERSION" == "$LATEST" ]]; then
    ok "You are on the latest version!"
  else
    warn "A newer version ($LATEST) is available."
    say "Run: git fetch origin && git pull origin main"
  fi
}

backup(){
  local ts=$(date +%Y%m%d-%H%M%S)
  mkdir -p "$BACKUP_DIR"
  if [[ -d "$GLOBAL_SKILLS_DIR" ]]; then
    run "cp -r '$GLOBAL_SKILLS_DIR' '$BACKUP_DIR/skills-$ts'"
    ok "Backed up skills to $BACKUP_DIR/skills-$ts"
  fi
}

status(){
  say "📊 SuperClaw status (v$VERSION)"
  local skill_count=0
  [[ -d "$GLOBAL_SKILLS_DIR" ]] && skill_count=$(find "$GLOBAL_SKILLS_DIR" -maxdepth 1 -mindepth 1 -type d -name 'ecc-*' | wc -l | tr -d ' ')
  say "- Skills: $GLOBAL_SKILLS_DIR (ecc-* count: $skill_count)"
  say "- Runtime: $RUNTIME_TARGET ($( [[ -d "$RUNTIME_TARGET" ]] && echo present || echo missing ))"
  say "- MCP: $MCP_CONFIG ($( [[ -f "$MCP_CONFIG" ]] && echo present || echo missing ))"
  [[ -f "$CONFIG_FILE" ]] && say "- Config: $CONFIG_FILE (saved preferences)"
  command -v openclaw >/dev/null 2>&1 && {
    openclaw skills info ecc-cmd-plan >/dev/null 2>&1 && ok "Skill check: ecc-cmd-plan ready" || warn "Skill check failed"
  } || warn "openclaw CLI not found"
}

uninstall(){
  say "🧹 SuperClaw uninstall"
  [[ -d "$GLOBAL_SKILLS_DIR" ]] && { run "find '$GLOBAL_SKILLS_DIR' -maxdepth 1 -mindepth 1 -type d -name 'ecc-*' -exec rm -rf {} +"; ok "Removed ecc-* skills"; }
  [[ -d "$RUNTIME_TARGET" ]] && { run "rm -rf '$RUNTIME_TARGET'"; ok "Removed runtime assets"; }
  [[ -f "$MCP_CONFIG" ]] && { run "rm -f '$MCP_CONFIG'"; ok "Removed MCP config"; }
  say "Done."
}

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --non-interactive) NONINTERACTIVE=1 ;;
    --profile) PROFILE="${2:-}"; shift ;;
    --families) SKILL_FAMILIES="${2:-}"; shift ;;
    --skip-skills) DO_SKILLS=0 ;;
    --skip-runtime) DO_RUNTIME=0 ;;
    --skip-mcp) DO_MCP=0 ;;
    --skip-validate) DO_VALIDATE=0 ;;
    --dry-run) DRY_RUN=1 ;;
    --status) MODE="status" ;;
    --uninstall) MODE="uninstall" ;;
    --version-check) MODE="version-check" ;;
    --save-config) MODE="save-config" ;;
    -h|--help) usage; exit 0 ;;
    *) warn "Unknown: $1"; usage; exit 1 ;;
  esac
  shift
done

load_config

case "$MODE" in
  status) status; exit 0 ;;
  version-check) version_check; exit 0 ;;
  uninstall) uninstall; exit 0 ;;
  save-config) save_config; ok "Config saved to $CONFIG_FILE"; exit 0 ;;
esac

say "🧩 SuperClaw Install Wizard v$VERSION"
say "Source: $ROOT"

[[ ! -d "$SKILLS_SRC" ]] && { say "❌ skills/ not found at $SKILLS_SRC"; exit 1; }

# Backup before install
if [[ "$DO_SKILLS" == "1" || "$DO_RUNTIME" == "1" ]]; then
  if [[ "$NONINTERACTIVE" == "1" ]] || ask "Create backup before install?" y; then
    backup
  fi
fi

# Install skills (selective families, parallel)
if [[ "$DO_SKILLS" == "1" ]]; then
  if [[ "$NONINTERACTIVE" == "1" ]] || ask "Install SuperClaw skills? (families: $SKILL_FAMILIES)" y; then
    run "mkdir -p '$GLOBAL_SKILLS_DIR'"
    for fam in $(echo "$SKILL_FAMILIES" | tr ',' ' '); do
      src="$SKILLS_SRC/$fam"
      if [[ -d "$src" ]]; then
        step "Installing $fam..."
        run "rsync -a --delete '$src/' '$GLOBAL_SKILLS_DIR/'" &
      fi
    done
    wait
    ok "Skills installed ($(find "$GLOBAL_SKILLS_DIR" -maxdepth 1 -mindepth 1 -type d -name 'ecc-*' | wc -l | tr -d ' '))"
  fi
fi

# Runtime assets (parallel)
if [[ "$DO_RUNTIME" == "1" ]]; then
  if [[ "$NONINTERACTIVE" == "1" ]] || ask "Install runtime assets?" y; then
    run "mkdir -p '$RUNTIME_TARGET'"
    step "Syncing contexts..."
    run "rsync -a --delete '$ROOT/contexts/' '$RUNTIME_TARGET/contexts/'" &
    step "Syncing hooks..."
    run "rsync -a --delete '$ROOT/hooks/' '$RUNTIME_TARGET/hooks/'" &
    step "Syncing mcp-configs..."
    run "rsync -a --delete '$ROOT/mcp-configs/' '$RUNTIME_TARGET/mcp-configs/'" &
    step "Syncing schemas..."
    run "rsync -a --delete '$ROOT/schemas/' '$RUNTIME_TARGET/schemas/'" &
    wait
    ok "Runtime assets synced"
  fi
fi

# MCP profile
if [[ "$DO_MCP" == "1" ]] && command -v mcporter >/dev/null 2>&1; then
  if [[ "$NONINTERACTIVE" == "1" ]] || ask "Apply MCP profile ($PROFILE)?" y; then
    run "bash '$ROOT/scripts/apply-mcporter-profile.sh' '$PROFILE'"
    ok "MCP profile '$PROFILE' applied"
  fi
fi

# Validation
if [[ "$DO_VALIDATE" == "1" ]]; then
  say "🔎 Running validation..."
  command -v openclaw >/dev/null 2>&1 && {
    openclaw skills info ecc-cmd-plan >/dev/null 2>&1 && ok "Skill check: ecc-cmd-plan ready" || warn "Skill check failed"
  }
  if [[ "$DRY_RUN" == "0" ]]; then
    bash "$ROOT/scripts/run-compat-smoke.sh" >/dev/null 2>&1 && ok "Compat smoke passed" || warn "Compat smoke had issues"
  fi
fi

say "🎉 Install complete!"
[[ "$CONFIG_FILE" != "" ]] && say "Config saved to $CONFIG_FILE (use --save-config to update)"
