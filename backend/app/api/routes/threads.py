import uuid
from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException, status

from app.api.deps import DbSession, get_current_profile
from app.models import PreparationThread, Profile, RawNote, TimelineEvent
from app.schemas.thread import (
    CreateRawNoteRequest,
    CreateThreadRequest,
    CreateTimelineEventRequest,
    RawNoteResponse,
    ThreadResponse,
    TimelineEventResponse,
)
from app.services.thread import (
    create_raw_note,
    create_thread,
    create_timeline_event,
    get_or_create_default_timeline_thread,
    get_owned_thread,
    list_raw_notes,
    list_threads,
    list_timeline_events,
)

router = APIRouter(tags=["threads"])


def to_thread_response(thread: PreparationThread) -> ThreadResponse:
    return ThreadResponse(
        id=thread.id,
        kind=thread.kind,
        title=thread.title,
        status=thread.status,
        user_goal=thread.user_goal,
        started_on=thread.started_on,
        ended_on=thread.ended_on,
        created_at=thread.created_at,
        updated_at=thread.updated_at,
    )


def to_raw_note_response(note: RawNote) -> RawNoteResponse:
    return RawNoteResponse(
        id=note.id,
        thread_id=note.thread_id,
        original_text=note.original_text,
        input_mode=note.input_mode,
        user_local_date=note.user_local_date,
        raw_emojis=note.raw_emojis,
        is_deleted=note.is_deleted,
        created_at=note.created_at,
        updated_at=note.updated_at,
    )


def to_timeline_event_response(event: TimelineEvent) -> TimelineEventResponse:
    return TimelineEventResponse(
        id=event.id,
        thread_id=event.thread_id,
        raw_note_id=event.raw_note_id,
        event_type=event.event_type,
        event_date=event.event_date,
        event_date_precision=event.event_date_precision,
        title=event.title,
        user_approved_summary=event.user_approved_summary,
        source=event.source,
        created_at=event.created_at,
        updated_at=event.updated_at,
    )


@router.post("/threads", status_code=status.HTTP_201_CREATED)
def create_preparation_thread(
    payload: CreateThreadRequest,
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> ThreadResponse:
    thread = create_thread(db, current_profile, payload)

    return to_thread_response(thread)


@router.get("/threads")
def get_preparation_threads(
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> list[ThreadResponse]:
    return [to_thread_response(thread) for thread in list_threads(db, current_profile)]


@router.get("/threads/default-timeline")
def get_default_timeline_thread(
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> ThreadResponse:
    thread = get_or_create_default_timeline_thread(db, current_profile)

    return to_thread_response(thread)


@router.get("/threads/{thread_id}")
def get_preparation_thread(
    thread_id: uuid.UUID,
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> ThreadResponse:
    thread = get_owned_thread(db, current_profile, thread_id)

    if thread is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thread not found.")

    return to_thread_response(thread)


@router.post("/threads/{thread_id}/notes", status_code=status.HTTP_201_CREATED)
def create_thread_note(
    thread_id: uuid.UUID,
    payload: CreateRawNoteRequest,
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> RawNoteResponse:
    note = create_raw_note(db, current_profile, thread_id, payload)

    if note is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thread not found.")

    return to_raw_note_response(note)


@router.get("/threads/{thread_id}/notes")
def get_thread_notes(
    thread_id: uuid.UUID,
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> list[RawNoteResponse]:
    notes = list_raw_notes(db, current_profile, thread_id)

    if notes is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thread not found.")

    return [to_raw_note_response(note) for note in notes]


@router.post("/threads/{thread_id}/timeline-events", status_code=status.HTTP_201_CREATED)
def create_thread_timeline_event(
    thread_id: uuid.UUID,
    payload: CreateTimelineEventRequest,
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> TimelineEventResponse:
    event = create_timeline_event(db, current_profile, thread_id, payload)

    if event is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Thread or raw note not found.",
        )

    return to_timeline_event_response(event)


@router.get("/threads/{thread_id}/timeline")
def get_thread_timeline(
    thread_id: uuid.UUID,
    db: DbSession,
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> list[TimelineEventResponse]:
    events = list_timeline_events(db, current_profile, thread_id)

    if events is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thread not found.")

    return [to_timeline_event_response(event) for event in events]
