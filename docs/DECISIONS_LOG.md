# Decisions log

## 2026-05-24 — Stack

Decision:

Use Flutter + FastAPI + Scalingo HDS + PostgreSQL.

Reason:

The app stores sensitive mental-health and treatment-change records. A custom backend on HDS-oriented hosting is safer than using a generic BaaS for production health-related records.

## 2026-05-24 — AI

Decision:

AI is optional and off by default.

Reason:

The app must remain useful without AI. AI should only format and summarize user notes when the user explicitly chooses it.

## 2026-05-24 — Medication names

Decision:

Official medication names are optional.

Reason:

Users may not know, remember, or want to record real names. They may use private labels that make sense to them.

Boundary:

This does not remove the health-related nature of the data.

## 2026-05-24 — Legal/hosting review

Decision:

Legal, privacy, hosting, and AI-processing review is required before public launch.

Reason:

The app records health-related sensitive information and uses cloud storage. Development may proceed with fake data, but public launch with real user records requires review.
