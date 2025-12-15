# Grocery App

A Flutter application for managing your grocery shopping list. Add, view, and organize grocery items by category with a simple and intuitive interface.

## Features

- ✅ View grocery list with categorized items
- ✅ Add new grocery items with name, quantity, and category
- ✅ Category color indicators for easy identification
- ✅ Form validation for input fields
- ✅ Reset form functionality
- ✅ Dark theme UI

## Screenshots / Demo

*Add screenshots of your app here*

## Installation and Setup

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- Git

### Clone the Repository

```bash
git clone https://github.com/LK-Hour/W12-Navigation.git
cd grocery_app
```

### Install Dependencies

```bash
flutter pub get
```

### Verify Installation

```bash
flutter doctor
```

## How to Run the App

### Run on Linux

```bash
flutter run -d linux
```

### Run on Other Platforms

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows
```


## Project Structure

```
grocery_app/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── data/
│   │   ├── mock_grocery_repository.dart   # Mock data store
│   │   └── models/
│   │       └── grocery.dart               # Grocery & Category models
│   └── ui/
│       └── groceries/
│           ├── grocery_list.dart          # List view screen
│           └── grocery_form.dart          # Add item form screen
├── android/                               # Android platform files
├── ios/                                   # iOS platform files
├── linux/                                 # Linux platform files
├── windows/                               # Windows platform files
├── web/                                   # Web platform files
├── pubspec.yaml                           # Dependencies & assets
└── README.md                              # This file
```

## Key Flutter Concepts Used

### 1. setState() - State Management

`setState()` tells Flutter to rebuild the widget when data changes.

```dart
void updateData() {
  setState(() {
    // Change your state variables here
    _selectedCategory = newCategory;
  });
  // Flutter automatically calls build() after this
}
```

**How it works:**
1. You call `setState(() { ... })`
2. Flutter marks the widget as "dirty"
3. Flutter calls the `build()` method again
4. The UI updates with new values

### 2. Navigator - Screen Navigation

Navigator manages the screen stack (like a deck of cards).

```dart
// Push - Open new screen and wait for result
final result = await Navigator.of(context).push(
  MaterialPageRoute(builder: (ctx) => NewScreen()),
);

// Pop - Close screen and return value
Navigator.of(context).pop(returnValue);
```

**Flow:**
```
Screen A → push() → Screen B
         ← pop(data) ←
```

### 3. DropdownButtonFormField - Dropdown Selection

Key points for proper implementation:

```dart
DropdownButtonFormField<GroceryCategory>(
  value: _selectedCategory,           // Use 'value' not 'initialValue'
  decoration: InputDecoration(
    labelText: 'Category',
  ),
  items: GroceryCategory.values
    .map((category) => DropdownMenuItem(
      value: category,
      child: Text(category.label),
    ))
    .toList(),
  onChanged: (value) {
    setState(() {
      _selectedCategory = value!;     // Update state on change
    });
  },
)
```

**Important:**
- Use `value` (not `initialValue`) to make dropdown reactive
- Call `setState()` in `onChanged` to update the UI
- Provide a `decoration` for consistent styling

### 4. Form Validation Pattern

```dart
String? _errorMessage;  // State variable for error

void validateInput() {
  if (inputIsInvalid) {
    setState(() {
      _errorMessage = "Error text";  // Set error
    });
    return;
  }
  
  setState(() {
    _errorMessage = null;  // Clear error on success
  });
}

// In TextField:
TextField(
  decoration: InputDecoration(
    errorText: _errorMessage,  // Display error
  ),
)
```

## Data Models

### GroceryCategory Enum

```dart
enum GroceryCategory {
  vegetables, fruit, meat, dairy, carbs, 
  sweets, spices, convenience, hygiene, other
}
```

Each category has:
- `label`: Display name (e.g., "Vegetables")
- `color`: Color indicator for UI

### Grocery Class

```dart
class Grocery {
  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;
}
```

## Common Issues & Solutions

### Issue: Dropdown shows nothing
**Solution:** Use `value` instead of `initialValue` in DropdownButtonFormField

### Issue: Error messages don't show
**Solution:** Use state variables with `setState()` and connect them to TextField's `errorText`

### Issue: New items don't appear in list
**Solution:** Add item to repository and call `setState()` in the list screen after Navigator.pop()

## Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/intro)

## License

This project is for educational purposes.

## Author

LK-Hour - [GitHub](https://github.com/LK-Hour)
