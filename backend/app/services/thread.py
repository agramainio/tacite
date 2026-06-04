import uuid

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models import PreparationThread, Profile, RawNote, TimelineEvent
from app.schemas.thread import (
    CreateRawNoteRequest,
    CreateThreadRequest,
    CreateTimelineEventRequest,
)


def get_owned_thread(
    db: Session,
    profile: Profile,
    thread_id: uuid.UUID,
) -> PreparationThread | None:
    return db.scalar(
        select(PreparationThread)
        .where(PreparationThread.id == thread_id)
        .where(PreparationThread.profile_id == profile.id)
    )


def create_thread(
    db: Session,
    profile: Profile,
    payload: CreateThreadRequest,
) -> PreparationThread:
    thread = PreparationThread(
        profile_id=profile.id,
        kind=payload.kind,
        title=payload.title,
        user_goal=payload.user_goal,
        started_on=payload.started_on,
    )

    db.add(thread)
    db.commit()
    db.refresh(thread)

    return thread


def list_threads(db: Session, profile: Profile) -> list[PreparationThread]:
    return list(
        db.scalars(
            select(PreparationThread)
            .where(PreparationThread.profile_id == profile.id)
            .order_by(PreparationThread.created_at.desc())
        )
    )


def create_raw_note(
    db: Session,
    profile: Profile,
    thread_id: uuid.UUID,
    payload: CreateRawNoteRequest,
) -> RawNote | None:
    thread = get_owned_thread(db, profile, thread_id)

    if thread is None:
        return None

    note = RawNote(
        thread_id=thread.id,
        profile_id=profile.id,
        original_text=payload.original_text,
        input_mode=payload.input_mode,
        user_local_date=payload.user_local_date,
        raw_emojis=payload.raw_emojis,
    )

    db.add(note)
    db.commit()
    db.refresh(note)

    return note


def list_raw_notes(
    db: Session,
    profile: Profile,
    thread_id: uuid.UUID,
) -> list[RawNote] | None:
    thread = get_owned_thread(db, profile, thread_id)

    if thread is None:
        return None

    return list(
        db.scalars(
            select(RawNote)
            .where(RawNote.thread_id == thread.id)
            .where(RawNote.profile_id == profile.id)
            .where(RawNote.is_deleted.is_(False))
            .order_by(RawNote.created_at.asc())
        )
    )


def get_owned_raw_note(
    db: Session,
    profile: Profile,
    thread_id: uuid.UUID,
    raw_note_id: uuid.UUID,
) -> RawNote | None:
    return db.scalar(
        select(RawNote)
        .where(RawNote.id == raw_note_id)
        .where(RawNote.thread_id == thread_id)
        .where(RawNote.profile_id == profile.id)
        .where(RawNote.is_deleted.is_(False))
    )


def create_timeline_event(
    db: Session,
    profile: Profile,
    thread_id: uuid.UUID,
    payload: CreateTimelineEventRequest,
) -> TimelineEvent | None:
    thread = get_owned_thread(db, profile, thread_id)

    if thread is None:
        return None

    if payload.raw_note_id is not None:
        raw_note = get_owned_raw_note(db, profile, thread.id, payload.raw_note_id)

        if raw_note is None:
            return None

    event = TimelineEvent(
        thread_id=thread.id,
        profile_id=profile.id,
        raw_note_id=payload.raw_note_id,
        event_type=payload.event_type,
        event_date=payload.event_date,
        event_date_precision=payload.event_date_precision,
        title=payload.title,
        user_approved_summary=payload.user_approved_summary,
        source="manual",
    )

    db.add(event)
    db.commit()
    db.refresh(event)

    return event


def list_timeline_events(
    db: Session,
    profile: Profile,
    thread_id: uuid.UUID,
) -> list[TimelineEvent] | None:
    thread = get_owned_thread(db, profile, thread_id)

    if thread is None:
        return None

    return list(
        db.scalars(
            select(TimelineEvent)
            .where(TimelineEvent.thread_id == thread.id)
            .where(TimelineEvent.profile_id == profile.id)
            .order_by(
                TimelineEvent.event_date.asc().nullslast(),
                TimelineEvent.created_at.asc(),
            )
        )
    )


def get_or_create_default_timeline_thread(
    db: Session,
    profile: Profile,
) -> PreparationThread:
    existing_thread = db.scalar(
        select(PreparationThread)
        .where(PreparationThread.profile_id == profile.id)
        .where(PreparationThread.kind == "appointment_preparation")
        .where(PreparationThread.title == "Personal timeline")
        .where(PreparationThread.status == "active")
        .order_by(PreparationThread.created_at.asc())
    )

    if existing_thread is not None:
        return existing_thread

    thread = PreparationThread(
        profile_id=profile.id,
        kind="appointment_preparation",
        title="Personal timeline",
        user_goal="Default private timeline",
    )

    db.add(thread)
    db.commit()
    db.refresh(thread)

    return thread
