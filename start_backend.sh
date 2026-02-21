#!/bin/bash

echo "Starting AgroDetect AI Backend Services..."

# Navigate to project root
cd "$(dirname "$0")"

# 1. Start Docker Containers for PostgreSQL and Redis
echo "Starting database and cache services via Docker Compose..."
docker-compose up -d

# Wait for database to be ready
echo "Waiting for PostgreSQL to be ready..."
sleep 5

# 2. Activate Virtual Environment
if [ -d "venv" ]; then
    echo "Activating virtual environment..."
    source venv/bin/activate
else
    echo "Virtual environment not found. Please create one using 'python3 -m venv venv' and install requirements."
    exit 1
fi

# 3. Run Alembic Migrations
echo "Running database migrations..."
alembic upgrade head

# 4. Start FastAPI application
echo "Starting FastAPI server..."
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
