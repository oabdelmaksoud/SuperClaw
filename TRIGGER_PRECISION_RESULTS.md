# TRIGGER_PRECISION_RESULTS

- Samples: 15
- Exact-match proxy accuracy: 53.3%

| Prompt | Expected | Predicted | Match | Score |
|---|---|---|---|---|
| Plan a migration from SQLite to Postgres with rollback strategy | `ecc-cmd-plan` | `ecc-database-migrations` | ❌ | 3 |
| Run a pre-PR verification on this repo | `ecc-cmd-verify` | `ecc-springboot-verification` | ❌ | 2 |
| Do a strict quality gate with fixes | `ecc-cmd-quality-gate` | `ecc-cmd-quality-gate` | ✅ | 3 |
| Review this diff and list blockers | `ecc-cmd-code-review` | `ecc-role-python-reviewer` | ❌ | 3 |
| Set up a red-green-refactor cycle for this bug | `ecc-cmd-tdd` | `ecc-role-tdd-guide` | ❌ | 2 |
| Scan this project for security issues | `ecc-security-scan` | `ecc-security-scan` | ✅ | 3 |
| I need a checkpoint update for handoff | `ecc-cmd-checkpoint` | `ecc-cmd-checkpoint` | ✅ | 3 |
| Coordinate backend/frontend tasks with dependencies | `ecc-cmd-orchestrate` | `ecc-role-tdd-guide` | ❌ | 2 |
| Start a bounded loop for iterative fixes | `ecc-cmd-loop-start` | `ecc-cmd-loop-start` | ✅ | 5 |
| Recommend model routing for fast cheap QA vs deep reviews | `ecc-cmd-model-route` | `ecc-cmd-model-route` | ✅ | 3 |
| Run go build checks and fix failures | `ecc-cmd-go-build` | `ecc-cmd-build-fix` | ❌ | 4 |
| Improve test coverage for critical paths | `ecc-cmd-test-coverage` | `ecc-cmd-go-test` | ❌ | 4 |
| Update docs to match current implementation | `ecc-cmd-update-docs` | `ecc-cmd-update-docs` | ✅ | 3 |
| Give me a Python code quality review | `ecc-cmd-python-review` | `ecc-cmd-python-review` | ✅ | 4 |
| Manage PM2 restart and show status | `ecc-cmd-pm2` | `ecc-cmd-pm2` | ✅ | 5 |
