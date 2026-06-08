# Tacite private staging deployment

This document describes a private staging deployment for testing Tacite on a phone.

This is not production readiness.

Do not enter real sensitive health data in this staging environment yet.

## Current target

Use two deployable apps:

- `tacite-api-staging`: FastAPI backend
- `tacite-web-staging`: Flutter web frontend

## Backend app

Runtime:

- FastAPI
- Uvicorn
- PostgreSQL
- Alembic migrations

Required environment variables:

- `APP_ENV=staging`
- `APP_NAME=tacite-api-staging`
- `AUTH_SECRET_KEY=<strong random secret>`
- `DATABASE_URL=<provider postgres url>`
- `CORS_ALLOWED_ORIGINS=https://<frontend-domain>`
- `LOGIN_CODE_TTL_MINUTES=10`
- `SESSION_TTL_DAYS=30`

Notes:

- Never reuse the local dev `AUTH_SECRET_KEY`.
- Never commit `.env`.
- Keep docs disabled outside local mode unless explicitly needed.

## Backend release steps

1. Provision PostgreSQL.
2. Set environment variables.
3. Deploy backend.
4. Run Alembic migrations.
5. Verify `/health`.

## Frontend app

Flutter web build command:

    flutter build web --release --dart-define=INTERIM_API_BASE_URL=https://<backend-domain>

The frontend must be served from a private/staging URL.

The backend `CORS_ALLOWED_ORIGINS` must include the exact frontend origin.

## Manual smoke test

1. Open frontend URL on phone.
2. Request login code.
3. Verify login.
4. Record one timeline entry.
5. Open Summary so far.
6. Return to timeline.
7. Confirm the timeline is preserved.
8. Confirm private/spoilered text behavior.
9. Confirm “Keep out of summary” excludes the entry.

## Not production-ready until

- security logging review
- privacy notice
- data export/delete
- backup/restore plan
- staging/prod separation
- HDS/provider review
- AI data-flow review, if AI is enabled later
