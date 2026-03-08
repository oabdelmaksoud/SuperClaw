---
name: deployment-patterns
description: Deployment workflows, CI/CD pipeline patterns, Docker containerization, health checks, rollback strategies, and production readiness checklists for web applications.
origin: ECC
---

# Deployment Patterns

Production deployment workflows and CI/CD best practices.

## When to Activate

- Setting up CI/CD pipelines
- Dockerizing an application
- Planning deployment strategy (blue-green, canary, rolling)
- Implementing health checks and readiness probes
- Preparing for a production release
- Configuring environment-specific settings

## Deployment Strategies

### Rolling Deployment (Default)

Replace instances gradually — old and new versions run simultaneously during rollout.

```
Instance 1: v1 → v2  (update first)
Instance 2: v1        (still running v1)
Instance 3: v1        (still running v1)

Instance 1: v2
Instance 2: v1 → v2  (update second)
Instance 3: v1

Instance 1: v2
Instance 2: v2
Instance 3: v1 → v2  (update last)
```

**Pros:** Zero downtime, gradual rollout
**Cons:** Two versions run simultaneously — requires backward-compatible changes
**Use when:** Standard deployments, backward-compatible changes

### Blue-Green Deployment

Run two identical environments. Switch traffic atomically.

```
Blue  (v1) ← traffic
Green (v2)   idle, running new version

# After verification:
Blue  (v1)   idle (becomes standby)
Green (v2) ← traffic
```

**Pros:** Instant rollback (switch back to blue), clean cutover
**Cons:** Requires 2x infrastructure during deployment
**Use when:** Critical services, zero-tolerance for issues

### Canary Deployment

Route a small percentage of traffic to the new version first.

```
v1: 95% of traffic
v2:  5% of traffic  (canary)

# If metrics look good:
v1: 50% of traffic
v2: 50% of traffic

# Final:
v2: 100% of traffic
```

**Pros:** Catches issues with real traffic before full rollout
**Cons:** Requires traffic splitting infrastructure, monitoring
**Use when:** High-traffic services, risky changes, feature flags

## Docker

### Multi-Stage Dockerfile (Node.js)

```dockerfile
# Stage 1: Install dependencies
FROM node:22-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --production=false

# Stage 2: Build
FROM node:22-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build
RUN npm prune --production

# Stage 3: Production image
FROM node:22-alpine AS runner
WORKDIR /app

RUN addgroup -g 1001 -S appgroup && adduser -S appuser -u 1001
USER appuser

COPY --from=builder --chown=appuser:appgroup /app/node_modules ./node_modules
COPY --from=builder --chown=appuser:appgroup /app/dist ./dist
COPY --from=builder --chown=appuser:appgroup /app/package.json ./

ENV NODE_ENV=production
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

CMD ["node", "dist/server.js"]
```

### Multi-Stage Dockerfile (Go)

```dockerfile
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /server ./cmd/server

FROM alpine:3.19 AS runner
RUN apk --no-cache add ca-certificates
RUN adduser -D -u 1001 appuser
USER appuser

COPY --from=builder /server /server

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8080/health || exit 1
CMD ["/server"]
```

### Multi-Stage Dockerfile (Python/Django)

```dockerfile
FROM python:3.12-slim AS builder
WORKDIR /app
RUN pip install --no-cache-dir uv
COPY requirements.txt .
RUN uv pip install --system --no-cache -r requirements.txt

FROM python:3.12-slim AS runner
WORKDIR /app

RUN useradd -r -u 1001 appuser
USER appuser

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY . .

ENV PYTHONUNBUFFERED=1
EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health/')" || exit 1
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "4"]
```

### Docker Best Practices

```
# GOOD practices
- Use specific version tags (node:22-alpine, not node:latest)
- Multi-stage builds to minimize image size
- Run as non-root user
- Copy dependency files first (layer caching)
- Use .dockerignore to exclude node_modules, .git, tests
- Add HEALTHCHECK instruction
- Set resource limits in docker-compose or k8s

# BAD practices
- Running as root
- Using :latest tags
- Copying entire repo in one COPY layer
- Installing dev dependencies in production image
- Storing secrets in image (use env vars or secrets manager)
```

## CI/CD Pipeline

### GitHub Actions (Standard Pipeline)

```yaml
name: CI/CD

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: npm
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck
      - run: npm test -- --coverage
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: coverage
          path: coverage/

  build:
