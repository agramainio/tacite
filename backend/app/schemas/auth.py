from pydantic import BaseModel, EmailStr, Field


class RequestLoginCodeRequest(BaseModel):
    email: EmailStr


class RequestLoginCodeResponse(BaseModel):
    status: str = "code_created"
    dev_code: str | None = None


class VerifyLoginCodeRequest(BaseModel):
    email: EmailStr
    code: str = Field(min_length=6, max_length=12)


class ProfileResponse(BaseModel):
    id: str
    email_identifier: str
    display_alias: str | None
    locale: str
    timezone: str


class VerifyLoginCodeResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    profile: ProfileResponse
