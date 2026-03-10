FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY app/ /app/

RUN if [ -f "requirements.txt" ]; then \
        pip install --no-cache-dir -r requirements.txt; \
    else \
        echo "No requirements.txt found, skipping dependency installation."; \
    fi

CMD ["python", "main.py"]
