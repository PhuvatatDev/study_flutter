# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter study repository dedicated to learning and practicing Flutter and Dart programming. It contains exercises, widget practice, UI experiments, and algorithm challenges.

## Common Development Commands

### Running the Application
```bash
# Run the app on connected device/emulator
flutter run

# Run on specific device
flutter run -d <device_id>

# Run with debugging information
flutter run --debug
```

### Testing
```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/widget_test.dart
```

### Building
```bash
# Build Android APK
flutter build apk

# Build iOS app
flutter build ios

# Build for web
flutter build web
```

### Flutter-specific Commands
```bash
# Get dependencies
flutter pub get

# Clean build artifacts
flutter clean

# Upgrade Flutter SDK
flutter upgrade

# Check for issues
flutter doctor
```

## Code Architecture & Structure

### Core Application Structure
- **Main Entry**: `lib/main.dart` - Contains `MyApp` that launches `CarCollectionsPage`
- **Assets**: Images stored in `asset/images/` (car images: Alpine.jpg, Fiat 500.jpg, etc.)
- **Flutter SDK**: ^3.5.4

### Learning Areas
1. **Widget Practice** (`lib/widgets/`)
   - `flutter_widgets.dart`: Collection of 10 widget examples (Q1-Q10)
     - Q1: Simple centered text
     - Q2: ListView.builder with names
     - Q3: StatefulWidget with counter
     - Q4: TextField with TextEditingController
     - Q5: Navigation between pages
     - Q6: Network image with loading indicator
     - Q7: ListView with dividers
     - Q8: BottomNavigationBar
     - Q9: SnackBar demonstration
     - Q10: AlertDialog confirmation

2. **Dart Algorithms** (`lib/dart/`)
   - Algorithm exercises focusing on:
     - List/array operations
     - String manipulations
     - Mathematical problems
     - Map/dictionary operations
     - Prime numbers and pangrams

3. **UI Pages**
   - `car_collections_page.dart`: Interactive car selection UI

### Navigation Patterns
- Uses Material Design with `MaterialApp`
- Standard Navigator.push/pop for page transitions
- Example navigation implemented in Q5 of flutter_widgets.dart

### State Management
- Currently using StatefulWidget with setState for local state
- TextEditingController for form inputs (see Q4 example)
- No external state management packages installed yet

### Testing Approach
- Widget tests in `test/` directory
- Basic smoke test exists but references outdated counter widget
- Tests use flutter_test package and WidgetTester

### Development Notes
- Material3 design system enabled
- Dark theme support configured
- Debug banner disabled in main app
- Asset images configured in pubspec.yaml under `asset/images/`