# ADR 004 Use of Kingfisher for Image Loading and Caching


## Context
The app fetches dynamic images from the MercadoLibre API, requiring an efficient solution for image loading and caching. The main options considered were:

    - Kingfisher
    - SDWebImage
    - Manual URLSession with caching implementation

## Decision
    Kingfisher was chosen because it:
        - Asynchronously loads images, preventing UI blocking.
        - Implements built-in caching, reducing network usage.
        - Handles image loading errors gracefully.
        - Is lightweight and well-maintained by the community.
        - Provides smooth animations and transitions for images.

## Consequences
    - Images will be cached, minimizing redundant network requests.
    - The UI remains responsive even when fetching multiple images.
    - Dependency on a third-party library requires updating Kingfisher as needed.
    - Future improvements could include preloading images for an even smoother experience.
