# ADR 003: Use of Firebase Crashlytics for Monitoring


## Context
    The project required an efficient way to track crashes, monitor errors, and analyze performance. The primary options considered were:

    - Firebase Crashlytics
    - Sentry
    - Apple's Built-in Crash Reports (Xcode Organizer)

## Decision
    Firebase Crashlytics was chosen because it:
        - Provides real-time crash reporting with stack traces.
        - Offers automatic issue tracking and alerting.
        - Integrates seamlessly with iOS and Swift.
        - Has a free tier suitable for small to medium applications.
        - Supports performance monitoring alongside crash reports.

## Consequences
    - Errors and crashes will be automatically reported in real-time.
    - Developers can analyze stack traces to debug efficiently.
    - Integration with Firebase may require maintaining GoogleService-Info.plist properly.
    - Future improvements could include custom logs and events to enhance debugging.
