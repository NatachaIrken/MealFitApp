# MealFitApp

**MealFitApp** is a simple SwiftUI application designed to help users track their daily meals, write personal notes, and view progress over time. The app is built with a focus on clean navigation using the **Coordinator pattern**, allowing scalable and maintainable routing logic between views.

---

## 📱 Features

- **Add and list meals** (breakfast, lunch, snacks, etc.)
- **Write and save notes**
- **View progress** (total meals tracked)
- **Settings view** (logout simulation)

---

## Navigation & Coordinator Pattern

The app uses a custom `MealCoordinator` class to manage navigation with `NavigationStack` and `NavigationPath`, allowing decoupled routing logic across the entire SwiftUI app.

### Coordinator Highlights:

- Centralized `navigate(to:)` method with enum-based routing
- Navigation is driven by an enum: `AppDestination`  
- Views push or reset the navigation stack via the `coordinator` instance

### AppDestination Enum:

```swift
enum AppDestination: Hashable {
    case home(String)
    case meals
    case progress
    case notes
    case settings
}
