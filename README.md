
# challenge_meli_ios
An iOS app developed in Swift using MVVM + Clean Architecture. It allows users to search for products on MercadoLibre and view their details by consuming the public MercadoLibre API.

Main Features
    •    Product search by name.
    •    Product list with images and prices in Colombian pesos (COP).
    •    Detail screen with additional product information.
    •    Error handling with user alerts.
    •    Rotation support without losing the current state.
    •    Architecture based on MVVM + Clean Architecture.
    •    Unit and UI tests to validate functionality.
    
Technologies Used
    •    Swift 5
    •    UIKit
    •    MVVM + Clean Architecture
    •    Kingfisher (for loading images)
    •    XCTest (for unit and UI testing)
    
APIs Used

This application uses MercadoLibre's public API to retrieve products and their details.

Product Search
https://api.mercadolibre.com/sites/MCO/search?q={QUERY}

Example: https://api.mercadolibre.com/sites/MCO/search?q=iPhone

Product Details
https://api.mercadolibre.com/items/{ITEM_ID}

Example: https://api.mercadolibre.com/items/MCO1410570035

Project Structure

The project follows an MVVM + Clean Architecture structure, organized as follows:

The project is organized into multiple folders to maintain a clear separation of responsibilities:
    •    Presentation (Presentation Layer)
    ◦    Contains the views (Views), view models (ViewModels), and reusable UI components (Components).
    •    Domain (Domain Layer - Business Rules)
    ◦    Includes Entities (data models), UseCases (business logic operations), and Repositories (protocols that define data retrieval).
    •    Data (Data Layer - Data Access Implementation)
    ◦    Repositories: Implementations of the repositories defined in Domain.
    ◦    DataSources: Divided into Remote (for API calls) and Local (for local storage, if used).
    ◦    Mappers: Responsible for transforming data between the data layer and the domain layer.
    •    Core (Core Functions and Utilities)
    ◦    Utils: Contains helper functions and utilities such as NumberFormatterHelper.swift, which formats prices in Colombian pesos.
    •    DI (Dependency Injection)
    ◦    Manages dependency injection configurations.
    •    Networking (Networking Layer)
    ◦    Handles API requests and error management.
    •    Tests (Unit Tests)
    ◦    Contains unit test files to verify the correct functionality of key classes.
    •    UITests (User Interface Tests)
    ◦    Includes automated tests to validate the UI and user experience.

Implemented Tests
Unit and UI tests have been developed to validate the application's functionality.
Unit Tests
    •    ProductListViewModelTests.swift: Verifies that product search works correctly.
    •    ProductDetailViewModelTests.swift: Ensures that product details are retrieved correctly.
    •    NumberFormatterHelperTests.swift: Validates that prices are formatted correctly.
UI Tests
    •    ProductListUITests.swift: Simulates a product search and verifies that results are displayed.
    •    ProductDetailUITests.swift: Simulates selecting a product and checks that the detail screen is displayed.
    •    RotationUITests.swift: Verifies that the state is maintained after rotating the screen.





