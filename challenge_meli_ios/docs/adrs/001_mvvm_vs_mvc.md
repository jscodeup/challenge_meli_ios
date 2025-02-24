# ADR 001: MVVM vs MVC

## Context
The project needed a structured way to separate business logic from UI.
The main options considered were:
- MVC 
- MVVM 

## Decision
- MVVM was chosen because it:
  - Reduces the responsibility of ViewControllers (prevents "Massive View Controller").
  - Facilitates testing by isolating logic in ViewModels.
  - Follows Clean Architecture principles.

## Consequences
- The UI updates via data binding.
- ViewModels handle API requests and prepare data for views.
- The separation between View and ViewModel improves testability.

