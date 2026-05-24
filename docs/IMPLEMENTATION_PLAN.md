# Implementation plan

## Phase 0 — Project foundation

- Create repository.
- Create documentation.
- Define product boundary.
- Define medical boundary.
- Define privacy boundary.
- Define AI boundary.
- Define legal/hosting launch gate.

Checkpoint:

checkpoint-project-foundation-v1

## Phase 1 — Backend skeleton

- FastAPI app.
- Health endpoint.
- Version endpoint.
- pytest setup.
- ruff setup.
- local environment file example.

Checkpoint:

checkpoint-backend-skeleton-v1

## Phase 2 — Database foundation

- Local PostgreSQL with Docker.
- SQLAlchemy setup.
- Alembic setup.
- Initial tables:
  - profiles
  - preparation_threads
  - raw_notes
  - timeline_events

Checkpoint:

checkpoint-database-foundation-v1

## Phase 3 — Flutter skeleton

- Flutter app.
- Basic navigation.
- Calm UI foundation.
- API client.
- Secure storage.

Checkpoint:

checkpoint-flutter-skeleton-v1

## Phase 4 — Authentication

- Email code request.
- Email code verification.
- Session token.
- Current user endpoint.
- Logout.

Checkpoint:

checkpoint-auth-foundation-v1

## Phase 5 — Manual note-to-timeline loop

- Create thread.
- Add raw note.
- Manually create timeline event.
- View timeline.
- Export dated list.

Checkpoint:

checkpoint-manual-note-timeline-v1

## Phase 6 — AI opt-in draft extraction

- AI off by default.
- User chooses “format this note.”
- Backend creates AI extraction draft.
- User confirms, edits, or rejects.
- Confirmed draft becomes timeline event.

Checkpoint:

checkpoint-ai-draft-extraction-v1

## Phase 7 — Summary export

- Date range selection.
- Plain text export.
- Optional raw notes.
- PDF if simple enough.

Checkpoint:

checkpoint-doctor-export-v1

## Phase 8 — Scalingo deployment

- Create Scalingo HDS app.
- Add PostgreSQL.
- Configure environment variables.
- Deploy backend.
- Verify health endpoint.
- Verify logs do not contain sensitive data.

Checkpoint:

checkpoint-scalingo-deploy-v1
