FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all code
COPY app/ /app/
COPY entrypoint.sh /app/entrypoint.sh

# Ensure script is executable
RUN chmod +x /app/entrypoint.sh

EXPOSE 8000 8545

# Use startup script
CMD ["/app/entrypoint.sh"]
