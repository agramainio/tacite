# AI boundary

## Core rule

AI is optional.

AI is off by default.

AI is only used when the user proactively chooses to format or summarize their own notes.

The app must work without AI.

## If AI is off

The user can still:

- create threads
- add dated notes
- view a timeline
- export a chronological list of entries

If AI is off, the exported document is a dated list of entries.

No structured AI summary is generated.

## If AI is on for a note

AI may:

- format the note
- extract possible dates
- extract possible treatment events
- extract possible symptoms
- extract possible side effects
- extract possible functioning impact
- suggest categories
- prepare a draft appointment summary
- cautiously interpret emojis
- identify useful missing fields

AI must not:

- diagnose
- recommend treatment
- suggest medication changes
- infer causality
- invent symptoms
- invent dates
- overwrite user language
- hide the original note
- run silently in the background
- produce final summaries without user review

## Three-layer record

Every AI-assisted entry must preserve three layers:

1. Original user note.
2. AI-parsed draft fields.
3. User-approved cleaned summary.

The original note is sacred.

## Uncertainty

AI must mark uncertainty.

Example:

Original note:
ABC day 5. slept like shit 😵‍💫 but less dread.

AI draft:
- treatment label: ABC
- day: 5
- sleep: worse
- dread: improved
- emoji 😵‍💫: possible foggy, dizzy, overwhelmed, uncertain

Clean summary:
On day 5 of ABC, sleep was worse, but dread felt lower.

The user must be able to confirm, edit, or reject this.
