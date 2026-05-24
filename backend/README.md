# interim backend

FastAPI backend for the interim app.

## Local development

Install dependencies:

    uv sync

Run tests:

    uv run pytest

Run linter:

    uv run ruff check .

Run local server:

    uv run uvicorn app.main:app --reload

Health endpoint:

    curl http://127.0.0.1:8000/health
