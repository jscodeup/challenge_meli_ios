
RFC 001 - Choice of MVVM + Clean Architecture

Date: 2025-02-24
Author: Julian Salazar
Status: Approved 

1.Context

The project requires a scalable, modular, and maintainable architecture for an app that interacts with the MercadoLibre API. Different architectural patterns were evaluated, including MVC and MVVM + Clean Architecture.

2. Decision Taken

The decision was made to implement MVVM + Clean Architecture because:

- It better separates responsibilities, avoiding Massive ViewControllers.
- It facilitates unit testing by isolating business logic.
- It allows scalability and makes it easier to add new features.

3. Considered Alternatives
MVC (Model-View-Controller)

- Can lead to Massive ViewControllers, where too much logic is handled in the controllers.
- Hard to scale and maintain in large projects.

VIPER
- More modular, but introduces unnecessary complexity for the scope of this project.


4. Impact

- Improves code separation, making it easier to maintain.
- Enhances testability by isolating business logic.
- Ensures the app follows modern iOS best practices.
