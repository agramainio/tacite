from datetime import date, datetime
from typing import Any, Literal
from uuid import UUID

from pydantic import BaseModel, Field

ThreadKind = Literal["treatment_episode", "appointment_preparation"]
ThreadStatus = Literal["active", "archived"]
InputMode = Literal["text", "voice_transcript", "quick_checkin"]
DatePrecision = Literal["exact", "approximate", "relative", "unknown"]


class CreateThreadRequest(BaseModel):
    kind: ThreadKind
    title: str = Field(min_length=1, max_length=200)
    user_goal: str | None = None
    started_on: date | None = None


class ThreadResponse(BaseModel):
    id: UUID
    kind: str
    title: str
    status: str
    user_goal: str | None
    started_on: date | None
    ended_on: date | None
    created_at: datetime
    updated_at: datetime


class CreateRawNoteRequest(BaseModel):
    original_text: str = Field(min_length=1)
    input_mode: InputMode = "text"
    user_local_date: date | None = None
    raw_emojis: dict[str, Any] | list[Any] | None = None


class RawNoteResponse(BaseModel):
    id: UUID
    thread_id: UUID
    original_text: str
    input_mode: str
    user_local_date: date | None
    raw_emojis: dict[str, Any] | list[Any] | None
    is_deleted: bool
    created_at: datetime
    updated_at: datetime


class CreateTimelineEventRequest(BaseModel):
    raw_note_id: UUID | None = None
    event_type: str = Field(min_length=1, max_length=80)
    event_date: date | None = None
    event_date_precision: DatePrecision = "unknown"
    title: str = Field(min_length=1, max_length=200)
    user_approved_summary: str = Field(min_length=1)


class TimelineEventResponse(BaseModel):
    id: UUID
    thread_id: UUID
    raw_note_id: UUID | None
    event_type: str
    event_date: date | None
    event_date_precision: str
    title: str
    user_approved_summary: str
    source: str
    created_at: datetime
    updated_at: datetime
