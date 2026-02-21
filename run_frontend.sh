#!/bin/bash

echo "Starting AgroDetect AI Frontend Application..."

# Navigate to frontend project directory
cd "$(dirname "$0")/frontend/agrodetect_app"

# 1. Flutter clean and pub get (optional but recommended for a fresh start)
echo "Cleaning project and fetching dependencies..."
flutter clean
flutter pub get

# 2. Run code generation to ensure Freezed/JsonSerializable models are built
echo "Running build_runner for code generation..."
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Start the application
echo "Starting Flutter application on the currently connected device or emulator..."
flutter run
