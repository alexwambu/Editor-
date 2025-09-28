FROM python:3.11-slim

WORKDIR /app

# Copy requirements first (better caching)
COPY app/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy rest of app
COPY app/ /app/

EXPOSE 8000 8545

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
