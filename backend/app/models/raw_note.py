import uuid
from datetime import UTC, date, datetime

from sqlalchemy import CheckConstraint, Date, DateTime, ForeignKey, String, Text
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base


class RawNote(Base):
    __tablename__ = "raw_notes"

    __table_args__ = (
        CheckConstraint(
            "input_mode IN ('text', 'voice_transcript', 'quick_checkin')",
            name="raw_note_input_mode",
        ),
    )

    id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)
    thread_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey("preparation_threads.id"),
        index=True,
    )
    profile_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("profiles.id"), index=True)
    original_text: Mapped[str] = mapped_column(Text)
    input_mode: Mapped[str] = mapped_column(String(32), default="text")
    user_local_date: Mapped[date | None] = mapped_column(Date, nullable=True)
    raw_emojis: Mapped[dict | list | None] = mapped_column(JSONB, nullable=True)
    is_deleted: Mapped[bool] = mapped_column(default=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(UTC),
    )
    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(UTC),
        onupdate=lambda: datetime.now(UTC),
    )
