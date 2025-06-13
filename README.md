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

let season = SeasonManager.currentSeason(hemisphere: .south)
print("The current season is: \(season.localized)")
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
