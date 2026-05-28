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


## Screen refactor note

The current screens have been refactored to use Tacite visual components for scaffolding, panels, primary actions, text areas, section headers, messages, and timeline cards.

This is still not the final Tacite UX, but it removes the most obvious default Flutter structure before onboarding and structured capture work.


## Purpose onboarding note

A frontend-only onboarding foundation has been added:

- route: /onboarding
- choices: already in care / preparing for care / just record something
- no backend persistence yet
- selection storage comes later
- next phase adds timeline beginning and starting snapshot


## Starting point onboarding note

A frontend-only starting point screen has been added:

- route: /onboarding/start
- asks where the timeline should begin
- offers a skippable quick starting snapshot
- uses subjective labels only
- does not persist choices yet
- does not create clinical scores
- next phase should add AI-off structured capture cards


## AI-off capture cards note

The thread capture screen now has a frontend-only structured capture surface:

- Treatment
- Experience
- Appointment
- Other

These cards do not add backend schema yet. They select a capture kind and map it onto the existing raw note + timeline event endpoint.

This is the first product step away from a generic notes app. The next product step should make timeline cards more useful, including swipe actions and visible fallback options.


## Swipeable timeline cards note

Timeline cards now support non-destructive swipe shortcuts:

- right swipe: add to summary placeholder
- left swipe: edit/more-options placeholder
- visible fallback menu is always available
- no destructive delete is implemented
- backend wiring comes later with the summary feature

Swipe is a shortcut, not the only access path.


## Summary so far note

A frontend-only Summary so far surface has been added:

- route: /summary
- range selector
- editable summary draft
- copy summary action
- no backend persistence yet
- no PDF export yet
- no AI generation yet

This is the second core product surface after the timeline.
