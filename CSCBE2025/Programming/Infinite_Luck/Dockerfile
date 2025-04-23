FROM python:3.13.2-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update

RUN adduser --disabled-password --gecos '' challenge
USER challenge

ENV PATH="/home/challenge/.local/bin:${PATH}"

WORKDIR /app

COPY server.py /app/
EXPOSE 1338

ENTRYPOINT ["/app/server.py"]
