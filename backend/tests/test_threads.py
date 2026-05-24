from uuid import uuid4

from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def create_token(email: str | None = None) -> str:
    address = email or f"user-{uuid4()}@example.com"

    request_response = client.post(
        "/auth/request-code",
        json={"email": address},
    )

    assert request_response.status_code == 200

    code = request_response.json()["dev_code"]

    verify_response = client.post(
        "/auth/verify-code",
        json={"email": address, "code": code},
    )

    assert verify_response.status_code == 200

    return verify_response.json()["access_token"]


def test_manual_note_to_timeline_flow() -> None:
    token = create_token()
    headers = {"Authorization": f"Bearer {token}"}

    thread_response = client.post(
        "/threads",
        json={
            "kind": "treatment_episode",
            "title": "ABC trial",
            "user_goal": "Remember what changed before the appointment.",
            "started_on": "2000-05-01",
        },
        headers=headers,
    )

    assert thread_response.status_code == 201

    thread = thread_response.json()

    assert thread["kind"] == "treatment_episode"
    assert thread["title"] == "ABC trial"

    note_response = client.post(
        f"/threads/{thread['id']}/notes",
        json={
            "original_text": "started ABC on 1 May. depressed 10/10.",
            "input_mode": "text",
            "user_local_date": "2000-05-01",
            "raw_emojis": ["😵‍💫"],
        },
        headers=headers,
    )

    assert note_response.status_code == 201

    note = note_response.json()

    assert note["original_text"] == "started ABC on 1 May. depressed 10/10."
    assert note["raw_emojis"] == ["😵‍💫"]

    event_response = client.post(
        f"/threads/{thread['id']}/timeline-events",
        json={
            "raw_note_id": note["id"],
            "event_type": "started_medication",
            "event_date": "2000-05-01",
            "event_date_precision": "exact",
            "title": "Started ABC",
            "user_approved_summary": "Started treatment label ABC on 1 May.",
        },
        headers=headers,
    )

    assert event_response.status_code == 201

    timeline_response = client.get(
        f"/threads/{thread['id']}/timeline",
        headers=headers,
    )

    assert timeline_response.status_code == 200

    timeline = timeline_response.json()

    assert len(timeline) == 1
    assert timeline[0]["title"] == "Started ABC"
    assert timeline[0]["source"] == "manual"


def test_thread_access_is_limited_to_owner() -> None:
    owner_token = create_token()
    other_token = create_token()

    owner_headers = {"Authorization": f"Bearer {owner_token}"}
    other_headers = {"Authorization": f"Bearer {other_token}"}

    thread_response = client.post(
        "/threads",
        json={
            "kind": "appointment_preparation",
            "title": "Before GP appointment",
        },
        headers=owner_headers,
    )

    assert thread_response.status_code == 201

    thread_id = thread_response.json()["id"]

    other_response = client.get(
        f"/threads/{thread_id}/timeline",
        headers=other_headers,
    )

    assert other_response.status_code == 404
