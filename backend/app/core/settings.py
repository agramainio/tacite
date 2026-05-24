from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    app_env: str = "local"
    app_name: str = "interim"
    app_version: str = "0.1.0"
    log_level: str = "INFO"
    database_url: str = (
        "postgresql+psycopg://interim:interim_dev_password@127.0.0.1:55432/interim_dev"
    )
    auth_secret_key: str = "local-dev-secret-change-before-production"
    login_code_ttl_minutes: int = 10
    session_ttl_days: int = 30

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )


@lru_cache
def get_settings() -> Settings:
    return Settings()
