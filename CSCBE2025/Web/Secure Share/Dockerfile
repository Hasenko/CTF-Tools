FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

ENV PYTHONUNBUFFERED=1

ADD . /app

# Sync the project into a new environment, using the frozen lockfile
WORKDIR /app
ENV UV_LINK_MODE=copy
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --compile-bytecode

EXPOSE 8000

# can only add more workers if users are managed in a database
CMD ["uv", "run", "gunicorn", "app:app", "--bind" , "0.0.0.0", "--workers", "1", "--access-logfile", "-", "--error-logfile", "-"]
