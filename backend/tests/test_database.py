from sqlalchemy import inspect

from app.db.session import engine


def test_core_tables_exist() -> None:
    inspector = inspect(engine)

    table_names = set(inspector.get_table_names())

    assert "profiles" in table_names
    assert "preparation_threads" in table_names
    assert "raw_notes" in table_names
    assert "timeline_events" in table_names
