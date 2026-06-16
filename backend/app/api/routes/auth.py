from fastapi import APIRouter, HTTPException, status

from app.api.deps import AppSettings, DbSession
from app.models import Profile
from app.schemas.auth import (
    ProfileResponse,
    RequestLoginCodeRequest,
    RequestLoginCodeResponse,
    VerifyLoginCodeRequest,
    VerifyLoginCodeResponse,
)
from app.services.auth import AuthError, create_login_code, verify_login_code

router = APIRouter(tags=["auth"])


def to_profile_response(profile: Profile) -> ProfileResponse:
    return ProfileResponse(
        id=str(profile.id),
        email_identifier=profile.email_identifier,
        display_alias=profile.display_alias,
        locale=profile.locale,
        timezone=profile.timezone,
    )


@router.post("/auth/request-code")
def request_login_code(
    payload: RequestLoginCodeRequest,
    db: DbSession,
    settings: AppSettings,
) -> RequestLoginCodeResponse:
    code = create_login_code(db, str(payload.email), settings)

    if settings.app_env in {"local", "staging"}:
        return RequestLoginCodeResponse(dev_code=code)

    return RequestLoginCodeResponse()


@router.post("/auth/verify-code")
def verify_code(
    payload: VerifyLoginCodeRequest,
    db: DbSession,
    settings: AppSettings,
) -> VerifyLoginCodeResponse:
    try:
        profile, token = verify_login_code(db, str(payload.email), payload.code, settings)
    except AuthError as exc:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid or expired login code.",
        ) from exc

    return VerifyLoginCodeResponse(
        access_token=token,
        profile=to_profile_response(profile),
    )
