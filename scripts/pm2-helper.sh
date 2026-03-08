#!/usr/bin/env bash
set -euo pipefail
action="${1:-status}"
target="${2:-all}"

if ! command -v pm2 >/dev/null 2>&1; then
  echo "pm2 not installed"
  exit 1
fi

case "$action" in
  status)
    pm2 status
    ;;
  logs)
    pm2 logs "$target" --lines 100
    ;;
  restart)
    pm2 restart "$target"
    pm2 status
    ;;
  stop)
    pm2 stop "$target"
    pm2 status
    ;;
  start)
    echo "Provide a PM2 ecosystem file or command target manually."
    exit 2
    ;;
  *)
    echo "Usage: $0 {status|logs|restart|stop|start} [target]"
    exit 1
    ;;
esac
