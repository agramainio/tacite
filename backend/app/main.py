from pathlib import Path

from fastapi import FastAPI
from fastapi.responses import FileResponse
from starlette.responses import Response
from fastapi.middleware.cors import CORSMiddleware

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

    app.add_middleware(
        CORSMiddleware,
        allow_origins=settings.cors_origins,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    app.include_router(health_router)
    app.include_router(auth_router)
    app.include_router(me_router)
    app.include_router(threads_router)

    return app


app = create_app()

_WEB_STATIC_DIR = Path(__file__).resolve().parent / "web_static"


@app.get("/app")
@app.get("/app/{full_path:path}")
def serve_flutter_app(full_path: str = ""):
    if not _WEB_STATIC_DIR.exists():
        return Response("Tacite web build is not available.", status_code=404)

    requested = (_WEB_STATIC_DIR / full_path).resolve()
    root = _WEB_STATIC_DIR.resolve()

    if requested.is_file() and root in requested.parents:
        return FileResponse(requested)

    return FileResponse(root / "index.html")

