# Expense Tracker

A Flutter application for expense tracking.

## Getting Started

### Prerequisites

- Flutter SDK (`^3.12.0` / Dart `^3.12.0`)

### Setup Git Hooks

To enable automatic formatting and linting on commit:

```bash
git config core.hooksPath .githooks
```

## Code Quality & Formatting

- **Format code**:
  ```bash
  dart format .
  ```
- **Analyze / Lint code**:
  ```bash
  flutter analyze
  ```

### Pre-commit Hook

The pre-commit hook automatically:

1. Formats any staged `.dart` files with `dart format` and re-stages them.
2. Runs `flutter analyze` to prevent committing code with lint or type errors.
