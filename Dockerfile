# syntax=docker/dockerfile:1

# ─────────────────────────────────────────────
# Base image – Python 3.12 + uv binary
#   (matches requires‑python <3.13 from pyproject.toml)
# ─────────────────────────────────────────────
FROM python:3.12-slim-bookworm AS base

# Copy the uv standalone binary (fast replacement for pip/venv)
COPY --from=ghcr.io/astral-sh/uv:0.4.11 /uv /usr/local/bin/uv

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

WORKDIR /app

# ─────────────────────────────────────────────
# Builder stage – install deps & app into a venv
# ─────────────────────────────────────────────
FROM base AS builder


# 1️⃣ Copy lock files first to maximise layer‑cache hits
COPY pyproject.toml uv.lock ./

# 2️⃣ Install production dependencies (no project code yet)
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-install-project --no-dev

# 3️⃣ Copy the full source tree
COPY . .

# 4️⃣ Install the project itself (still no dev deps)
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

# ─────────────────────────────────────────────
# Final runtime stage – non‑root & writable HOME
# ─────────────────────────────────────────────
FROM base AS final

# Create a non‑root user **with a real home directory** so libs like mem0 (CrewAI agents memory) can write there
RUN addgroup --system falc \
    && adduser --system --home /home/falc --shell /bin/bash --ingroup falc falc \
    && mkdir -p /home/falc/.cache \
    && chown -R falc:falc /home/falc

# Make /app writable by the non‑root user (for Chainlit file creation, chromadb, etc.)
RUN chown falc:falc /app

WORKDIR /app

# Copy code & virtual‑env owned by falc
COPY --chown=falc:falc --from=builder /app /app

ENV PATH="/app/.venv/bin:$PATH" \
    HOME="/home/falc"

EXPOSE 8000

USER falc

CMD ["chainlit", "run", "src/chainlit_app.py", "--host", "0.0.0.0", "--port", "8000"]
