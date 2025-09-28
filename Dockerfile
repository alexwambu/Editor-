FROM python:3.11-slim

WORKDIR /app

# Install system deps for psutil
RUN apt-get update && apt-get install -y gcc libc-dev curl && rm -rf /var/lib/apt/lists/*

# Copy requirements first
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy app + startup script
COPY app/ /app/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8000 8545

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl -f http://localhost:8000/status || exit 1

CMD ["/entrypoint.sh"]
FROM python:3.11-slim

WORKDIR /app

# Install system deps for psutil
RUN apt-get update && apt-get install -y gcc libc-dev curl && rm -rf /var/lib/apt/lists/*

# Copy requirements first
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy app + startup script
COPY app/ /app/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8000 8545

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl -f http://localhost:8000/status || exit 1

CMD ["/entrypoint.sh"]
