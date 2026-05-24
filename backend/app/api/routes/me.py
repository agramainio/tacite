from typing import Annotated

from fastapi import APIRouter, Depends

from app.api.deps import get_current_profile
from app.api.routes.auth import to_profile_response
from app.models import Profile
from app.schemas.auth import ProfileResponse

router = APIRouter(tags=["profile"])


@router.get("/me")
def me(
    current_profile: Annotated[Profile, Depends(get_current_profile)],
) -> ProfileResponse:
    return to_profile_response(current_profile)
