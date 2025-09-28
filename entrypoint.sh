#!/bin/sh
set -e

echo "=== Starting ML Editor + Chatbot + Blockchain ==="
echo "Working dir: $(pwd)"
echo "Python version: $(python --version)"
echo "Installed packages:"
pip list

# Log what files exist
echo "=== Files in /app ==="
ls -R /app

echo "=== Launching FastAPI ==="
exec uvicorn main:app --host 0.0.0.0 --port 8000
