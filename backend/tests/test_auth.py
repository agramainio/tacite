from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_login_code_flow_returns_profile_and_allows_me_request() -> None:
    email = "User.Example@example.com"

    request_response = client.post(
        "/auth/request-code",
        json={"email": email},
    )

    assert request_response.status_code == 200

    request_payload = request_response.json()
    code = request_payload["dev_code"]

    assert code is not None
    assert len(code) == 6

    verify_response = client.post(
        "/auth/verify-code",
        json={"email": email, "code": code},
    )

    assert verify_response.status_code == 200

    verify_payload = verify_response.json()
    access_token = verify_payload["access_token"]

    assert verify_payload["token_type"] == "bearer"
    assert verify_payload["profile"]["email_identifier"] == "user.example@example.com"

    me_response = client.get(
        "/me",
        headers={"Authorization": f"Bearer {access_token}"},
    )

    assert me_response.status_code == 200
    assert me_response.json()["email_identifier"] == "user.example@example.com"


def test_me_requires_bearer_token() -> None:
    response = client.get("/me")

    assert response.status_code == 401
