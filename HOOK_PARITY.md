# Hook Parity Layer (v2)

## Objective
Provide OpenClaw-equivalent behavior for ECC hook intents.

## Event Mapping
- SessionStart -> context load + startup checks
- PreToolUse -> non-blocking safety reminders + optional policy blocks
- PostToolUse -> quality checks and async analysis
- Stop -> checkpoint + lightweight telemetry
- SessionEnd -> lifecycle marker

## Equivalence Levels
- Exact: when behavior maps directly
- Functional: same intent via different mechanism
- Deferred: runtime limitation; documented fallback

## Fallback Policy
If exact parity is unavailable, enforce functional parity via scripts in `scripts/` and documented operator workflows.
