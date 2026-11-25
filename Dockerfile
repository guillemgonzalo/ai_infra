FROM ghcr.io/astral-sh/uv:python3.13-alpine3.23 AS builder

WORKDIR /app


COPY pyproject.toml uv.lock README.md ./
RUN uv sync --frozen --no-dev --no-install-project

COPY main.py ./
COPY src ./src

FROM python:3.13-alpine3.23

WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH"

COPY --from=builder /app/.venv ./.venv
COPY --from=builder /app/main.py ./main.py
COPY --from=builder /app/src ./src

CMD ["python", "main.py"]
