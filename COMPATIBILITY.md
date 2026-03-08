# COMPATIBILITY

## Targets
- OpenClaw main runtime
- OpenClaw skill loading conventions

## Parity model
- **Full parity**: equivalent behavior in OpenClaw
- **Workflow parity**: behavior achievable via OpenClaw patterns (not 1:1 command)
- **Partial**: reduced scope due to harness differences
- **N/A**: intentionally not ported

## Known harness differences
- Slash-command semantics differ across harnesses
- Hook lifecycle/events are not 1:1 across systems
- Some upstream agent orchestration assumptions require OpenClaw-native adaptation

## Policy
When exact parity is impossible, prefer explicit workflow documentation over silent behavior changes.
