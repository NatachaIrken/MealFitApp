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
```

<img src="https://github.com/user-attachments/assets/28ec88dd-1b49-4ddf-b6e2-6cbb34c6b679" width="300" alt="Login" />
<img src="https://github.com/user-attachments/assets/62ca20bc-56e1-42c8-9008-66eb825ee9c7" width="300" alt="HomeMenu" />
<img src="https://github.com/user-attachments/assets/d0956e40-ccf7-415e-bca5-66d2717c6719" width="300" alt="MealMenu" />


