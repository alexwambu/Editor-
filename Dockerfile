FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install first
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all code
COPY app/ /app/

EXPOSE 8000 8545

# Run FastAPI with correct path
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
