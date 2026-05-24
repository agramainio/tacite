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
    cors_allowed_origins: str = (
        "http://localhost:3000,"
        "http://localhost:5173,"
        "http://127.0.0.1:3000,"
        "http://127.0.0.1:5173,"
        "http://127.0.0.1:8000"
    )

    @property
    def cors_origins(self) -> list[str]:
        return [
            origin.strip()
            for origin in self.cors_allowed_origins.split(",")
            if origin.strip()
        ]

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )


@lru_cache
def get_settings() -> Settings:
    return Settings()
