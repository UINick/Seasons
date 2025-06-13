# 🌤 Seasons

**Seasons** is a Swift Package that provides the current season based on a given date and the user's hemisphere.

---

## 🧭 Features

- ✅ Determines the current season (`.spring`, `.summer`, `.autumn`, `.winter`)
- ✅ Supports both northern and southern hemispheres
- ✅ Automatically localized (EN, PT, ES)
- ✅ Compatible with Swift Package Manager

---

## 📦 Installation (Swift Package Manager)

1. In Xcode:  
   `File > Add Packages...`

2. Use the repository URL:

```
https://github.com/UINick/Seasons.git
```

---

## 🛠 Basic Usage

```swift
import Seasons

let seasonAtBrazil = SeasonManager.currentSeason(hemisphere: .south)
print("The current season is: \(seasonAtBrazil.localized)")
```

```swift
import Seasons

let seasonAtChile = SeasonManager.currentSeason(latitude: -23.5, date: Date())
print("Current season based on latitude: \(seasonAtChile.localized)")
```

```swift

let location = CLLocation(latitude: 40.7, longitude: -74.0) // Nova York
let seasonAtNewYork = SeasonManager.currentSeason(from: location, date: Date())
print("Season from CLLocation: \(seasonAtNewYork.localized)")
```

```swift

if let (start, end) = SeasonManager.seasonDates(for: Date(), hemisphere: .north) {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium

    print("Season range: \(formatter.string(from: start)) → \(formatter.string(from: end))")
}
```

```swift

let today = Date()
let seasonFromHemi = today.season(hemisphere: .south)
let seasonFromLat = today.season(latitude: -23.5)

```

---

## 🗺 Localization Support

The SDK automatically returns the season name in the system's language:

| Language | Result   |
|----------|----------|
| EN       | Summer   |
| PT-BR    | Verão    |
| ES       | Verano   |

---

## 📁 Project Structure

```
Sources/
└── Seasons/
    ├── Season.swift          # Enum for seasons
    ├── SeasonManager.swift   # Calculation logic
    └── Resources/
        └── Localizable.xcstrings
```
