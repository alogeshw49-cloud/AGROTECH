# AgroDetect AI - Setup & Deployment Guide

Welcome to the newly stabilized and recovered AgroDetect AI platform! This guide explains how to start the backend with all required services, and how to verify and run the Flutter frontend.

## 1. Prerequisites
- Docker & Docker Compose
- Python 3.12+ 
- Flutter SDK (latest channel)
- Android Studio / Emulator (for mobile testing)

## 2. Setting Up the Backend
We have configured a `docker-compose.yml` file to handle **PostgreSQL 15** and **Redis 7** automatically. In addition, the credentials have been secured and a `.env` file generated.

To start the backend in one click, run:
```bash
bash start_backend.sh
```

**What the script does:**
1. Starts the database and cache using `docker-compose`.
2. Activates your Python virtual environment.
3. Runs the Alembic database migrations (`alembic upgrade head`).
4. Starts the FastAPI server on `http://localhost:8000`.

## 3. Starting the Frontend (Flutter)
The frontend project now has 0 compilation/analyzer errors, modern `Material 3` syntax (`.withValues()` instead of `.withOpacity()`), rebuilt UI elements, and generated Freezed models.

To run the frontend:
1. **Open an Emulator:** Launch your Android Emulator via Android Studio or the command line.
2. **Run the script:**
```bash
cd "/home/logeswaran-a/Desktop/GEN AI"
bash run_frontend.sh
```

**What the script does:**
1. Cleans the Flutter build cache to prevent stale state issues.
2. Downloads Riverpod, Freezed, GoRouter, and all dependencies.
3. Automatically runs the `build_runner` command to generate JSON converters and Freezed models.
4. Executes `flutter run` which will launch the newly stabilized AgroDetect application on your emulator.

## 4. API & Config Integrations
The Flutter frontend now detects its environment dynamically and defaults to the emulator standard base URL (`http://10.0.2.2:8000/api/v1`), mapping perfectly to your updated FastAPI router setup!

**Happy Coding!**
