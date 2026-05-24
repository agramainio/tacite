# Technical stack

## Mobile app

- Flutter
- iOS and Android first
- PWA only later if secure local storage and privacy behavior are acceptable

## Backend

- Python
- FastAPI
- Pydantic
- SQLAlchemy 2.x
- Alembic
- pytest
- ruff

## Hosting

- Scalingo HDS for backend hosting
- Scalingo managed PostgreSQL
- No production user health data on non-HDS infrastructure

## Database

- PostgreSQL
- UUID primary keys
- `user_id` or `profile_id` ownership on sensitive tables
- strict backend ownership checks
- Postgres RLS later as defense-in-depth if practical
- Alembic migration for every schema change

## Authentication

- Backend-managed auth for V0
- Email magic link or one-time code
- No real name required
- Email used only as account identifier
- No health information in auth emails

## AI

- AI off by default
- AI opt-in per action
- Backend-only AI calls
- No AI provider call from Flutter
- No real user note sent to AI before legal/privacy review permits it
- If AI is unavailable or disabled, app still exports a dated list of entries

## Deployment

- GitHub repository for code only
- No secrets in GitHub
- No user data in GitHub
- No real user data in test fixtures
- Backend deployed to Scalingo
- Database hosted by Scalingo PostgreSQL
