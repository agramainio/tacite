# Legal and hosting review

## Status

Required before launch.

This document is a launch gate.

The app may be developed with fake data before this review is complete.

The app must not launch publicly with real user health-related records before this review is complete.

## Why this is required

The app records mental-health experiences, symptoms, treatment changes, side effects, functioning, and appointment-preparation notes.

Even when users use nicknames, aliases, or private medication labels, these records may reveal information about a person's physical or mental health.

The app also uses cloud/backend storage, so it is not purely local personal note-taking.

## Launch gate

Before any public launch or beta with real users, complete and document:

1. Hosting review
2. Legal basis review
3. Privacy notice
4. Data processing register
5. Data retention policy
6. Export and deletion policy
7. Security review
8. Incident-response plan
9. AI-processing review
10. Subprocessor review
11. App-store privacy review
12. Terms / medical boundary review

## Hosting review

Confirm:

- Scalingo HDS contract is active.
- The exact backend service is deployed under the correct HDS-covered setup.
- PostgreSQL is covered by the selected hosting arrangement.
- Backups are covered.
- Logs are covered.
- Build/deploy logs do not contain health data.
- No production health data is stored on GitHub, local machines, Hetzner, Firebase, Supabase, analytics tools, or non-approved services.

## AI processing review

AI must remain disabled for real production notes until reviewed.

Confirm:

- Whether the AI provider may process sensitive health-related notes.
- Whether the AI provider must be HDS or otherwise contractually acceptable.
- Whether data leaves the EU/EEA.
- Whether data is retained by the provider.
- Whether prompts/responses are used for training.
- Whether a data-processing agreement exists.
- Whether user consent and privacy notice cover this processing.
- Whether AI can be limited to minimized text.

If unresolved, production AI remains off.

The app still works without AI by exporting a dated list of entries.

## Privacy review

Confirm:

- No real name required.
- Email is used only as account identifier.
- No unnecessary personal data is collected.
- No ad trackers.
- No analytics on note content.
- Crash reporting does not include raw notes.
- User can export data.
- User can delete data.
- Retention periods are documented.
- Consent and notices are understandable.

## Security review

Confirm:

- HTTPS only.
- Secure session handling.
- Encrypted local token storage.
- Passwordless login code expiry.
- Rate limiting on auth endpoints.
- No raw notes in logs.
- No secrets in repository.
- Database access restricted.
- Backups protected.
- Admin access restricted.
- Incident process documented.

## Release rule

No public launch is allowed until this file has been reviewed and marked complete.

Required launch status:

- Hosting review: complete
- Privacy review: complete
- AI review: complete or AI disabled
- Security review: complete
- Medical boundary review: complete
