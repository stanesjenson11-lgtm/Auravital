# AuraVitals

AuraVitals is an Android-only Flutter application for passive, private health monitoring. It aggregates smartphone behavioral biomarkers on-device, builds a personal baseline, calculates wellness risk scores, and sends local notifications without uploading health data.

## What Is Implemented

- Feature-first clean architecture under `lib/features`.
- Riverpod dependency graph and GoRouter navigation.
- Drift SQLite schema for daily metrics, risk predictions, and baseline statistics.
- Kotlin MethodChannel integrations for activity recognition permission, usage access, battery optimization settings, step counter snapshots, screen unlock/session aggregation, and usage stats aggregation.
- WorkManager 15-minute background task registration from Flutter.
- Local rule-based health prediction repository with a TFLite-ready abstraction and optional interpreter path.
- Dashboard with Material 3 cards, circular wellness indicator, and `fl_chart` trends.
- Onboarding, permissions, calibration, dashboard, recommendations, notifications, and settings/export/delete flows.

## Build Prerequisites

- Flutter stable SDK 3.38.1 or newer on PATH.
- Android Studio or Android command-line tools.
- Android SDK 36 and Java 17.
- Gradle 8.13 wrapper generated for `android/`, or a local Gradle 8.13 install.

## Build Commands

```powershell
flutter pub get
cd android
gradle wrapper --gradle-version 8.13
cd ..
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build apk --release
```

The generated APK will be at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Android Permissions

AuraVitals requests `ACTIVITY_RECOGNITION`, `POST_NOTIFICATIONS`, foreground service permissions, and guides the user to Usage Access and Battery Optimization exemption screens. Usage Access cannot be granted directly by an app, so the app opens the relevant Android settings page.

## TensorFlow Lite

The app ships with a rule-based on-device prediction engine and a TFLite adapter. To enable a trained model, add a compatible model asset and update `TfliteHealthPredictionRepository` to load that asset in the provider graph. The expected input order is:

```text
steps, screenTimeMinutes, unlockCount, walkingMinutes, nightUsageMinutes
```

Expected output order:

```text
stressRisk, sleepRisk, wellnessRisk, confidence
```

## Privacy Model

AuraVitals stores only aggregate daily metrics. It does not collect message text, passwords, audio, location, web page content, or app content. All analytics, storage, baseline calibration, and prediction run locally.
