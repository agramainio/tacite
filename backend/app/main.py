from fastapi import FastAPI

from app.api.routes.auth import router as auth_router
from app.api.routes.health import router as health_router
from app.api.routes.me import router as me_router
from app.api.routes.threads import router as threads_router
from app.core.settings import get_settings


def create_app() -> FastAPI:
    settings = get_settings()

    app = FastAPI(
        title=settings.app_name,
        version=settings.app_version,
        docs_url="/docs" if settings.app_env == "local" else None,
        redoc_url="/redoc" if settings.app_env == "local" else None,
    )

    app.include_router(health_router)
    app.include_router(auth_router)
    app.include_router(me_router)
    app.include_router(threads_router)

    return app


app = create_app()
