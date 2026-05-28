# Tacite implementation plan

## Current status

The app has a working technical spike:

- Flutter UI
- FastAPI backend
- PostgreSQL database
- auth
- localization
- raw note persistence
- timeline event persistence

This spike should be preserved but not mistaken for product direction.

## Phase 1: Product foundation

Done when:

- docs/tacite exists
- product law is written
- V0 scope is written
- safety boundary is written
- data model is written
- UX flows are written
- timeline and summary models are written
- architecture and privacy risks are written

Checkpoint:

checkpoint-tacite-product-foundation-v1

## Phase 2: Visible rename

Rename user-visible product copy from interim to Tacite.

Do not rename every technical folder yet.

Checkpoint:

checkpoint-tacite-name-copy-v1

## Phase 3: Design foundation

Create Tacite-specific visual components.

Avoid raw default Flutter widgets on product screens.

Components:

- TaciteScaffold
- TaciteTopBar
- TacitePanel
- TacitePrimaryButton
- TaciteTextArea
- TaciteChip
- TaciteTimelineCard
- TaciteSwipeCard
- TaciteSummaryPanel

Checkpoint:

checkpoint-tacite-design-foundation-v1

## Phase 4: Screen refactor

Refactor current screens to use Tacite components.

Checkpoint:

checkpoint-tacite-screen-refactor-v1

## Phase 5: Purpose onboarding

Build:

- already in care
- preparing for care
- just record something

Checkpoint:

checkpoint-purpose-onboarding-v1

## Phase 6: Timeline beginning and starting snapshot

Build:

- timeline beginning choice
- skippable quick snapshot
- subjective labels

Checkpoint:

checkpoint-starting-point-v1

## Phase 7: AI-off structured capture cards

Build:

- Treatment
- Experience
- Appointment
- Other

Checkpoint:

checkpoint-ai-off-capture-cards-v1

## Phase 8: Swipeable timeline cards

Build swipe shortcuts with visible fallback actions.

Checkpoint:

checkpoint-swipeable-timeline-cards-v1

## Phase 9: Summary so far

Build:

- range selector
- template summary
- editable summary
- copy/export text

Checkpoint:

checkpoint-summary-so-far-v1

## Phase 10: AI extraction

Only after AI-off product value exists.

Checkpoint:

checkpoint-ai-extraction-foundation-v1


## Design foundation note

Tacite should avoid raw default Flutter visuals on product screens.

The design foundation introduces Tacite-specific tokens and components. Future product screens should prefer Tacite components over direct Material widgets when practical.
