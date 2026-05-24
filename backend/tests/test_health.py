from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_health_returns_ok() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_version_returns_expected_shape() -> None:
    response = client.get("/version")

    assert response.status_code == 200

    payload = response.json()

    assert payload["app"] == "interim"
    assert payload["version"] == "0.1.0"
    assert payload["environment"] == "local"
