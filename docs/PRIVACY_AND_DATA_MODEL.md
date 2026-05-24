# Privacy and data model

## Privacy stance

No real name required.

Do not describe the app as anonymous if email login or cloud sync is used.

Preferred wording:

No real name required. Use a nickname or an email you control so the app can keep your records linked to your account.

## Sensitive data stance

The app records mental-health notes, symptoms, treatment changes, side effects, functioning, questions, appointment concerns, and related context.

This must be treated as sensitive health-related data.

The app does not try to avoid health-data obligations by avoiding real medication names.

Users may use medication labels that make sense to them, but the record may still reveal health information through context.

## Data minimization

Collect only what is needed for the product purpose.

Avoid:

- real name
- birth date unless absolutely necessary
- address
- social security number
- doctor identity unless user explicitly writes it
- unnecessary analytics
- device identifiers for marketing
- ad tracking

## Core data layers

- profile
- preparation thread
- raw note
- AI extraction draft
- user-approved timeline event
- symptom snapshot
- side-effect observation
- functioning snapshot
- summary export
- safety flag

## Ownership rule

Every sensitive record must be owned by a user or profile.

Every sensitive record must be reachable through a preparation thread owned by that user.

No endpoint may read or write sensitive data without verifying ownership.

## Logging rule

Never log:

- raw notes
- AI prompts containing user notes
- AI responses containing user notes
- medication labels
- side effect notes
- summaries
- safety flags
- email login codes

Logs may contain:

- request id
- route name
- status code
- timing
- user id hash if needed
- error class

## Export rule

The user must be able to export their own records.

Export must be reviewable before download or copy.

Raw notes are included only if the user chooses.

## Deletion rule

The user must be able to delete their account and records.

Deletion behavior must be documented before launch.

## Local storage

Use encrypted local storage for auth/session data.

Local drafts are allowed only if encrypted or clearly controlled by the user.

The app must include a clear “delete local data” option.
