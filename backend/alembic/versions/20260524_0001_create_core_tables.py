"""create core tables

Revision ID: 20260524_0001
Revises:
Create Date: 2026-05-24
"""

from collections.abc import Sequence

import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

from alembic import op

revision: str = "20260524_0001"
down_revision: str | None = None
branch_labels: str | Sequence[str] | None = None
depends_on: str | Sequence[str] | None = None


def upgrade() -> None:
    op.create_table(
        "profiles",
        sa.Column("id", sa.Uuid(), nullable=False),
        sa.Column("email_identifier", sa.String(length=320), nullable=False),
        sa.Column("display_alias", sa.String(length=120), nullable=True),
        sa.Column("locale", sa.String(length=16), nullable=False),
        sa.Column("timezone", sa.String(length=64), nullable=False),
        sa.Column("created_at", sa.DateTime(timezone=True), nullable=False),
        sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False),
        sa.PrimaryKeyConstraint("id", name=op.f("pk_profiles")),
        sa.UniqueConstraint("email_identifier", name=op.f("uq_profiles_email_identifier")),
    )
    op.create_index(
        op.f("ix_profiles_email_identifier"),
        "profiles",
        ["email_identifier"],
        unique=False,
    )

    op.create_table(
        "preparation_threads",
        sa.Column("id", sa.Uuid(), nullable=False),
        sa.Column("profile_id", sa.Uuid(), nullable=False),
        sa.Column("kind", sa.String(length=64), nullable=False),
        sa.Column("title", sa.String(length=200), nullable=False),
        sa.Column("status", sa.String(length=32), nullable=False),
        sa.Column("user_goal", sa.Text(), nullable=True),
        sa.Column("started_on", sa.Date(), nullable=True),
        sa.Column("ended_on", sa.Date(), nullable=True),
        sa.Column("created_at", sa.DateTime(timezone=True), nullable=False),
        sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False),
        sa.CheckConstraint(
            "kind IN ('treatment_episode', 'appointment_preparation')",
            name=op.f("ck_preparation_threads_preparation_thread_kind"),
        ),
        sa.CheckConstraint(
            "status IN ('active', 'archived')",
            name=op.f("ck_preparation_threads_preparation_thread_status"),
        ),
        sa.ForeignKeyConstraint(
            ["profile_id"],
            ["profiles.id"],
            name=op.f("fk_preparation_threads_profile_id_profiles"),
        ),
        sa.PrimaryKeyConstraint("id", name=op.f("pk_preparation_threads")),
    )
    op.create_index(
        op.f("ix_preparation_threads_profile_id"),
        "preparation_threads",
        ["profile_id"],
        unique=False,
    )

    op.create_table(
        "raw_notes",
        sa.Column("id", sa.Uuid(), nullable=False),
        sa.Column("thread_id", sa.Uuid(), nullable=False),
        sa.Column("profile_id", sa.Uuid(), nullable=False),
        sa.Column("original_text", sa.Text(), nullable=False),
        sa.Column("input_mode", sa.String(length=32), nullable=False),
        sa.Column("user_local_date", sa.Date(), nullable=True),
        sa.Column("raw_emojis", postgresql.JSONB(astext_type=sa.Text()), nullable=True),
        sa.Column("is_deleted", sa.Boolean(), nullable=False),
        sa.Column("created_at", sa.DateTime(timezone=True), nullable=False),
        sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False),
        sa.CheckConstraint(
            "input_mode IN ('text', 'voice_transcript', 'quick_checkin')",
            name=op.f("ck_raw_notes_raw_note_input_mode"),
        ),
        sa.ForeignKeyConstraint(
            ["profile_id"],
            ["profiles.id"],
            name=op.f("fk_raw_notes_profile_id_profiles"),
        ),
        sa.ForeignKeyConstraint(
            ["thread_id"],
            ["preparation_threads.id"],
            name=op.f("fk_raw_notes_thread_id_preparation_threads"),
        ),
        sa.PrimaryKeyConstraint("id", name=op.f("pk_raw_notes")),
    )
    op.create_index(op.f("ix_raw_notes_profile_id"), "raw_notes", ["profile_id"], unique=False)
    op.create_index(op.f("ix_raw_notes_thread_id"), "raw_notes", ["thread_id"], unique=False)

    op.create_table(
        "timeline_events",
        sa.Column("id", sa.Uuid(), nullable=False),
        sa.Column("thread_id", sa.Uuid(), nullable=False),
        sa.Column("profile_id", sa.Uuid(), nullable=False),
        sa.Column("raw_note_id", sa.Uuid(), nullable=True),
        sa.Column("event_type", sa.String(length=80), nullable=False),
        sa.Column("event_date", sa.Date(), nullable=True),
        sa.Column("event_date_precision", sa.String(length=32), nullable=False),
        sa.Column("title", sa.String(length=200), nullable=False),
        sa.Column("user_approved_summary", sa.Text(), nullable=False),
        sa.Column("source", sa.String(length=32), nullable=False),
        sa.Column("created_at", sa.DateTime(timezone=True), nullable=False),
        sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False),
        sa.CheckConstraint(
            "event_date_precision IN ('exact', 'approximate', 'relative', 'unknown')",
            name=op.f("ck_timeline_events_timeline_event_date_precision"),
        ),
        sa.CheckConstraint(
            "source IN ('manual', 'user_confirmed_ai_draft')",
            name=op.f("ck_timeline_events_timeline_event_source"),
        ),
        sa.ForeignKeyConstraint(
            ["profile_id"],
            ["profiles.id"],
            name=op.f("fk_timeline_events_profile_id_profiles"),
        ),
        sa.ForeignKeyConstraint(
            ["raw_note_id"],
            ["raw_notes.id"],
            name=op.f("fk_timeline_events_raw_note_id_raw_notes"),
        ),
        sa.ForeignKeyConstraint(
            ["thread_id"],
            ["preparation_threads.id"],
            name=op.f("fk_timeline_events_thread_id_preparation_threads"),
        ),
        sa.PrimaryKeyConstraint("id", name=op.f("pk_timeline_events")),
    )
    op.create_index(
        op.f("ix_timeline_events_profile_id"),
        "timeline_events",
        ["profile_id"],
        unique=False,
    )
    op.create_index(
        op.f("ix_timeline_events_raw_note_id"),
        "timeline_events",
        ["raw_note_id"],
        unique=False,
    )
    op.create_index(
        op.f("ix_timeline_events_thread_id"),
        "timeline_events",
        ["thread_id"],
        unique=False,
    )


def downgrade() -> None:
    op.drop_index(op.f("ix_timeline_events_thread_id"), table_name="timeline_events")
    op.drop_index(op.f("ix_timeline_events_raw_note_id"), table_name="timeline_events")
    op.drop_index(op.f("ix_timeline_events_profile_id"), table_name="timeline_events")
    op.drop_table("timeline_events")

    op.drop_index(op.f("ix_raw_notes_thread_id"), table_name="raw_notes")
    op.drop_index(op.f("ix_raw_notes_profile_id"), table_name="raw_notes")
    op.drop_table("raw_notes")

    op.drop_index(op.f("ix_preparation_threads_profile_id"), table_name="preparation_threads")
    op.drop_table("preparation_threads")

    op.drop_index(op.f("ix_profiles_email_identifier"), table_name="profiles")
    op.drop_table("profiles")
