# BPRO App - Flutter Project

A premium mobile application UI for the **BPRO Soccer Training Platform**, built with Flutter.

## 📱 Features

- **Bottom Tab Navigation** — Home, Programs, Videos
- **Home Screen** — Hero banner, stats, horizontal program cards, video list
- **Programs Screen** — Filterable training programs (All / Beginner / Intermediate / Advanced)
- **Videos Screen** — Searchable video library with category filters
- **Settings Screen** — Profile card, premium upgrade sheet, settings tiles, logout dialog

## 🎨 Design System

| Token | Value |
|-------|-------|
| Primary Red | `#D32F2F` |
| Dark Red | `#7B0000` |
| Background | `#FFFFFF` |
| Text Primary | `#0D0D0D` |
| Text Secondary | `#9E9E9E` |
| Font | Inter (Google Fonts) |

## 🚀 Getting Started

### Prerequisites

Install the [Flutter SDK](https://docs.flutter.dev/get-started/install/windows) (recommended: stable channel).

```bash
# Verify installation
flutter doctor
```

### Run the App

```bash
cd d:\flutter\bpro_app

# Install dependencies
flutter pub get

# Run on connected device / emulator
flutter run

# Build APK
flutter build apk --release
```

## 📁 Project Structure

```
lib/
├── main.dart              # App entry, navigation shell & bottom tab bar
├── screens/
│   ├── home_screen.dart   # Home with hero banner & content sections
│   ├── programs_screen.dart # Filterable programs list
│   ├── videos_screen.dart   # Searchable video library
│   └── settings_screen.dart # Profile, upgrade, and logout
└── widgets/
    ├── stat_card.dart
    ├── section_header.dart
    ├── program_card.dart
    └── featured_video_card.dart
```
