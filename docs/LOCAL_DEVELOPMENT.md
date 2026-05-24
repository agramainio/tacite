# Local development

## Backend

From the repository root:

    cd backend
    docker compose up -d postgres
    uv run alembic upgrade head
    uv run uvicorn app.main:app --reload

Backend URL:

    http://127.0.0.1:8000

Health check:

    curl http://127.0.0.1:8000/health

API docs in local mode:

    http://127.0.0.1:8000/docs

## Flutter

From the repository root:

    cd mobile/interim_app

For iOS simulator or macOS desktop-style local networking:

    flutter run --dart-define=INTERIM_API_BASE_URL=http://127.0.0.1:8000

For Android emulator:

    flutter run --dart-define=INTERIM_API_BASE_URL=http://10.0.2.2:8000

For a physical phone on the same Wi-Fi:

    flutter run --dart-define=INTERIM_API_BASE_URL=http://YOUR_MAC_LOCAL_IP:8000

Find your Mac local IP:

    ipconfig getifaddr en0

## Local login behavior

In local mode, the backend returns a development login code in the response from:

    POST /auth/request-code

This is only allowed when:

    APP_ENV=local

Production must send the code by email and must not return it in the API response.

## Local safety rule

Do not put real mental-health notes, real treatment changes, real side effects, or real appointment summaries into the local development database.

Use fake test data only.
