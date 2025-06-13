# 🌤 Seasons

**Seasons** é um Swift Package, que fornece a estação do ano atual com base em uma data e no hemisfério do usuário.

---

## 🧭 Funcionalidades

- ✅ Determina a estação atual (`.spring`, `.summer`, `.autumn`, `.winter`)
- ✅ Suporte a hemisfério norte e sul
- ✅ Localização automática (EN, PT, ES)
- ✅ Compatível com Swift Package Manager

---

## 📦 Instalação (Swift Package Manager)

1. No Xcode:  
   `File > Add Packages...`

2. Use a URL do repositório:

```
https://github.com/UINick/Seasons.git
```

---

## 🛠 Uso básico

```swift
import Seasons

let season = SeasonManager.currentSeason(hemisphere: .south)
print("A estação atual é: \(season.localized)")
```

---

## 🗺 Suporte a Localização

O SDK retorna o nome da estação no idioma do sistema automaticamente:

| Idioma | Resultado |
|--------|-----------|
| EN     | Summer    |
| PT-BR  | Verão     |
| ES     | Verano    |

---

## 📁 Estrutura do Projeto

```
Sources/
└── SeasonsSDK/
    ├── Season.swift          # Enum com as estações
    ├── SeasonManager.swift   # Lógica de cálculo
    └── Resources/
        └── Localizable.xcstrings
```

---


