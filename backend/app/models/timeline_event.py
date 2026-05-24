import uuid
from datetime import UTC, date, datetime

from sqlalchemy import CheckConstraint, Date, DateTime, ForeignKey, String, Text
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base


class TimelineEvent(Base):
    __tablename__ = "timeline_events"

    __table_args__ = (
        CheckConstraint(
            "event_date_precision IN ('exact', 'approximate', 'relative', 'unknown')",
            name="timeline_event_date_precision",
        ),
        CheckConstraint(
            "source IN ('manual', 'user_confirmed_ai_draft')",
            name="timeline_event_source",
        ),
    )

    id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)
    thread_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey("preparation_threads.id"),
        index=True,
    )
    profile_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("profiles.id"), index=True)
    raw_note_id: Mapped[uuid.UUID | None] = mapped_column(
        ForeignKey("raw_notes.id"),
        nullable=True,
        index=True,
    )
    event_type: Mapped[str] = mapped_column(String(80))
    event_date: Mapped[date | None] = mapped_column(Date, nullable=True)
    event_date_precision: Mapped[str] = mapped_column(String(32), default="unknown")
    title: Mapped[str] = mapped_column(String(200))
    user_approved_summary: Mapped[str] = mapped_column(Text)
    source: Mapped[str] = mapped_column(String(32), default="manual")
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(UTC),
    )
    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(UTC),
        onupdate=lambda: datetime.now(UTC),
    )
