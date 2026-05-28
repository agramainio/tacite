# interim

Private mental-health preparation and treatment-change memory app.

`interim` is a working codename.

The app helps users capture messy notes about mental-health experiences, treatment changes, symptoms, side effects, functioning, questions, and appointment concerns, then turn those notes into a clear timeline and editable appointment summary.

It is not:
- a medication reminder app
- a productivity app
- an AI therapist
- a diagnosis app
- a medical advice app
- an emergency service

Core stack:

- Flutter mobile app
- FastAPI backend
- Scalingo HDS hosting
- PostgreSQL
- AI extraction only as explicit opt-in

Core product rule:

The original note is sacred. AI may format or summarize only when the user chooses it.


## Local development

See:

    docs/LOCAL_DEVELOPMENT.md


## Tacite product documentation

Tacite product source of truth:

    docs/tacite/

The current Flutter/FastAPI implementation is a technical spike until the Tacite product foundation is fully implemented.


## Product name

The user-facing product name is Tacite.

Current technical folder/package names may still contain `interim` while the product is being reset. Do not treat technical names as product copy.
