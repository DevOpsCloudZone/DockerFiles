
# Stage 1: Dependencies
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN python -m venv /opt/venv

RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Stage 2: Final
FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY . .

CMD ["python", "app.py"]
