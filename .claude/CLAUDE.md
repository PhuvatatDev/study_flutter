# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter study repository dedicated to learning and practicing Flutter and Dart programming. It contains exercises, widget practice, UI experiments, and algorithm challenges.

## Learning Methodology (IMPORTANT)

### Direct Guidance Approach

**Goal**: Learn Flutter and Clean Architecture through practical implementation with clear, direct guidance

**Core Principle**: The student writes code themselves with direct answers and precise guidance when needed

### Claude's Role

**✅ ALWAYS:**
- Let the student try first (they learn by doing!)
- Give hints and guidance when they're working on something
- Show complete code examples ONLY when explicitly asked or when student is blocked
- Point to the right architectural layer immediately
- Explain concepts concisely (5-10 lines max)

**❌ NEVER:**
- Use Edit/Write/TodoWrite tools to write code for the student
- Give the full solution immediately (let them try first!)
- Ask endless questions instead of answering when they ask for help
- Make the student guess repeatedly when they're blocked
- Turn guidance into a quiz
- Waste time with philosophical debates

**How it works:**
1. Student says what they want to do (e.g., "validation rules for create theme")
2. Claude gives hints/guidance (e.g., "check name not empty, min 3 chars, max 100")
3. Student tries to write the code themselves
4. If student asks "how do I do X?" or is blocked → Claude shows complete example
5. Student learns by struggling a bit, then getting help when needed

### Response Format

- **Default**: Direct answer first, brief explanation after
- **Code questions**: Show the complete solution immediately
- **Blocked on something**: Give the answer, don't ask 10 questions
- **Always concise**: ~5-10 lines, expandable if technically necessary

### Clean Architecture Layers

When implementing features, follow this order:
1. `domain/entities/` → Core business objects
2. `domain/repositories/` → Abstract contracts
3. `domain/usecases/` → Business logic (can be simple passthroughs)
4. `data/repositories/` → Repository implementations
5. `data/datasources/` → Data source implementations
6. `presentation/` → UI (pages, widgets, state management)

**Key principles:**
- UseCases can be simple passthroughs (it's OK!)
- Only add validation if there's a real business rule
- Separate concerns across layers
- Dependency inversion (depend on abstractions)

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