# Repository Guidelines

## Project Structure & Module Organization
- `flutter/`: Flutter app (iOS/Android/Windows) and Dart sources.
- `flutter/cpp/`: C++ evaluation pipeline and protobufs.
- `react/`: React web UI for viewing benchmark results.
- `mobile_back_* /`: Vendor backends (Apple, Pixel, QTI, Samsung, TFLite).
- `datasets/`: Scripts for preparing datasets and calibration data.
- `tools/`: Formatting, linting, and scanning utilities.
- `docs/`: Project documentation and references.

## Build, Test, and Development Commands
- `make flutter`: Build the default platform (Android/Linux, iOS on macOS, Windows on Windows).
- `make flutter/run`: Run the Flutter app on a connected device/emulator.
- `make flutter/prepare`: Generate protobuf outputs, JSON models, and build info.
- `make flutter/test`: Run unit and integration tests.
- `make lint`: Run all linters across supported languages.
- `make format`: Format all supported files in-place.
- `make docker/lint` or `make docker/format`: Use the provided formatter Docker image when local tools are missing.

## Coding Style & Naming Conventions
- Follow Google C++ and Java style guides; Dart and Bazel use their default formatters.
- Use `make format` before committing; it runs `buildifier`, `clang-format`, `dart format`, `swift-format`, and `markdownlint`.
- New files must include a license header (see MLCommons license examples in `CONTRIBUTING.md`).
- Prefer descriptive, scoped names for generated files (e.g., `*.gen.dart`, `*.pbtxt`).

## Testing Guidelines
- Unit tests live in `flutter/unit_test/` and are run via `make flutter/test` (or `flutter test unit_test/*`).
- Integration tests are under `flutter/integration_test/` (default target: `integration_test/first_test.dart`).
- Keep tests deterministic; device-specific behavior should be guarded or skipped.

## Commit & Pull Request Guidelines
- Commit messages follow Conventional Commits: `feat: ...`, `fix: ...`, `chore: ...`, `ci: ...` with optional scopes.
- PRs should include a concise summary, linked issue (if available), and screenshots for UI changes.
- Ensure CLA requirements and CI checks pass before requesting review.

## Configuration Notes
- Common build flags: `OFFICIAL_BUILD`, `FLUTTER_BUILD_NUMBER`, `FLUTTER_TEST_DEVICE`.
- Firebase config is generated from `flutter/lib/firebase/firebase_options.env` via `make flutter/firebase-config`.
