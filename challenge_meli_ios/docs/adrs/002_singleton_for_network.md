# ADR 002: Singleton for Network Management

## Context
The app needed a central class to handle API requests efficiently.

## Decision
- A Singleton pattern was used for the `NetworkManager` to:
  - Ensure a single instance of `URLSession`.
  - Reduce memory consumption by avoiding unnecessary instances.
  - Standardize network calls across the app.

## Consequences
- All API requests go through `NetworkManager.shared.fetchData()`.
- Improved code reusability and maintainability.
- Easier to add features like caching in the future.

