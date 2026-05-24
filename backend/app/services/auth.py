import hashlib
import hmac
import secrets
from datetime import UTC, datetime, timedelta

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.core.settings import Settings
from app.models import AuthLoginCode, AuthSession, Profile


class AuthError(Exception):
    pass


def normalize_email(email: str) -> str:
    return email.strip().lower()


def hash_secret(value: str, settings: Settings) -> str:
    return hmac.new(
        settings.auth_secret_key.encode("utf-8"),
        value.encode("utf-8"),
        hashlib.sha256,
    ).hexdigest()


def create_login_code(db: Session, email: str, settings: Settings) -> str:
    normalized_email = normalize_email(email)
    code = f"{secrets.randbelow(1_000_000):06d}"
    now = datetime.now(UTC)

    login_code = AuthLoginCode(
        email_identifier=normalized_email,
        code_hash=hash_secret(code, settings),
        expires_at=now + timedelta(minutes=settings.login_code_ttl_minutes),
    )

    db.add(login_code)
    db.commit()

    return code


def verify_login_code(
    db: Session,
    email: str,
    code: str,
    settings: Settings,
) -> tuple[Profile, str]:
    normalized_email = normalize_email(email)
    now = datetime.now(UTC)

    login_code = db.scalar(
        select(AuthLoginCode)
        .where(AuthLoginCode.email_identifier == normalized_email)
        .where(AuthLoginCode.consumed_at.is_(None))
        .where(AuthLoginCode.expires_at > now)
        .order_by(AuthLoginCode.created_at.desc())
        .limit(1)
    )

    if login_code is None:
        raise AuthError("invalid_or_expired_code")

    if login_code.attempt_count >= 5:
        raise AuthError("too_many_attempts")

    expected_hash = hash_secret(code, settings)

    if not hmac.compare_digest(login_code.code_hash, expected_hash):
        login_code.attempt_count += 1
        db.commit()
        raise AuthError("invalid_or_expired_code")

    profile = db.scalar(select(Profile).where(Profile.email_identifier == normalized_email))

    if profile is None:
        profile = Profile(email_identifier=normalized_email)
        db.add(profile)
        db.flush()

    login_code.consumed_at = now

    token = secrets.token_urlsafe(32)
    session = AuthSession(
        profile_id=profile.id,
        token_hash=hash_secret(token, settings),
        expires_at=now + timedelta(days=settings.session_ttl_days),
    )

    db.add(session)
    db.commit()
    db.refresh(profile)

    return profile, token


def get_profile_for_token(db: Session, token: str, settings: Settings) -> Profile | None:
    now = datetime.now(UTC)
    token_hash = hash_secret(token, settings)

    session = db.scalar(
        select(AuthSession)
        .where(AuthSession.token_hash == token_hash)
        .where(AuthSession.revoked_at.is_(None))
        .where(AuthSession.expires_at > now)
    )

    if session is None:
        return None

    return db.get(Profile, session.profile_id)
