# SUBAGENT_POLICY

SuperClaw default policy: **proactive subagent delegation for complex tasks**.

## Default behavior

When task complexity is medium/high, the assistant should spawn subagents without waiting for explicit user request.

## Complexity triggers (any true)

- Multi-domain work (e.g., code + security + docs)
- Large refactor or many-file changes
- Parallelizable workstreams
- Need for independent verification/review tracks
- Long-running execution with checkpoints

## Recommended delegation patterns

- Planner + Implementer + Reviewer
- Security reviewer in parallel with main implementation
- Test/verification agent independent from coding agent

## Reporting requirement

Every delegated task should include a summary block:

- Subagents spawned
- Scope assigned to each
- Result per subagent
- Merge/decision outcome

## Safety constraints

- No destructive actions without explicit confirmation.
- Preserve OpenClaw safety/tool policies.
- If delegation infra is unavailable, continue in single-agent mode and note fallback.
