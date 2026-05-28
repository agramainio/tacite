# Tacite architecture

## Preferred V0 stack

- Flutter mobile app
- FastAPI backend
- PostgreSQL database
- Scalingo HDS as default hosting provider
- Clever Cloud HDS as alternative provider
- encrypted local storage / offline cache
- backend AI extraction endpoint later
- text/PDF export later
- HealthKit and Health Connect later

## Current technical spike

The current app uses:

- Flutter
- FastAPI
- PostgreSQL
- Alembic
- local email-code auth
- localization support
- raw note and timeline persistence

This is a useful technical spike, not the final product direction.

## Hosting direction

Default:

- Scalingo HDS
- managed PostgreSQL within the same hosting/compliance perimeter where possible

Alternative:

- Clever Cloud HDS
- managed PostgreSQL within the same hosting/compliance perimeter where possible

## Compliance note

HDS hosting alone does not make Tacite legally compliant.

Before public launch, Tacite needs:

- legal/hosting review
- privacy notice
- legal basis review
- processor agreements
- subprocessor list
- deletion/export process
- retention policy
- security review
- likely DPIA review
- AI provider review if AI is enabled

## Authentication direction

Long-term preferred direction:

- no mandatory real name
- no mandatory email
- generated private profile ID
- local app lock
- recovery key
- optional email/passkey later

Current spike:

- email-code auth exists for local development

This must not become the final product identity assumption without review.

## Local-first direction

Tacite should eventually support capture without network.

Local behavior:

- quick note capture
- quick snapshot
- recent timeline view
- unsynced record queue

Sync behavior:

- records sync to backend
- raw notes are never silently overwritten
- conflict handling is conservative
- export/delete must be available

## Security direction

- no raw notes in logs
- no note content analytics
- encrypted local storage
- ownership checks on every backend route
- no ad model
- no sale of user data
- careful export handling
