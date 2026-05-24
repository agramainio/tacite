from fastapi import APIRouter

from app.core.settings import get_settings

router = APIRouter(tags=["system"])


@router.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}


@router.get("/version")
def version() -> dict[str, str]:
    settings = get_settings()
    return {
        "app": settings.app_name,
        "version": settings.app_version,
        "environment": settings.app_env,
    }
