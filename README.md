# challenge_meli_ios

An iOS app developed in Swift using MVVM + Clean Architecture. It allows users to search for products on MercadoLibre and view their details by consuming the public MercadoLibre API.

## 📌 Main Features
- Product search by name.
- Product list with images and prices in **Colombian pesos (COP)**.
- Detail screen with additional product information.
- Error handling with user alerts.
- Rotation support without losing the current state.
- Architecture based on **MVVM + Clean Architecture**.
- **Unit and UI tests** to validate functionality.

---

## 📌 Technologies Used
- **Swift 5**
- **UIKit**
- **MVVM + Clean Architecture**
- **Kingfisher** (for loading images)
- **XCTest** (for unit and UI testing)

---

## 📌 APIs Used

This application uses **MercadoLibre's public API** to retrieve products and their details.

### **🔍 Product Search**

https://api.mercadolibre.com/sites/MCO/search?q={QUERY}

**Example:**
[Search for iPhone](https://api.mercadolibre.com/sites/MCO/search?q=iPhone)

### **📄 Product Details**

https://api.mercadolibre.com/items/{ITEM_ID}

**Example:**
[Product Detail](https://api.mercadolibre.com/items/MCO1410570035)

---

## 📌 Project Structure

The project follows an **MVVM + Clean Architecture** structure, organized as follows:

### **📂 Presentation (Presentation Layer)**
- Contains **Views**, **ViewModels**, and reusable **UI Components**.

### **📂 Domain (Domain Layer - Business Rules)**
- **Entities**: Data models.
- **UseCases**: Business logic operations.
- **Repositories**: Protocols that define data retrieval.

### **📂 Data (Data Layer - Data Access Implementation)**
- **Repositories**: Implementations of repositories defined in the Domain layer.
- **DataSources**:
  - **Remote**: API calls.
  - **Local**: Local storage (if implemented).
- **Mappers**: Transforms data between the Data and Domain layers.

### **📂 Core (Core Functions and Utilities)**
- **Utils**: Contains helper functions and utilities such as `NumberFormatterHelper.swift`, which formats prices in Colombian pesos.

### **📂 Networking (Networking Layer)**
- Handles API requests, caching, and error management.

### **📂 DI (Dependency Injection)**
- Manages dependency injection configurations.

### **📂 Monitoring & Logs**
- Integrated **Firebase Crashlytics** for error tracking.

### **📂 Documentation**
- **ADRs** (Architecture Decision Records) and **RFCs** included for transparency and decision tracking.

---

## 📌 Implemented Tests

Both **Unit and UI tests** have been developed to validate the application's functionality.

### **🧪 Unit Tests**
- `ProductListViewModelTests.swift` → Verifies that product search works correctly.
- `ProductDetailViewModelTests.swift` → Ensures that product details are retrieved correctly.
- `NumberFormatterHelperTests.swift` → Validates that prices are formatted correctly.

### **🎭 UI Tests**
- `ProductListUITests.swift` → Simulates a product search and verifies that results are displayed.
- `ProductDetailUITests.swift` → Simulates selecting a product and checks that the detail screen is displayed.
- `RotationUITests.swift` → Verifies that the state is maintained after rotating the screen.

---

## 📌 How to Run the Project

1️⃣ Clone the repository:
```sh
git clone https://github.com/jscodeup/challenge_meli_ios.git
cd challenge_meli_ios

2️⃣ Open the project in Xcode:

open challenge_meli_ios.xcodeproj

3️⃣ Select a simulator and run the app:

    Press ⌘ + R to build and run.

📌 How to Run the Tests

To run all tests in Xcode:

⌘ + U

To run a specific test:

    1. Open the Test Navigator with ⌘ + 5.
    2. Click the play button next to the test you want to run.
    
📌 Firebase Crashlytics Integration

To test if Firebase Crashlytics is working:

    Trigger a test crash:

    fatalError("Test Crashlytics Crash")

    Run the app and check Firebase Console > Crashlytics.

📌 Architecture Diagram

Here is an MVVM + Clean Architecture diagram representing the app’s structure:

📂 docs/architecture.png  
    

📌 Future Improvements

🔹 Pagination in product searches.
🔹 Allow users to save favorite products.
🔹 Improve caching to optimize image loading performance.

📌 License

This project was developed as part of a technical challenge for MercadoLibre and is not intended for commercial use.

📌 Author

    Julian Salazar
    https://www.linkedin.com/in/henry-julian-salazar-salcedo-mobile-developer/
     

